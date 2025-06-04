{ pkgs, ... }: 
let
  customDWM = import ./dwm/pkg.nix { inherit pkgs; };
  customDMenu = import ./dmenu/pkg.nix { inherit pkgs; };
  customST = import ./st/pkg.nix { inherit pkgs; };
  customScroll = import ./scroll/pkg.nix { inherit pkgs; };
in { 
  environment = {
    sessionVariables = {
      QT_STYLE_OVERRIDE = "adwaita-dark";
      GTK_THEME = "Adwaita-dark";
    }; 

    systemPackages = with pkgs; [
      customDWM
      customDMenu
      customST
      customScroll

      xclip

      xrdp

      firefox
    ];
  };

  services = {
    xserver = {
      enable = true;
      
      xkb = {
        layout = "us";
        variant = "";
      }; 

      displayManager.lightdm.enable = true;
      
      windowManager.session = [{
        name = "dwm";
        start = ''
          ${customDWM}/bin/dwm &  
          waitPID=$!
        '';
      }];
    };

    pipewire = {
      enable = true;
      
      audio.enable = true;
      pulse.enable = true;
      jack.enable = true;
      
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    xrdp = {
      enable = true;
      defaultWindowManager = "dwm";
      openFirewall = true;
    };
  };
}
