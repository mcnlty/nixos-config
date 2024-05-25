{
  pkgs,
  username,
  ...
}: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users."${username}" = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        ""
	""
      ];
      extraGroups = [
        "audio"
        "docker"
        "input"
        "plugdev"
        "sound"
        "tty"
        "video"
        "wheel"
        "libvirtd"
      ];
    };
  };

  environment.shells = with pkgs; [ zsh ];
  nix.settings.trusted-users = ["${username}"];
}
