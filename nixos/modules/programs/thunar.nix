{ pkgs, ... }: 
{

  programs.thunar.enable = true;
  services.gvfs.enable = true;
  programs.xfconf.enable = true;
  services.tumbler.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
}
