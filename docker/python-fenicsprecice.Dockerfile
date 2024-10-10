# Copyleft (c) October, 2024, Oromion

FROM ghcr.io/carlosal1015/aur/petsc AS petsc
FROM ghcr.io/carlosal1015/aur/python-dijitso AS python-dijitso
FROM ghcr.io/carlosal1015/aur/python-fiat AS python-fiat
FROM ghcr.io/carlosal1015/aur/python-ufl AS python-ufl
FROM ghcr.io/carlosal1015/aur/python-ffc AS python-ffc
FROM ghcr.io/carlosal1015/aur/scotch AS scotch
FROM ghcr.io/carlosal1015/aur/dolfin-real AS dolfin-real
FROM ghcr.io/carlosal1015/aur/python-dolfin-real AS python-dolfin-real
FROM ghcr.io/carlosal1015/aur/precice AS precice
FROM ghcr.io/carlosal1015/aur/python-pyprecice AS python-pyprecice

FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

COPY --from=petsc /tmp/petsc-*.pkg.tar.zst /tmp/
COPY --from=python-dijitso /tmp/python-dijitso-*.pkg.tar.zst /tmp/
COPY --from=python-fiat /tmp/python-fiat-*.pkg.tar.zst /tmp/
COPY --from=python-ufl /tmp/python-ufl-*.pkg.tar.zst /tmp/
COPY --from=python-ffc /tmp/python-ffc-*.pkg.tar.zst /tmp/
COPY --from=scotch /tmp/scotch-*.pkg.tar.zst /tmp/
COPY --from=dolfin-real /tmp/dolfin-*.pkg.tar.zst /tmp/
COPY --from=python-dolfin-real /tmp/python-dolfin-*.pkg.tar.zst /tmp/
COPY --from=precice /tmp/precice-*.pkg.tar.zst /tmp/
COPY --from=python-pyprecice /tmp/python-pyprecice-*.pkg.tar.zst /tmp/

ARG AUR_PACKAGE="python-fenicsprecice"

RUN yay --repo --needed --noconfirm --noprogressbar -Syuq >/dev/null 2>&1 && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  yay -G ${AUR_PACKAGE} && \
  cd ${AUR_PACKAGE} && \
  makepkg -s --noconfirm 2>&1 | tee -a /tmp/$(date -u +"%Y-%m-%d-%H-%M-%S" --date='5 hours ago').log >/dev/null && \
  sudo pacman --noconfirm --noprogressbar -S namcap && \
  namcap ${AUR_PACKAGE}-*.pkg.tar.zst 2>&1 | tee -a /tmp/namcap.log >/dev/null && \
  mkdir -p ~/.cache/yay/${AUR_PACKAGE} && \
  mv *.pkg.tar.zst ~/.cache/yay/${AUR_PACKAGE}

FROM archlinux:base-devel

RUN ln -s /usr/share/zoneinfo/America/Lima /etc/localtime && \
  sed -i 's/^#Color/Color/' /etc/pacman.conf && \
  sed -i '/#CheckSpace/a ILoveCandy' /etc/pacman.conf && \
  sed -i 's/^ParallelDownloads = 5/ParallelDownloads = 30/' /etc/pacman.conf && \
  printf '\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n' >> /etc/pacman.conf && \
  sed -i 's/^#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(nproc)"/' /etc/makepkg.conf && \
  sed -i 's/^#BUILDDIR/BUILDDIR/' /etc/makepkg.conf && \
  sed -i 's/purge debug lto/purge !debug !lto/' /etc/makepkg.conf && \
  sed -i 's/man,//g' /etc/makepkg.conf && \
  sed -i 's/doc,//g' /etc/makepkg.conf && \
  useradd -l -u 33333 -md /home/gitpod -s /bin/bash gitpod && \
  passwd -d gitpod && \
  echo 'gitpod ALL=(ALL) ALL' > /etc/sudoers.d/gitpod && \
  sed -i "s/PS1='\[\\\u\@\\\h \\\W\]\\\\\\$ '//g" /home/gitpod/.bashrc && \
  { echo && echo "PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \\\$ '" ; } >> /home/gitpod/.bashrc

USER gitpod

COPY --from=petsc /tmp/petsc-*.pkg.tar.zst /tmp/
COPY --from=python-dijitso /tmp/python-dijitso-*.pkg.tar.zst /tmp/
COPY --from=python-fiat /tmp/python-fiat-*.pkg.tar.zst /tmp/
COPY --from=python-ufl /tmp/python-ufl-*.pkg.tar.zst /tmp/
COPY --from=python-ffc /tmp/python-ffc-*.pkg.tar.zst /tmp/
COPY --from=scotch /tmp/scotch-*.pkg.tar.zst /tmp/
COPY --from=dolfin-real /tmp/dolfin-*.pkg.tar.zst /tmp/
COPY --from=python-dolfin-real /tmp/python-dolfin-*.pkg.tar.zst /tmp/
COPY --from=precice /tmp/precice-*.pkg.tar.zst /tmp/
COPY --from=python-pyprecice /tmp/python-pyprecice-*.pkg.tar.zst /tmp/
COPY --from=build /tmp/*.log /tmp/
COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

RUN sudo pacman-key --init && \
  sudo pacman-key --populate archlinux && \
  sudo pacman --needed --noconfirm --noprogressbar -Sy archlinux-keyring && \
  sudo pacman --needed --noconfirm --noprogressbar -Syuq >/dev/null 2>&1 && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  find /tmp/ ! -name '*.log' ! -name 'python-fenicsprecice-*.pkg.tar.zst' -type f -exec rm -f {} + && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/*