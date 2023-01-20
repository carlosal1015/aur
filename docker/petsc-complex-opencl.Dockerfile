# Copyleft (c) January, 2023, Oromion.

FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

ARG OPT_PACKAGES="\
  ocl-icd \
  opencl-headers \
  "

ARG AUR_PACKAGES="\
  petsc-complex \
  "

ARG PATCH="https://gist.githubusercontent.com/carlosal1015/0dfb20b96d1ab7464d3b11a2259b744d/raw/cdd962b4af5a66f0865c2790ca09bc1e7fbecc50/0001-Add-support-for-OpenCL.patch"

RUN yay --repo --needed --noconfirm --noprogressbar -Syyuq && \
  yay --noconfirm -S ${OPT_PACKAGES} && \
  yay -G ${AUR_PACKAGES} && \
  cd petsc-complex && \
  git config --global user.email github-actions@github.com && \
  git config --global user.name github-actions && \
  curl -O ${PATCH} && \
  git am --signoff < 0001-Add-support-for-OpenCL.patch && \
  makepkg -s --noconfirm 2>&1 | tee -a /tmp/$(date -u +"%Y-%m-%d-%H-%M-%S" --date='5 hours ago').log >/dev/null && \
  mkdir -p ~/.cache/yay/petsc-complex && \
  mv *.pkg.tar.zst ~/.cache/yay/petsc-complex
# yay --noconfirm -S ${AUR_PACKAGES}

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

COPY --from=build /tmp/*.log /tmp/
COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

ARG PACKAGES="\
  ocl-icd \
  opencl-headers \
  "

RUN sudo pacman-key --init && \
  sudo pacman-key --populate archlinux && \
  sudo pacman --needed --noconfirm --noprogressbar -Sy archlinux-keyring && \
  sudo pacman --needed --noconfirm --noprogressbar -Syyuq && \
  sudo pacman --needed --noconfirm --noprogressbar -S ${PACKAGES} && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/*

CMD ["/bin/bash"]