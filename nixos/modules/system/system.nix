{ pkgs, lib, ... }: 
{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "America/New_York";

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  services.openssh.enable = true;
  services.openssh.openFirewall = true;
  services.openssh.settings = {
    PasswordAuthentication = false;
    KbdInteractiveAuthentication = false;
    PubkeyAuthentication = true;
    X11Forwarding = false;
  };

  environment.systemPackages = with pkgs; [
    vim
    curl
    git
    wget
    alacritty
    librewolf
    signal-desktop
    tor-browser
    upower
    libreoffice-fresh
  ];
}
