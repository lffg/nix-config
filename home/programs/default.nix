{
  homeDirectory,
  pkgs,
  ...
}: {
  git = import ./git.nix {inherit pkgs;};

  zsh = import ./zsh.nix {inherit homeDirectory;};

  # TODO: Declare VSCode configuration (incl. extensions).
  # vscode = import ./vscode.nix { inherit pkgs; };

  starship = import ./starship.nix;

  home-manager = {
    enable = true;
    path = "${homeDirectory}/.config/nix-config";
  };

  direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  gpg = {
    enable = true;
  };

  bash = {
    enable = true;
  };

  dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  gh = {
    enable = true;
    settings = {
      # TODO: Add `editor`.
      git_protocol = "ssh";
      prompt = "enabled";
    };
  };

  vim = {
    enable = true;
  };
}
