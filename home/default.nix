{
  pkgs,
  system,
  username,
  homeDirectory,
}: {
  home = {
    inherit username homeDirectory;

    stateVersion = "22.05";

    packages = import ./packages.nix {
      inherit pkgs;
    };

    activation = {
      yarn-pkgs = "yarn global add glob-cli trash-cli";
    };

    sessionVariables = {
      # FIXME: Refactor this in a more organized way.
      OPENSSL_DIR = "${pkgs.openssl.bin}/bin";
      OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
      OPENSSL_INCLUDE_DIR = "${pkgs.openssl.out.dev}/include";
    };
  };

  programs = import ./programs {
    inherit pkgs homeDirectory;
  };

  nix = import ./nix.nix {
    inherit username;
    nix = pkgs.nixUnstable;
  };

  services = {};

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;
}
