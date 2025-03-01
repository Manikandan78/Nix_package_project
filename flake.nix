{
  description = "Automated Python, PostgreSQL, and Nginx setup using Nix Flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";  # Get the latest Nix package set
  };

  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default = let
      pkgs = import nixpkgs { system = "x86_64-linux"; };

      python = pkgs.python311;
      postgres = pkgs.postgresql_15;
      nginx = pkgs.nginx;
      git = pkgs.git;

    in pkgs.mkShell {
      name = "python-postgres-nginx-env";

      buildInputs = [ python postgres nginx git ];

      shellHook = ''
        echo " Checking System Information..."
        echo "OS: $(uname -a)"
        echo "Python Version: $(python3 --version)"
        echo "PostgreSQL Version: $(psql --version)"
        echo "Nginx Version: $(nginx -v 2>&1)"

        echo " Environment is ready!"
      '';
    };
  };
}

