# Copyleft (c) March, 2024, Oromion

FROM ghcr.io/carlosal1015/aur/gklib AS gklib
FROM ghcr.io/carlosal1015/aur/metis AS metis
FROM ghcr.io/carlosal1015/aur/parmetis-git AS parmetis-git
FROM ghcr.io/carlosal1015/aur/petsc-complex AS petsc-complex
FROM ghcr.io/carlosal1015/aur/basix AS basix
FROM ghcr.io/carlosal1015/aur/python-fenics-basix AS python-fenics-basix
FROM ghcr.io/carlosal1015/aur/python-fenics-ufl AS python-fenics-ufl
FROM ghcr.io/carlosal1015/aur/python-fenics-ffcx AS python-fenics-ffcx
FROM ghcr.io/carlosal1015/aur/scotch AS scotch
FROM ghcr.io/carlosal1015/aur/kahip AS kahip
FROM ghcr.io/carlosal1015/aur/dolfinx-complex AS dolfinx-complex

FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

COPY --from=gklib /tmp/gklib-*.pkg.tar.zst /tmp/
COPY --from=metis /tmp/metis-*.pkg.tar.zst /tmp/
COPY --from=parmetis-git /tmp/parmetis-git-*.pkg.tar.zst /tmp/
COPY --from=petsc-complex /tmp/petsc-*.pkg.tar.zst /tmp/
COPY --from=basix /tmp/basix-*.pkg.tar.zst /tmp/
COPY --from=python-fenics-basix /tmp/python-fenics-basix-*.pkg.tar.zst /tmp/
COPY --from=python-fenics-ufl /tmp/python-fenics-ufl-*.pkg.tar.zst /tmp/
COPY --from=python-fenics-ffcx /tmp/python-fenics-ffcx-*.pkg.tar.zst /tmp/
COPY --from=scotch /tmp/scotch-*.pkg.tar.zst /tmp/
COPY --from=kahip /tmp/kahip-*.pkg.tar.zst /tmp/
COPY --from=dolfinx-complex /tmp/dolfinx-*.pkg.tar.zst /tmp/

ARG AUR_PACKAGE="python-fenics-dolfinx"

RUN yay --repo --needed --noconfirm --noprogressbar -Syuq >/dev/null 2>&1 && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  yay -G ${AUR_PACKAGE} && \
  cd ${AUR_PACKAGE} && \
  makepkg -s --nocheck --noconfirm 2>&1 | tee -a /tmp/$(date -u +"%Y-%m-%d-%H-%M-%S" --date='5 hours ago').log >/dev/null && \
  sudo pacman --noconfirm --noprogressbar -S namcap && \
  namcap ${AUR_PACKAGE}-*.pkg.tar.zst 2>&1 | tee -a /tmp/namcap.log >/dev/null && \
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

COPY --from=gklib /tmp/gklib-*.pkg.tar.zst /tmp/
COPY --from=metis /tmp/metis-*.pkg.tar.zst /tmp/
COPY --from=parmetis-git /tmp/parmetis-git-*.pkg.tar.zst /tmp/
COPY --from=petsc-complex /tmp/petsc-*.pkg.tar.zst /tmp/
COPY --from=basix /tmp/basix-*.pkg.tar.zst /tmp/
COPY --from=python-fenics-basix /tmp/python-fenics-basix-*.pkg.tar.zst /tmp/
COPY --from=python-fenics-ufl /tmp/python-fenics-ufl-*.pkg.tar.zst /tmp/
COPY --from=python-fenics-ffcx /tmp/python-fenics-ffcx-*.pkg.tar.zst /tmp/
COPY --from=scotch /tmp/scotch-*.pkg.tar.zst /tmp/
COPY --from=kahip /tmp/kahip-*.pkg.tar.zst /tmp/
COPY --from=dolfinx-complex /tmp/dolfinx-*.pkg.tar.zst /tmp/
COPY --from=build /tmp/*.log /tmp/
COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

RUN sudo pacman-key --init && \
  sudo pacman-key --populate archlinux && \
  sudo pacman --needed --noconfirm --noprogressbar -Sy archlinux-keyring && \
  sudo pacman --needed --noconfirm --noprogressbar -Syuq >/dev/null 2>&1 && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  find /tmp/ ! -name '*.log' ! -name 'python-fenics-dolfinx-*.pkg.tar.zst' -type f -exec rm -f {} + && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/*