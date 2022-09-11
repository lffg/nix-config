{
  nix,
  username,
}: {
  package = nix;

  settings = {
    sandbox = true;
    builders-use-substitutes = true;

    experimental-features = [
      "flakes"
      "nix-command"
    ];

    substituters = [
      "https://cache.nixos.org"
    ];

    trusted-substituters = [
      "https://cache.nixos.org"
    ];

    trusted-users = [
      "${username}"
      "root"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };
}
