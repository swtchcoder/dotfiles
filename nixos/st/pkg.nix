{ pkgs, ... }:
let
  configFile = ./config.h;
in
pkgs.stdenv.mkDerivation rec {
  name = "st-custom";
  src = ./.;

  buildInputs = with pkgs; [
    xorg.libX11
    xorg.libXft
    pkg-config
    fontconfig
    harfbuzz
    freetype
    ncurses
  ];

  preInstall = ''
    cp ${configFile} config.h

    export TERMINFO=$out/share/terminfo
    mkdir -p $TERMINFO
  '';

  installFlags = [ "PREFIX=$(out)" ];
}
