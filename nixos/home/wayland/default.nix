{
  pkgs,
  nix-colors,
  ...
}: {
  imports = [
    ./wm
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.nord;

  home.packages = with pkgs; [
    # wayland
    grim
    libnotify
    slurp
    swayidle
    waybar
    wl-clipboard
    rofi-wayland
    pamixer
    wofi
    pavucontrol
    cava
    feh
    papirus-nord
    tree
    lf
    brightnessctl
    nwg-bar
    swww

    # fonts
    font-awesome
    iosevka
    noto-fonts
    noto-fonts-emoji
    powerline-fonts
    powerline-symbols
    source-code-pro
    nerdfonts
    fira-code
    fira-code-symbols
  ];

  home.sessionVariables = {
    # SDL_VIDEODRIVER = "wayland";
    BROWSER = "librewolf";
    QT_QPA_PLATFORM = "xcb"; 
    WLR_RENDERER = "vulkan";
    XDG_SESSION_TYPE = "wayland";
    GTK_USE_PORTAL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
  };
}
