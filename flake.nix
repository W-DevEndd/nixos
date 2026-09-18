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
            

        # Somethings.....
        w-devendd-dotfiles = {
            url = "github:w-devendd/dotfiles";
            flake = false;
        };

        # Follows
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        nixvim.inputs.nixpkgs.follows = "nixpkgs";
        quickshell.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nixvim, ... } @inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            specialArgs = { inherit inputs; };
            modules = [
                ./hosts/nixos/configuration.nix
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
