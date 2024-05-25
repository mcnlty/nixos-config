{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.95;

      font = {
        size = 13.0;
        normal = {
          family = "FiraCode Nerd Font";
          style = "Bold";
        };
      };

      colors.primary.background = "#1d2021";
    };
  };
}
