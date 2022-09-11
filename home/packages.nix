{pkgs}:
with pkgs; [
  # SDKs
  google-cloud-sdk

  # Nix tools
  comma
  rnix-lsp
  alejandra

  # Node
  nodejs-16_x
  yarn

  # Python
  python38
  python38Packages.pip
  python38Packages.virtualenv

  # Bazel
  # bazelisk
  bazel-buildtools

  # Databases
  postgresql_14

  # Fonts
  iosevka
  (nerdfonts.override { fonts = [ "FiraCode" ]; })

  # Misc
  cmake
  curl
  gcc
  clang
  coreutils
  openssl
  tree
  wget
  youtube-dl
  ffmpeg
  gnutar
  zstd
  jq
  bat
  exa
  hexyl
  tokei
  httpie
]
