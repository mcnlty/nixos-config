{username, ...}: {
  imports = [
    ./shells
    ./wayland
    ./applications
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
