# Copyleft (c) August, 2022, Oromion.
FROM ghcr.io/cpp-review-dune/introductory-review/aur AS build

ARG AUR_PACKAGES="\
  numdiff \
  "

RUN yay --needed --noconfirm --noprogressbar -Syyuq && \
  yay --noconfirm -S ${AUR_PACKAGES}

FROM ghcr.io/carlosal1015/aur/deal-ii:latest

COPY --from=build /home/builder/.cache/yay/*/*.pkg.tar.zst /tmp/

ARG PACKAGES="\
  cmake \
  git \
  valgrind \
  "

RUN sudo pacman --needed --noconfirm --noprogressbar -Syyuq && \
  sudo pacman -S --needed --noconfirm --noprogressbar ${PACKAGES} && \
  sudo pacman --noconfirm -U /tmp/*.pkg.tar.zst && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/* && \
  rm /tmp/*.pkg.tar.zst

USER root

# https://github.com/moby/moby/issues/34819
ADD https://raw.githubusercontent.com/carlosal1015/test/main/run.sh /usr/bin

RUN chmod +x /usr/bin/run.sh
