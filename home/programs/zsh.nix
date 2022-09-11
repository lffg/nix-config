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
    xx = ''
      home-manager switch --flake ${homeDirectory}/.config/nix-config && \
        source ${homeDirectory}/.zshrc
    '';
    ncfg = "code ${homeDirectory}/.config/nix-config";
    # TODO: Add `ns` and `nd`. How to handle `--command` path using HM?

    # Direnv helpers:
    da = "direnv allow";
    dr = "direnv reload";
  };
}
