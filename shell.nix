let
  rust-overlay = builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz";
  pkgs = import <nixpkgs> {
    overlays = [(import rust-overlay)];
  };
  toolchain = pkgs.rust-bin.fromRustupToolchainFile ./toolchain.toml;
in
pkgs.mkShell {
  packages = with pkgs; [
    toolchain
    rust-analyzer

    avrdude
    pkgsCross.avr.buildPackages.gcc
    ravedude
  ];
}
