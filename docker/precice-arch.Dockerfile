# Copyleft (c) April, 2022, Oromion.
FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

# https://aur.archlinux.org/packages/dolfin#comment-845953
ARG AUR_PACKAGES="\
  cmake \
  python-fenicsprecice \
  precice-config-visualizer-git \
  python-nutils \
  calculix-precice \
  "

RUN yay --noconfirm --noprogressbar -Syyuq ${AUR_PACKAGES}

FROM archlinux:base-devel

RUN ln -s /usr/share/zoneinfo/America/Lima /etc/localtime && \
  sed -i 's/^#Color/Color/' /etc/pacman.conf && \
  sed -i '/#CheckSpace/a ILoveCandy' /etc/pacman.conf && \
  sed -i 's/^ParallelDownloads = 5/ParallelDownloads = 30/' /etc/pacman.conf && \
  sed -i 's/^VerbosePkgLists/#VerbosePkgLists/' /etc/pacman.conf && \
  sed -i 's/^#BUILDDIR/BUILDDIR/' /etc/makepkg.conf && \
  sed -i 's/ usr\/share\/doc\/\*//g' /etc/pacman.conf && \
  sed -i 's/usr\/share\/man\/\* //g' /etc/pacman.conf && \
  sed -i 's/^#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(nproc)"/' /etc/makepkg.conf && \
  sed -i 's/^#BUILDDIR/BUILDDIR/' /etc/makepkg.conf && \
  echo -e '\n[multilib]\nInclude = /etc/pacman.d/mirrorlist' | tee -a /etc/pacman.conf && \
  useradd -l -u 33333 -md /home/gitpod -s /bin/bash gitpod && \
  passwd -d gitpod && \
  echo 'gitpod ALL=(ALL) ALL' > /etc/sudoers.d/gitpod && \
  sed -i "s/PS1='\[\\\u\@\\\h \\\W\]\\\\\\$ '//g" /home/gitpod/.bashrc && \
  { echo && echo "PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \\\$ '" ; } >> /home/gitpod/.bashrc

USER gitpod

ARG PACKAGES="\
  cmake \
  gcc-fortran \
  doxygen \
  clang \
  jq \
  autopep8 \
  mypy \
  ipython \
  python-matplotlib \
  bat \
  tldr \
  git \
  zsh \
  python-sphinx-furo \
  cython \
  tree \
  imagemagick \
  "

COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

RUN sudo pacman --noconfirm -Syyuq && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst

ARG ALIAS="https://raw.githubusercontent.com/precice/vm/main/provisioning/.alias"

ADD ${ALIAS} /home/gitpod/

RUN sudo pacman --needed --noconfirm --noprogressbar -Syyuq ${PACKAGES} && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  rm /tmp/*.pkg.tar.zst && \
  sudo pacman -Scc <<< Y <<< Y && \
  echo -e '\n[precice-arch]\nSigLevel = Optional TrustAll\nServer = https://dune-archiso.gitlab.io/testing/precice-arch/$arch\n' | sudo tee -a /etc/pacman.conf && \
  printf 'Y\n' | bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended && \
  sudo chown gitpod:gitpod ${HOME}/.alias && \
  echo 'source ${HOME}/.alias' >> ~/.zshrc

ENV OMPI_MCA_opal_warn_on_missing_libcuda=0

ENTRYPOINT [ "/bin/zsh" ]
CMD ["-l"]
