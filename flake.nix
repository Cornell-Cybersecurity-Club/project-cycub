# Drafted with Claude
{
  description = "GitHub Pages Jekyll Site";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        
        # Jekyll dependencies
        jekyllEnv = pkgs.bundlerEnv {
          name = "jekyll-env";
          ruby = pkgs.ruby;
          gemdir = ./.;  # Expects a Gemfile in the current directory
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            jekyllEnv
            pkgs.bundler
            pkgs.ruby
            pkgs.rubyPackages.jekyll
            
            # Additional useful packages
            pkgs.git
            pkgs.gnumake
          ];

          shellHook = ''
            echo "Jekyll environment loaded!"
            echo "Run 'bundle exec jekyll serve' to start the development server"
          '';
        };
      }
    );
}