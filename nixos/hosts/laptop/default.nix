{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules
      ./hardware-configuration.nix
    ];

  boot.initrd.luks.devices."luks-".device = "/dev/disk/by-uuid/";
  networking.hostName = "laptop";

  system.stateVersion = "23.11";

}
