{
  enable = true;

  enableZshIntegration = true;

  settings = {
    gcloud = {
      disabled = false;
      format = "(on [$symbol($account )(\($project\) )]($style))";
    };

    nix_shell = {
      disabled = false;
      format = "via [$symbol(\($name\))](blue bold) ";
    };

    package.disabled = true;
    line_break.disabled = false;

    c.disabled = true;
    rust.disabled = true;
    nodejs.disabled = true;
    python.disabled = true;
  };
}
