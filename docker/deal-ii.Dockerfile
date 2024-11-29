# Copyleft (c) October, 2024, Oromion

FROM ghcr.io/carlosal1015/aur/kokkos AS kokkos
FROM ghcr.io/carlosal1015/aur/gklib AS gklib
FROM ghcr.io/carlosal1015/aur/metis AS metis
FROM ghcr.io/carlosal1015/aur/parmetis-git AS parmetis-git
FROM ghcr.io/carlosal1015/aur/superlu_dist AS superlu_dist
FROM ghcr.io/carlosal1015/aur/hypre AS hypre
FROM ghcr.io/carlosal1015/aur/petsc-hypre AS petsc
FROM ghcr.io/carlosal1015/aur/p4est-deal-ii AS p4est-deal-ii

FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

COPY --from=kokkos /tmp/kokkos-*.pkg.tar.zst /tmp/
COPY --from=gklib /tmp/gklib-*.pkg.tar.zst /tmp/
COPY --from=metis /tmp/metis-*.pkg.tar.zst /tmp/
COPY --from=parmetis-git /tmp/parmetis-git-*.pkg.tar.zst /tmp/
COPY --from=superlu_dist /tmp/superlu_dist-*.pkg.tar.zst /tmp/
COPY --from=hypre /tmp/hypre-*.pkg.tar.zst /tmp/
COPY --from=petsc /tmp/petsc-*.pkg.tar.zst /tmp/
COPY --from=p4est-deal-ii /tmp/p4est-deal-ii-*.pkg.tar.zst /tmp/

ARG OPT_PACKAGES="\
  hdf5-openmpi \
  suitesparse \
  "

ARG AUR_PACKAGE="deal-ii"

ARG PRECICE_PATCH="https://raw.githubusercontent.com/carlosal1015/aur/main/docker/0001-Enable-options-for-work-with-preCICE.patch"

# https://www.dealii.org/current/external-libs/petsc.html

RUN yay --repo --needed --noconfirm --noprogressbar -Syuq >/dev/null 2>&1 && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  yay --noconfirm -S ${OPT_PACKAGES} && \
  yay -G ${AUR_PACKAGE} && \
  cd ${AUR_PACKAGE} && \
  git config --global user.email github-actions@github.com && \
  git config --global user.name github-actions && \
  curl -O ${PRECICE_PATCH} && \
  git am --signoff < 0001-Enable-options-for-work-with-preCICE.patch && \
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

ARG PACKAGES="\
  cmake \
  git \
  suitesparse \
  "

COPY --from=kokkos /tmp/kokkos-*.pkg.tar.zst /tmp/
COPY --from=gklib /tmp/gklib-*.pkg.tar.zst /tmp/
COPY --from=metis /tmp/metis-*.pkg.tar.zst /tmp/
COPY --from=parmetis-git /tmp/parmetis-git-*.pkg.tar.zst /tmp/
COPY --from=superlu_dist /tmp/superlu_dist-*.pkg.tar.zst /tmp/
COPY --from=hypre /tmp/hypre-*.pkg.tar.zst /tmp/
COPY --from=petsc /tmp/petsc-*.pkg.tar.zst /tmp/
COPY --from=p4est-deal-ii /tmp/p4est-deal-ii-*.pkg.tar.zst /tmp/
COPY --from=build /tmp/*.log /tmp/
COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

RUN sudo pacman-key --init && \
  sudo pacman-key --populate archlinux && \
  sudo pacman --needed --noconfirm --noprogressbar -Sy archlinux-keyring && \
  sudo pacman --needed --noconfirm --noprogressbar -Syuq >/dev/null 2>&1 && \
  sudo pacman --needed --noconfirm --noprogressbar -S ${PACKAGES} && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  find /tmp/ ! -name '*.log' ! -name 'deal-ii-*.pkg.tar.zst' -type f -exec rm -f {} + && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/*

ENV DEAL_II_NUM_THREADS=1