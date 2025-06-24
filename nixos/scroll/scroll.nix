{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "scroll";
  version = "0.1";

  src = pkgs.fetchurl {
    url = "https://dl.suckless.org/tools/scroll-0.1.tar.gz";
    sha256 = "nrLVnOat9gEAvSFxsNIx3bR+J0sp3tAiVpYKEezO7tY=";
  };

  patches = [
    ./mouse.patch
  ];

  installPhase = ''
    make install PREFIX=$out
  '';
}
