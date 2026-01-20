{...}: {
  programs.river-classic.enable = true;
  hjem.users.ignis = {
    xdg.config.files."river/init".text = ''
        #!/bin/sh

      spawns=""
      for spawn in $spawns; do
          riverctl spawn "$spawn"
      done

      sink="@DEFAULT_AUDIO_SINK@"
      riverctl map normal Super+Shift Return        spawn kitty
      riverctl map normal Super       P             spawn fuzzel
      riverctl map normal Super+Shift P             spawn 'grim -g "$(slurp)" - | wl-copy -t image/png'
      riverctl map normal None XF86AudioRaiseVolume spawn "wpctl set-volume $sink 5%+ -l 1.0"
      riverctl map normal None XF86AudioLowerVolume spawn "wpctl set-volume $sink 5%- -l 1.0"
      riverctl map normal None XF86AudioPlay        spawn "wpctl set-mute   $sink toggle"

      riverctl map normal Super+Shift Q close
      riverctl map normal Super+Shift E exit

      riverctl map normal Super       Left  focus-view left
      riverctl map normal Super       Down  focus-view down
      riverctl map normal Super       Up    focus-view up
      riverctl map normal Super       Right focus-view right
      riverctl map normal Super+Shift Left  swap       left
      riverctl map normal Super+Shift Down  swap       down
      riverctl map normal Super+Shift Up    swap       up
      riverctl map normal Super+Shift Right swap       right

      riverctl map normal Super       Comma  focus-output                 left
      riverctl map normal Super       Period focus-output                 right
      riverctl map normal Super+Shift Comma  send-to-output -current-tags left
      riverctl map normal Super+Shift Period send-to-output -current-tags right

      riverctl map normal Super Return zoom
      riverctl map normal Super Space  toggle-float
      riverctl map normal Super F      toggle-fullscreen

      riverctl map-pointer normal Super BTN_LEFT move-view
      riverctl map-pointer normal Super BTN_RIGHT resize-view

      i=1
      for letter in q w e r t; do
          tags=$((1 << (i - 1)))
          riverctl map normal Super       "$i"      set-focused-tags $tags
          riverctl map normal Super       "$letter" set-focused-tags $tags
          riverctl map normal Super+Shift "$i"      set-view-tags    $tags
          riverctl map normal Super+Shift "$letter" set-view-tags    $tags
          i=$((i + 1))
      done

      riverctl input "pointer-2362-628-PIXA3854:00_093A:0274_Touchpad" tap enabled

      riverctl set-repeat           50     300
      riverctl focus-follows-cursor normal

      riverctl background-color       0x222630
      riverctl border-width           1
      riverctl border-color-focused   0x5E81AC
      riverctl border-color-unfocused 0x222630
      riverctl border-color-urgent    0xB74E58

      riverctl attach-mode    bottom
      riverctl default-layout rivertile
      riverctl spawn          "rivertile -view-padding 0 -outer-padding 0 -main-ratio 0.5"
    '';
  };
}
