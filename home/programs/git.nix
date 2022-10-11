{pkgs}: let
  inherit (pkgs.lib) concatStringsSep;
in {
  enable = true;

  userName = "Luiz Felipe Gonçalves";
  userEmail = "git@luizfelipe.dev";

  extraConfig = {
    core = {
      ignorecase = "false";
      # TODO: Add `editor`.
    };

    pull.rebase = "true";
    init.defaultBranch = "main";
  };

  delta = {
    enable = true;
  };

  ignores = [
    "__ignore__*"
    ".DS_Store"
  ];

  aliases = {
    l = "log --oneline";

    c = "commit";
    ca = "commit --amend";
    cane = "commit --amend --no-edit";

    su = "stash push";
    sus = "stash push --staged";
    sp = "stash pop";

    rh1 = "reset HEAD^";

    r = "rebase";
    rc = "rebase --continue";
    ra = "rebase --abort";

    pushd = "!git push -u origin $(git rev-parse --abbrev-ref HEAD)";
    pushf = "push --force-with-lease";

    clean-all-branches = concatStringsSep "|" [
      "!git branch --list"
      "grep -e develop -e main -e master -e '*' -v"
      "xargs -I {} git branch -D {}"
    ];
  };
}
