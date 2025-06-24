{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "st";
  version = "0.8.5";

  src = pkgs.fetchurl {
    url = "https://dl.suckless.org/st/st-0.8.5.tar.gz";
    sha256 = "6mgyID7QL/dBgry4raqexFTI+YnnkjLLhZZl4vVEqzc=";
  };

  patches = [
    ./meslonf.patch

    (pkgs.fetchurl {
      url = "https://st.suckless.org/patches/gruvbox/st-gruvbox-dark-0.8.5.diff";
      sha256 = "W1qMGJRcfvmLp9hXzISIGo6XAk/Q88oaYoMD6kAEdks=";
    })

    (pkgs.fetchurl {
      url = "https://st.suckless.org/patches/scrollback/st-scrollback-0.8.5.diff";
      sha256 = "3H9SI7JvyBPZHUrjW9qlTWMCTK6fGK/Zs1lLozmd+lU=";
    })

    (pkgs.fetchurl {
      url = "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20191024-a2c479c.diff";
      sha256 = "MZRY2YAZXRj6D4GmiY1Y+NBGxf+YKrhy10H1S7YOJn0=";
    })
  ];

  buildInputs = with pkgs; [
    xorg.libX11
    xorg.libXft
    pkg-config
    fontconfig
    harfbuzz
    freetype
    ncurses
  ];

  propagatedBuildInputs = with pkgs; [
    (nerdfonts.override { fonts = [ "Meslo" ]; })
    (callPackage ../scroll/scroll.nix {})
  ];

  installPhase = ''
    export TERMINFO=$out/share/terminfo
    mkdir -p $TERMINFO
    
    make install PREFIX=$out
  '';
}
