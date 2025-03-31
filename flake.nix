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
        ruby = pkgs.ruby_3_3;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            ruby
            pkgs.bundler
            
            # Dependencies for nokogiri and ffi
            pkgs.libxml2
            pkgs.libxslt
            pkgs.zlib
            pkgs.pkg-config
            
            # Additional useful packages
            pkgs.git
            pkgs.gnumake
          ];

          shellHook = ''
            echo "Jekyll environment loaded!"
            echo "Run 'bundle install' then 'bundle exec jekyll serve' to start the development server"
          '';
        };
      }
    );
}