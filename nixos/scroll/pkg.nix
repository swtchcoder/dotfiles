{ pkgs, ... }:
let 
  configFile = ./config.h;
in
pkgs.stdenv.mkDerivation rec {
  name = "scroll-custom";
  src = ./.;

  buildInputs = with pkgs; [
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
    freetype
    fontconfig
  ];

  prePatch = ''
    cp ${configFile} config.h
  '';

  installFlags = [ "PREFIX=$(out)" ];
}
