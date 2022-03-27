# Copyleft (c) January, 2022, Oromion.
FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

ARG AUR_PACKAGES="\
  parmetis \
  scotch \
  kahip \
  "

RUN yay -Syyuq --noconfirm ${AUR_PACKAGES} && \
  yay -G openfoam-com && \
  cd openfoam-com && \
  git config --global user.email github-actions@github.com && \
  git config --global user.name github-actions && \
  curl -O https://gist.githubusercontent.com/carlosal1015/d56f9c2ad002defda281ed12b289185f/raw/a6799ff5f60dfb44c94f47fea5eed548e605d1bf/0001-C-14-for-CGAL-5-compatibility.patch && \
  git am --signoff < 0001-C-14-for-CGAL-5-compatibility.patch && \
  makepkg -s --noconfirm && \
  mkdir -p ~/.cache/yay/openfoam-com && \
  mv *.pkg.tar.zst ~/.cache/yay/openfoam-com

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

COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

RUN sudo pacman --noconfirm -Syyuq && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  sudo pacman -Scc <<< Y <<< Y

CMD ["/bin/bash"]