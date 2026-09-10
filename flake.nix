{
    description = "Hello, NixOS!";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nixvim, ... }: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./hosts/nixos/configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        backupFileExtension = "bak";
                    };
                }
                nixvim.homeModules.nixvim
            ];
        };
    };
}
