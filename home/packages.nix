{pkgs}:
with pkgs; [
  # SDKs
  google-cloud-sdk

  # Nix tools
  # rnix-lsp
  comma
  alejandra

  # Rust
  # rustup
  # libiconv

  # Node
  nodejs-16_x
  (yarn.override {nodejs = nodejs-16_x;})

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
  iosevka-bin
  (nerdfonts.override {fonts = ["FiraCode"];})

  # Misc
  cmake
  curl
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
