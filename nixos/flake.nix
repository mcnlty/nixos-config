{
  description = "NixOS Flake Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = inputs @ { self, nixpkgs, nix-colors, home-manager, nixpkgs-stable, hyprland, hyprpaper, ... }:
  let
    system = "x86_64-linux";
    username = "jack";
  in {
    nixosConfigurations = {
      "desktop" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
        };
        modules = [
          ./hosts/desktop
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."${username}" = import ./home/${username};
            home-manager.extraSpecialArgs = {
              inherit inputs;
              inherit nix-colors;
              inherit username;
            };
          }
          hyprland.nixosModules.default
          {
            programs.hyprland.enable = true;
          }
        ];
      };
      "laptop" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
        };
        modules = [
          ./hosts/laptop
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."${username}" = import ./home/${username};
            home-manager.extraSpecialArgs = {
              inherit inputs;
              inherit nix-colors;
              inherit username;
            };
          }
          hyprland.nixosModules.default
          {
            programs.hyprland.enable = true;
          }
        ];
      };
    };
  };
}
