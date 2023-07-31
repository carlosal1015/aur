# Copyleft (c) December, 2023, Oromion.

FROM ghcr.io/carlosal1015/aur/gklib AS gklib
FROM ghcr.io/carlosal1015/aur/metis AS metis
FROM ghcr.io/carlosal1015/aur/parmetis AS parmetis
FROM ghcr.io/carlosal1015/aur/scotch AS scotch
FROM ghcr.io/carlosal1015/aur/petsc AS petsc
FROM ghcr.io/carlosal1015/aur/python-dijitso AS python-dijitso
FROM ghcr.io/carlosal1015/aur/python-fiat AS python-fiat
FROM ghcr.io/carlosal1015/aur/python-ufl AS python-ufl
FROM ghcr.io/carlosal1015/aur/python-ffc AS python-ffc
FROM ghcr.io/carlosal1015/aur/dolfin-real AS dolfin-real
FROM ghcr.io/carlosal1015/aur/python-dolfin-real AS python-dolfin-real
FROM ghcr.io/carlosal1015/aur/openfoam-com AS openfoam-com

FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

COPY --from=gklib /tmp/gklib-*.pkg.tar.zst /tmp/
COPY --from=metis /tmp/metis-*.pkg.tar.zst /tmp/
COPY --from=parmetis /tmp/parmetis-*.pkg.tar.zst /tmp/
COPY --from=scotch /tmp/scotch-*.pkg.tar.zst /tmp/
COPY --from=petsc /tmp/petsc-*.pkg.tar.zst /tmp/
COPY --from=python-dijitso /tmp/python-dijitso-*.pkg.tar.zst /tmp/
COPY --from=python-fiat /tmp/python-fiat-*.pkg.tar.zst /tmp/
COPY --from=python-ufl /tmp/python-ufl-*.pkg.tar.zst /tmp/
COPY --from=python-ffc /tmp/python-ffc-*.pkg.tar.zst /tmp/
COPY --from=dolfin-real /tmp/dolfin-*.pkg.tar.zst /tmp/
COPY --from=python-dolfin-real /tmp/python-dolfin-*.pkg.tar.zst /tmp/
COPY --from=openfoam-com /tmp/openfoam-com-*.pkg.tar.zst /tmp/

ARG AUR_PACKAGES="\
  calculix-precice \
  openfoam-com-precice \
  python-fenicsprecice \
  python-micro-manager-precice \
  python-nutils \
  precice-config-visualizer-git \
  "

RUN yay --repo --needed --noconfirm --noprogressbar -Syyuq && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  yay --noconfirm -S ${AUR_PACKAGES} 2>&1 | tee -a /tmp/$(date -u +"%Y-%m-%d-%H-%M-%S" --date='5 hours ago').log >/dev/null

FROM archlinux:base-devel

RUN ln -s /usr/share/zoneinfo/America/Lima /etc/localtime && \
  sed -i 's/^#Color/Color/' /etc/pacman.conf && \
  sed -i '/#CheckSpace/a ILoveCandy' /etc/pacman.conf && \
  sed -i 's/^VerbosePkgLists/#VerbosePkgLists/' /etc/pacman.conf && \
  sed -i 's/^ParallelDownloads = 5/ParallelDownloads = 30/' /etc/pacman.conf && \
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
  python-setuptools \
  python-pkgconfig \
  tree \
  imagemagick \
  "

ARG ALIAS="https://raw.githubusercontent.com/precice/vm/main/provisioning/.alias"

ADD ${ALIAS} /home/gitpod/

ARG GPG_KEY="8C43C00BA8F06ECA"

COPY --from=gklib /tmp/gklib-*.pkg.tar.zst /tmp/
COPY --from=metis /tmp/metis-*.pkg.tar.zst /tmp/
COPY --from=parmetis /tmp/parmetis-*.pkg.tar.zst /tmp/
COPY --from=scotch /tmp/scotch-*.pkg.tar.zst /tmp/
COPY --from=petsc /tmp/petsc-*.pkg.tar.zst /tmp/
COPY --from=python-dijitso /tmp/python-dijitso-*.pkg.tar.zst /tmp/
COPY --from=python-fiat /tmp/python-fiat-*.pkg.tar.zst /tmp/
COPY --from=python-ufl /tmp/python-ufl-*.pkg.tar.zst /tmp/
COPY --from=python-ffc /tmp/python-ffc-*.pkg.tar.zst /tmp/
COPY --from=dolfin-real /tmp/dolfin-*.pkg.tar.zst /tmp/
COPY --from=python-dolfin-real /tmp/python-dolfin-*.pkg.tar.zst /tmp/
COPY --from=openfoam-com /tmp/openfoam-com-*.pkg.tar.zst /tmp/
COPY --from=build /tmp/*.log /tmp/
COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

RUN sudo pacman-key --init && \
  sudo pacman-key --populate archlinux && \
  sudo pacman-key --recv-keys ${GPG_KEY} && \
  sudo pacman-key --finger ${GPG_KEY} && \
  sudo pacman-key --lsign-key ${GPG_KEY} && \
  sudo pacman --needed --noconfirm --noprogressbar -Sy archlinux-keyring && \
  sudo pacman --needed --noconfirm --noprogressbar -Syyuq && \
  sudo pacman --needed --noconfirm --noprogressbar -S ${PACKAGES} && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  rm /tmp/*.pkg.tar.zst && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/* && \
  echo -e '\n[precice-arch]\nSigLevel = Required DatabaseOptional\nServer = https://dune-archiso.gitlab.io/testing/precice-arch/$arch\n' | sudo tee -a /etc/pacman.conf && \
  printf 'Y\n' | bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended && \
  sudo chown gitpod:gitpod ${HOME}/.alias && \
  echo 'source ${HOME}/.alias' >> ~/.zshrc

ENV OMPI_MCA_opal_warn_on_missing_libcuda=0

ENTRYPOINT [ "/bin/zsh" ]
CMD ["-l"]
