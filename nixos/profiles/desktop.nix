{ pkgs, ... }: 
let
  customDWM = import ../pkgs/dwm/dwm.nix { inherit pkgs; };
  customDMenu = import ../pkgs/dmenu/dmenu.nix { inherit pkgs; };
  customST = import ../pkgs/st/st.nix { inherit pkgs; };
  customScroll = import ../pkgs/scroll/scroll.nix { inherit pkgs; };
in { 
  environment.systemPackages = with pkgs; [
    customDWM
    customDMenu
    customST
    customScroll

    firefox
  ];

  services = {
    xserver = {
      enable = true;

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
  };
}
