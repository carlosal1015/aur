# Copyleft (c) January, 2024, Oromion

FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

ARG AUR_PACKAGE="numdiff"

RUN yay --repo --needed --noconfirm --noprogressbar -Syuq && \
  yay -G ${AUR_PACKAGE} && \
  cd ${AUR_PACKAGE} && \
  makepkg -s --noconfirm 2>&1 | tee -a /tmp/$(date -u +"%Y-%m-%d-%H-%M-%S" --date='5 hours ago').log >/dev/null && \
  mkdir -p ~/.cache/yay/${AUR_PACKAGE} && \
  mv *.pkg.tar.zst ~/.cache/yay/${AUR_PACKAGE}

FROM ghcr.io/carlosal1015/aur/deal-ii:latest

COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

ARG PACKAGES="\
  cmake \
  git \
  valgrind \
  "

RUN sudo pacman --needed --noconfirm --noprogressbar -Syuq && \
  sudo pacman -S --needed --noconfirm --noprogressbar ${PACKAGES} && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  rm /tmp/*.pkg.tar.zst && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/*

USER root

# https://github.com/moby/moby/issues/34819
ADD https://raw.githubusercontent.com/carlosal1015/test/main/run.sh /usr/bin

RUN chmod +x /usr/bin/run.sh
