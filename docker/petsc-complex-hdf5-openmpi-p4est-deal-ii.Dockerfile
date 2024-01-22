# Copyleft (c) January, 2024, Oromion

FROM ghcr.io/carlosal1015/aur/p4est-deal-ii AS p4est-deal-ii

FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

COPY --from=p4est-deal-ii /tmp/p4est-deal-ii-*.pkg.tar.zst /tmp/

ARG OPT_PACKAGES="\
  hdf5-openmpi \
  "

ARG AUR_PACKAGE="petsc-complex"

RUN yay --repo --needed --noconfirm --noprogressbar -Syuq && \
  yay --noconfirm -S ${OPT_PACKAGES} && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  yay -G ${AUR_PACKAGE} && \
  cd ${AUR_PACKAGE} && \
  makepkg -s --noconfirm 2>&1 | tee -a /tmp/$(date -u +"%Y-%m-%d-%H-%M-%S" --date='5 hours ago').log >/dev/null && \
  mkdir -p ~/.cache/yay/${AUR_PACKAGE} && \
  mv *.pkg.tar.zst ~/.cache/yay/${AUR_PACKAGE}

FROM archlinux:base-devel

RUN ln -s /usr/share/zoneinfo/America/Lima /etc/localtime && \
  sed -i 's/^#Color/Color/' /etc/pacman.conf && \
  sed -i '/#CheckSpace/a ILoveCandy' /etc/pacman.conf && \
  sed -i 's/^VerbosePkgLists/#VerbosePkgLists/' /etc/pacman.conf && \
  sed -i 's/^ParallelDownloads = 5/ParallelDownloads = 30/' /etc/pacman.conf && \
  sed -i 's/^#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(nproc)"/' /etc/makepkg.conf && \
  sed -i 's/^#BUILDDIR/BUILDDIR/' /etc/makepkg.conf && \
  printf '\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n' >> /etc/pacman.conf && \
  useradd -l -u 33333 -md /home/gitpod -s /bin/bash gitpod && \
  passwd -d gitpod && \
  echo 'gitpod ALL=(ALL) ALL' > /etc/sudoers.d/gitpod && \
  sed -i "s/PS1='\[\\\u\@\\\h \\\W\]\\\\\\$ '//g" /home/gitpod/.bashrc && \
  { echo && echo "PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \\\$ '" ; } >> /home/gitpod/.bashrc

USER gitpod

COPY --from=p4est-deal-ii /tmp/p4est-deal-ii-*.pkg.tar.zst /tmp/
COPY --from=build /tmp/*.log /tmp/
COPY --from=build /tmp/makepkg/petsc/src/petsc-*/arch-linux-c-opt/lib/petsc/conf/configure.log /tmp/
COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

ARG PACKAGES="\
  hdf5-openmpi \
  "

RUN sudo pacman-key --init && \
  sudo pacman-key --populate archlinux && \
  sudo pacman --needed --noconfirm --noprogressbar -Sy archlinux-keyring && \
  sudo pacman --needed --noconfirm --noprogressbar -Syuq && \
  sudo pacman --needed --noconfirm --noprogressbar -S ${PACKAGES} && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  find /tmp/ ! -name '*.log' ! -name 'petsc-*.pkg.tar.zst' -type f -exec rm -f {} + && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/*