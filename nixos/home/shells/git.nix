{pkgs, ...}: {
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "Jack McNulty";
    userEmail = "mcnlty@pm.me";
    extraConfig.init.defaultBranch = "main";
  };
}
