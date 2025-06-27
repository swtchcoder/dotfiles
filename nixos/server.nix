{ ... }:
{
  virtualisation.docker.enable = true;
  
  networking = {
    hostName = "server-0";

    firewall.allowedTCPPorts = [ 22 ];
  };

  services = { 
    avahi = {
      enable = true;
      nssmdns = true;
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
      };
    };

    openssh.enable = true;
  };
}
