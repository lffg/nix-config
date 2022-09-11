{
  description = "lffg's home-manager configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-darwin";
    username = "luiz";
    homeDirectory = "/Users/${username}";

    pkgs = import nixpkgs {
      inherit system;
    };

    homeConfig = import ./home {
      inherit homeDirectory pkgs system username;
    };

    inherit (home-manager.lib) homeManagerConfiguration;
  in {
    homeConfigurations.${username} = homeManagerConfiguration {
      inherit pkgs;

      modules = [
        homeConfig
      ];
    };
  };
}
