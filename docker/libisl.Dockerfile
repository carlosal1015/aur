# Copyleft (c) October, 2024, Oromion

FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

ARG CORE_PACKAGE="libisl"

ARG PATCH="https://raw.githubusercontent.com/carlosal1015/aur/main/docker/libisl-python-bindings.patch"

RUN yay --repo --needed --noconfirm --noprogressbar -Syuq >/dev/null 2>&1 && \
  yay -G ${CORE_PACKAGE} && \
  cd ${CORE_PACKAGE} && \
  git config --global user.email github-actions@github.com && \
  git config --global user.name github-actions && \
  curl -O ${PATCH} && \
  git am --signoff < libisl-python-bindings.patch && \
  makepkg -s --noconfirm && \
  sudo pacman --noconfirm --noprogressbar -S namcap && \
  namcap ${CORE_PACKAGE}-*.pkg.tar.zst 2>&1 | tee -a /tmp/namcap.log >/dev/null && \
  mkdir -p ~/.cache/yay/${CORE_PACKAGE} && \
  mv *.pkg.tar.zst ~/.cache/yay/${CORE_PACKAGE}
# 2>&1 | tee -a /tmp/$(date -u +"%Y-%m-%d-%H-%M-%S" --date='5 hours ago').log >/dev/null
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

COPY --from=build /tmp/*.log /tmp/
COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

RUN sudo pacman-key --init && \
  sudo pacman-key --populate archlinux && \
  sudo pacman --needed --noconfirm --noprogressbar -Sy archlinux-keyring && \
  sudo pacman --needed --noconfirm --noprogressbar -Syuq >/dev/null 2>&1 && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  find /tmp/ ! -name '*.log' ! -name 'libisl-*.pkg.tar.zst' -type f -exec rm -f {} + && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/*