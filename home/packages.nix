{pkgs}:
with pkgs; [
  # SDKs
  google-cloud-sdk

  # Nix tools
  # rnix-lsp
  alejandra

  # Shell
  shellcheck

  # Rust
  # libiconv | zld
  (rust-bin.stable."1.65.0".default.override {
    extensions = ["rust-src"];
  })

  # Java
  jdk

  # Node
  nodejs-18_x
  (yarn.override {nodejs = nodejs-18_x;})

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

  # Compression
  gnutar
  zstd

  # Utilities
  curl
  tree
  jq
  bat
  exa
  hexyl
  tokei
  httpie

  # Misc
  coreutils
  openssl
]
