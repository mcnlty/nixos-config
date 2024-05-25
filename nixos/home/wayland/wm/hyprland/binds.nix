let
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
        "$mainMod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
      ]
    )
    10);
in {
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bind =
      [
        "$mainMod, RETURN, exec, $term"
        "$mainMod, R, exec, $menu --show drun"
        "$mainMod, E, exec, $files"
        "$mainMod, T, exec, $browser"
        "$mainMod, Q, killactive"
        "$mainMod, F, fullscreen"
        "$mainMod, M, exit"
        # Move Focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        # Move Vim Style
        "$mainMod CTRL, H, movewindow, l"
        "$mainMod CTRL, L, movewindow, r"
        "$mainMod CTRL, K, movewindow, u"
        "$mainMod CTRL, J, movewindow, d"
        "$mainMod CTRL, left, movewindow, l"
        "$mainMod CTRL, right, movewindow, r"
        "$mainMod CTRL, up, movewindow, u"
        "$mainMod CTRL, down, movewindow, d"
	# Resize Vim Style
	"$mainMod SHIFT, H, resizeactive, -50 0"
	"$mainMod SHIFT, L, resizeactive, 50 0"
	"$mainMod SHIFT, K, resizeactive, 0 -50"
	"$mainMod SHIFT, J, resizeactive, 0 50"
	"$mainMod SHIFT, left, resizeactive, -50 0"
	"$mainMod SHIFT, right, resizeactive, 50 0"
	"$mainMod SHIFT, up, resizeactive, 0 -50"
	"$mainMod SHIFT, down, resizeactive, 0 50"
        "$mainMod SHIFT, h, movewindoworgroup, l"
	"$mainMod SHIFT, l, movewindoworgroup, r"
	"$mainMod SHIFT, k, movewindoworgroup, u"
	"$mainMod SHIFT, j, movewindoworgroup, d"
	# Special Workspace
	"$mainMod SHIFT, U, movetoworkspace, special"
	"$mainMod, U, togglespecialworkspace,"
	# Toggle Group
	"$mainMod, y, togglegroup"
	# Special Keys
        # Volume
        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        ", XF86AudioMute, exec, pamixer -t"
	# Brightness
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
        ", XF86MonBrightnessUp, exec, brightnessctl set +5% "
      ]
      ++ workspaces;
  };
}
