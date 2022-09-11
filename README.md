# Nix Config

My home-manager configuration.

Heavily inspired by [Luc Perkins' one](luc-nix-config).

[luc-nix-config]: https://github.com/lucperkins/nix-home-manager-config

## Setup

Fresh machine:

<!-- cspell:words lffg luiz -->

```sh
nix build "github:lffg/nix-config#homeConfigurations.luiz.activationPackage"
./result/activate
```

After the first setup, one may run `xx` (an alias), which is equivalent to
running:

```sh
home-manager switch --flake ${homeDirectory}/.config/nix-config && \
  source ${homeDirectory}/.zshrc
```
