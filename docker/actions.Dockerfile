# Copyleft (c) October, 2022, Oromion.

FROM ghcr.io/carlosal1015/aur/precice-arch:latest

RUN sudo pacman --needed --noconfirm --noprogressbar -Syyuq && \
  sudo pacman -S --noconfirm python-setuptools

USER root
