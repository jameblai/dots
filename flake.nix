{
  description = "James Blair's NixOS and Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium = {
      url = "github:amaanq/helium-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      helium,
      ...
    }:
    let
      system = "x86_64-linux";
      username = "jamesblair";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixfmt-tree;

      checks.${system} = {
        formatting =
          pkgs.runCommand "check-nix-formatting"
            {
              nativeBuildInputs = [ pkgs.nixfmt ];
            }
            ''
              cp -r ${self} source
              chmod -R +w source
              cd source
              nixfmt --check $(find . -name '*.nix' -type f)
              touch $out
            '';

        deadnix =
          pkgs.runCommand "check-dead-nix"
            {
              nativeBuildInputs = [ pkgs.deadnix ];
            }
            ''
              deadnix --fail ${self}
              touch $out
            '';

        statix =
          pkgs.runCommand "check-statix"
            {
              nativeBuildInputs = [ pkgs.statix ];
            }
            ''
              statix check ${self}
              touch $out
            '';
      };

      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          deadnix
          just
          nh
          nixfmt
          nix-output-monitor
          statix
        ];
      };

      nixosConfigurations.cipher = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit self username; };
        modules = [
          ./hosts/cipher
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit helium username; };
              users.${username} = import ./hosts/cipher/home.nix;
            };
          }
        ];
      };
    };
}
