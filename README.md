# Nix Config

This repository contains my Home Manager configuration using Nix. It also
contains other programs "impure" configurations.

Heavily inspired by [Luc Perkins' one][luc-nixcfg].

[luc-nixcfg]: https://github.com/lucperkins/nix-home-manager-config

## Setup

Fresh machine:

<!-- cspell:words lffg luiz -->

```sh
mkdir -p ~/.config
git clone git@github.com:lffg/nix-config.git ~/.config/nix-config
cd ~/.config/nix-config
nix build ".#homeConfigurations.luiz.activationPackage"
./result/activate
```

After the first setup, one may run `xx` (an alias), which is equivalent to
running:

```sh
home-manager switch --flake ${homeDirectory}/.config/nix-config && \
  source ${homeDirectory}/.zshrc
```
