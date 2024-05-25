{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    obs-studio
    mpv
    gparted
    bitwarden
    keepassxc
    qbittorrent
    mullvad-browser

    # Networking
    tor
    networkmanagerapplet
    wireguard-tools

    # GPU stuff 
    amdvlk
  ];
}
