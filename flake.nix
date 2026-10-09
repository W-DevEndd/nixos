{
    description = "Hello, NixOS!";
    inputs = {
        # Nix Repos
        nixpkgs.url = "nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager/release-26.05";
        home-manager-unstable.url = "github:nix-community/home-manager";

        # Standalone Repos
        nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
        catppuccin.url = "github:catppuccin/nix";

        quickshell.url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
        waydroid-script.url = "github:casualsnek/waydroid_script";

        nixvim.url = "github:nix-community/nixvim";
        zen-browser.url = "github:0xc000022070/zen-browser-flake";

        # Somethings.....
        w-devendd-dotfiles = {
            url = "github:w-devendd/dotfiles";
            flake = false;
        };

        # Follows
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs-unstable";

        quickshell.inputs.nixpkgs.follows = "nixpkgs-unstable";

        nixvim.inputs.nixpkgs.follows = "nixpkgs-unstable";
        zen-browser.inputs.nixpkgs.follows = "nixpkgs-unstable";
        zen-browser.inputs.home-manager.follows = "home-manager-unstable";
        waydroid-script.inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, home-manager-unstable, nixvim, nix-cachyos-kernel, waydroid-script, ... } @inputs: {
        nixosConfigurations."ideapad" = nixpkgs-unstable.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ({ pkgs, ... }: { nixpkgs.overlays = [
                    nix-cachyos-kernel.overlays.pinned
                    (final: prev: {
                        waydroid-script = waydroid-script.packages.${pkgs.system}.waydroid_script;
                    })
                ]; })
                home-manager-unstable.nixosModules.home-manager

                ./hosts/ideapad/configuration.nix
                { home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    backupFileExtension = "bak";
                    extraSpecialArgs = { inherit inputs; };
                }; }
            ];
        };
    };
}
