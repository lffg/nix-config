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
