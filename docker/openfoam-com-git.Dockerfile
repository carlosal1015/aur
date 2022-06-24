# Copyleft (c) July, 2022, Oromion.

FROM ghcr.io/carlosal1015/aur/parmetis AS parmetis
FROM ghcr.io/carlosal1015/aur/scotch AS scotch
FROM ghcr.io/carlosal1015/aur/kahip AS kahip

FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

COPY --from=parmetis /tmp/parmetis-*.pkg.tar.zst /tmp/
COPY --from=scotch /tmp/scotch-*.pkg.tar.zst /tmp/
COPY --from=kahip /tmp/kahip-*.pkg.tar.zst /tmp/

ARG AUR_PACKAGES="\
  openfoam-com-git \
  "

RUN sudo pacman --needed --noconfirm --noprogressbar -Syyuq && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  yay --needed --noconfirm --noprogressbar -Syyuq && \
  yay --noconfirm -S ${AUR_PACKAGES}

FROM archlinux:base-devel

RUN ln -s /usr/share/zoneinfo/America/Lima /etc/localtime && \
  sed -i 's/^#Color/Color/' /etc/pacman.conf && \
  sed -i '/#CheckSpace/a ILoveCandy' /etc/pacman.conf && \
  sed -i 's/^ParallelDownloads = 5/ParallelDownloads = 30/' /etc/pacman.conf && \
  sed -i 's/^VerbosePkgLists/#VerbosePkgLists/' /etc/pacman.conf && \
  sed -i 's/^#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(nproc)"/' /etc/makepkg.conf && \
  sed -i 's/^#BUILDDIR/BUILDDIR/' /etc/makepkg.conf && \
  printf '\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n' >> /etc/pacman.conf && \
  useradd -l -u 33333 -md /home/gitpod -s /bin/bash gitpod && \
  passwd -d gitpod && \
  echo 'gitpod ALL=(ALL) ALL' > /etc/sudoers.d/gitpod && \
  sed -i "s/PS1='\[\\\u\@\\\h \\\W\]\\\\\\$ '//g" /home/gitpod/.bashrc && \
  { echo && echo "PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \\\$ '" ; } >> /home/gitpod/.bashrc

USER gitpod

COPY --from=parmetis /tmp/parmetis-*.pkg.tar.zst /tmp/
COPY --from=scotch /tmp/scotch-*.pkg.tar.zst /tmp/
COPY --from=kahip /tmp/kahip-*.pkg.tar.zst /tmp/
COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

RUN sudo pacman --needed --noconfirm --noprogressbar -Syyuq && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/*

CMD ["/bin/bash"]