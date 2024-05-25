{
  services = {

    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad.accelProfile = "flat";
    };

    xserver = {
      enable = true;

      xkb.layout = "us";
      xkb.variant = "";

      videoDrivers = [ "amdgpu" ];
      deviceSection = ''Option "TearFree" "True"'';
      displayManager.gdm.enable = true;
    };
  };
}
