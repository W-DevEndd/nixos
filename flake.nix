{
    description = "Hello, NixOS!";
    inputs = {
        # Nix Repos
        nixpkgs.url = "nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager/release-26.05";

        # Standalone Repos
        nixvim.url = "github:nix-community/nixvim";
        quickshell.url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
        zen-browser.url = "github:0xc000022070/zen-browser-flake";
        catppuccin.url = "github:catppuccin/nix";

        # Somethings.....
        w-devendd-dotfiles = {
            url = "github:w-devendd/dotfiles";
            flake = false;
        };

        # Follows
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        nixvim.inputs.nixpkgs.follows = "nixpkgs";
        quickshell.inputs.nixpkgs.follows = "nixpkgs";
        zen-browser.inputs.nixpkgs.follows = "nixpkgs";
        zen-browser.inputs.home-manager.follows = "home-manager";
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nixvim, ... } @inputs: {
        nixosConfigurations."laptop" = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            specialArgs = { inherit inputs; };
            modules = [
                ./hosts/laptop/configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        backupFileExtension = "bak";

                        extraSpecialArgs = { inherit inputs; };
                    };
                }
            ];
        };
    };
}
