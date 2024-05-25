{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../../modules
      ./hardware-configuration.nix
    ];

  boot.initrd.luks.devices."luks-".device = "/dev/disk/by-uuid/";

  networking.hostName = "desktop";
  system.stateVersion = "23.11";

}
