{pkgs, ...}: {
  imports = [
    ./git.nix
    ./zsh.nix
    ./alacritty.nix
  ];

  home.packages = with pkgs; [
    # compression
    unzip
    zip

    # cli
    btop
    fastfetch
  ];

  home.sessionVariables = {
  };
}
