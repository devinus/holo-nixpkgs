{ pkgs, stdenv, fetchFromGitHub, recurseIntoAttrs, makeRustPlatform }:
let
  rustOverlayRepo = fetchFromGitHub {
    owner = "mozilla";
    repo = "nixpkgs-mozilla";
    rev = "e37160aaf4de5c4968378e7ce6fe5212f4be239f";
    sha256 = "013hapfp76s87wiwyc02mzq1mbva2akqxyh37p27ngqiz0kq5f2n";
  };
  rustOverlay = import "${rustOverlayRepo}/rust-overlay.nix";
  nixpkgs = import <nixpkgs> { overlays = [ rustOverlay ]; };
  rust = let
    channel = (nixpkgs.rustChannelOfTargets
      "nightly"
      "2019-01-24"
      [ "x86_64-unknown-linux-gnu" "wasm32-unknown-unknown" ]
  );
  in {
    rustc = channel.rust;
    inherit (channel) cargo;
    };
  rustPlatform = recurseIntoAttrs (makeRustPlatform rust);
in
rustPlatform.buildRustPackage rec {
  name = "holochain-rust";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "holochain";
    repo = "holochain-rust";
    rev = "330af276015c02956ba4b3d1d65b032585778931";
    sha256 = "10z21m18rwk1xa5d4zm77j5bp3b4vyvnqvb9hn8wbi2kqixlqnzr";
  };
  buildInputs = [
    pkgs.zeromq4
    pkgs.binutils
    pkgs.gcc
    pkgs.gnumake
    pkgs.openssl
    pkgs.pkgconfig
    pkgs.coreutils
    pkgs.cmake
    pkgs.python
    #pkgs.libsodium
  ];

  cargoSha256 = "06nvsllzv4qkyv1213qa566dfanpfb44mhp4n19w64hjw45qpc83";

  meta = with stdenv.lib; {
    description = "holochain-rust";
    homepage = https://github.com/holochain/holochain-rust;
    license = licenses.unlicense;
    maintainers = [ maintainers.tailhook ];
    platforms = platforms.all;
  };
}
