{homeDirectory}: {
  enable = true;

  enableSyntaxHighlighting = true;
  enableAutosuggestions = true;
  enableCompletion = true;

  initExtra = builtins.readFile ./zsh-init.sh;

  shellAliases = {
    # General commands:
    "," = "comma";
    cls = "clear";
    del = "trash";
    psqll = "PAGER='less -S' psql";

    # Typos:
    "cd.." = "cd ..";
    "code." = "code .";

    # Navigation
    cdt = "cd ~/TM && cls";
    cdc = "cd ~/Code && cls";
    cdd = "cd ~/Desktop && cls";

    # Nix-related utilities:
    nd = "nix develop '.#' --command $(which zsh)";
    ns = "nix-shell --command $(which zsh)";
    xx = ''
      home-manager switch --flake ${homeDirectory}/.config/nix-config && \
        source ${homeDirectory}/.zshrc
    '';
    ncfg = "code ${homeDirectory}/.config/nix-config";

    # Direnv helpers:
    da = "direnv allow";
    dr = "direnv reload";
  };
}
