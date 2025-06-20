{ ... }:
{
  virtualisation.docker.enable = true;
  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
}
