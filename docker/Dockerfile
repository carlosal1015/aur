# Copyleft (c) May, 2024, Oromion

FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

ARG AUR_PACKAGES="\
  aur-out-of-date \
  pkgbuild-language-server \
  "
# hadolint

RUN yay --noconfirm --noprogressbar -Syuq ${AUR_PACKAGES} >/dev/null 2>&1

FROM archlinux:base-devel

RUN --mount=type=tmpfs,target=/var/cache/pacman \
  ln -s /usr/share/zoneinfo/America/Lima /etc/localtime && \
  sed -i 's/^#Color/Color/' /etc/pacman.conf && \
  sed -i '/#CheckSpace/a ILoveCandy' /etc/pacman.conf && \
  sed -i 's/^VerbosePkgLists/#VerbosePkgLists/' /etc/pacman.conf && \
  sed -i 's/^ParallelDownloads = 5/ParallelDownloads = 30/' /etc/pacman.conf && \
  sed -i 's/ usr\/share\/doc\/\*/ !usr\/share\/doc\/\*/' /etc/pacman.conf && \
  sed -i 's/ usr\/share\/man\/\*/ !usr\/share\/man\/\*/' /etc/pacman.conf && \
  sed -i 's/^#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(nproc)"/' /etc/makepkg.conf && \
  sed -i 's/^#BUILDDIR/BUILDDIR/' /etc/makepkg.conf && \
  sed -i 's/^#PACKAGER=\"John Doe <john@doe.com/PACKAGER=\"Carlos Aznarán <caznaranl@uni.pe/' /etc/makepkg.conf && \
  sed -i 's/^#GPGKEY=\"/GPGKEY=\"5BC6FBBAB02C73E4724B2CFC8C43C00BA8F06ECA/' /etc/makepkg.conf && \
  echo -e '\n[multilib]\nInclude = /etc/pacman.d/mirrorlist' | tee -a /etc/pacman.conf && \
  useradd -l -u 33333 -md /home/gitpod -s /bin/bash gitpod && \
  passwd -d gitpod && \
  echo 'gitpod ALL=(ALL) ALL' > /etc/sudoers.d/gitpod && \
  sed -i "s/PS1='\[\\\u\@\\\h \\\W\]\\\\\\$ '//g" /home/gitpod/.bashrc && \
  { echo && echo "PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \\\$ '" ; } >> /home/gitpod/.bashrc

USER gitpod

ARG PACKAGES="\
  auth-tarball-from-git \
  devtools \
  docker \
  git-crypt \
  jq \
  namcap \
  nvchecker \
  openssh \
  pacman-contrib \
  python-packaging \
  ttf-fira-code \
  zsh \
  "

COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

RUN sudo pacman --needed --noconfirm --noprogressbar -Syuq >/dev/null 2>&1 && \
  sudo pacman --needed --noconfirm --noprogressbar -S ${PACKAGES} && \
  sudo systemctl enable docker && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  rm /tmp/*.pkg.tar.zst && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/* && \
  printf 'Y\n' | bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

ENV SHELL=/usr/bin/zsh