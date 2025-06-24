{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "dmenu";
  version = "5.2";

  src = pkgs.fetchurl {
    url = "https://dl.suckless.org/tools/dmenu-5.2.tar.gz";
    sha256 = "1NTKd7WRQPJyJy21N+BbuRpZFPVoAmUtxX5hp3PUN5I=";
  };

  patches = [
    (pkgs.fetchurl {
      url = "https://tools.suckless.org/dmenu/patches/border/dmenu-border-5.2.diff";
      sha256 = "5R5pkUKmX7OPEP3kE2RiF7/zqmXpToLXC8gHZj4o0U8=";
    })

    (pkgs.fetchurl {
      url = "https://tools.suckless.org/dmenu/patches/center/dmenu-center-5.2.diff";
      sha256 = "mnssQ/j6HTH0dg3gspRoj+sZcTXuaA/iOGugfj1Ck8k=";
    })
  ];

  buildInputs = with pkgs.xorg; [
    libX11
    libXft
    libXinerama
  ];

  installPhase = ''
    make install PREFIX=$out
  '';
}
