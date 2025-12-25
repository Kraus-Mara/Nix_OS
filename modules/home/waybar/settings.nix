{ host, ... }:
let
  custom = {
    font = "Fira Mono Nerd Font";
    font_size = "15px";
    font_weight = "bold";
    text_color = "#D5D5D5";
    background_0 = "#1D2021";
    background_1 = "#282828";
    border_color = "#928374";
    red = "#4E7C8A";
    magenta = "#65BCFF";
    cpu_color = "#BFA94A";
    mem_color = "#BFA94A";
    disk_color = "#BFA94A";
    audio_color = "#BFA94A";
    clock_color = "#BFA94A";
    calendar_color = "#BFA94A";
    today_color = "#E5A72A";
    tray_color = "#BFA94A";
    language_format_color = "#BFA94A";
    opacity = "1";
    indicator_height = "2px";
    yellow = "#7EBAE4";
    battery_color = "#BFA94A";
  };
in
{
  programs.waybar.settings.mainBar = with custom; {
    position = "top";
    height = 15;
    margin-top = 2;
    margin-bottom = 2;
    margin-left = 2;
    margin-right = 2;
    modules-left = [
      "custom/launcher"
      "clock"
      "cpu"
      "memory"
    ];
    modules-center = [ "hyprland/workspaces" ];
    modules-right = [
      "tray"
      "hyprland/language"
      "pulseaudio"
      "battery"
      "custom/notification"
    ];
    clock = {
      format = "<span foreground='${clock_color}'></span>  {:%H:%M}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        "1" = "I";
        "2" = "II";
        "3" = "III";
        "4" = "IV";
        "5" = "V";
        "6" = "VI";
        "7" = "VII";
        "8" = "VIII";
        "9" = "IX";
        "10" = "X";
        sort-by-number = true;
      };
      persistent-workspaces = {
        "1" = [ ];
        "2" = [ ];
        "3" = [ ];
        "4" = [ ];
        "5" = [ ];
      };
    };
    cpu = {
      format = "<span foreground='${cpu_color}'> </span> {usage}%";
      format-alt = "<span foreground='${cpu_color}'> </span> {avg_frequency} GHz";
      interval = 2;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
    };
    memory = {
      format = "<span foreground='${mem_color}'>󰟜 </span>{}%";
      format-alt = "<span foreground='${mem_color}'>󰟜 </span>{used} GiB";
      interval = 2;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
    };
    disk = {
      # path = "/";
      format = "<span foreground='${disk_color}'>󰋊 </span>{percentage_used}%";
      interval = 60;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
    };
    tray = {
      format = "<span foreground='${tray_color}'>{icon}</span> {}";
      icon-size = 16;
      spacing = 8;
    };
    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "<span foreground='${audio_color}'> </span> {volume}%";
      format-icons = {
        default = [ "<span foreground='${audio_color}'> </span>" ];
      };
      scroll-step = 2;
      on-click = "pamixer -t";
      on-click-right = "pavucontrol";
    };
    battery = {
      format = "<span foreground='${battery_color}'>{icon}</span> {capacity}%";
      format-icons = [
        " "
        " "
        " "
        " "
        " "
      ];
      format-charging = "<span foreground='${battery_color}'> </span>{capacity}%";
      format-full = "<span foreground='${battery_color}'> </span>{capacity}%";
      format-warning = "<span foreground='${battery_color}'> </span>{capacity}%";
      interval = 5;
      states = {
        warning = 20;
      };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };
    "hyprland/language" = {
      format = "<span foreground='${language_format_color}'> </span> {}";
      format-fr = "FR";
      format-en = "US";
    };
    "custom/launcher" = {
      format = "<span foreground='${yellow}'></span>";
      on-click = "random-wallpaper";
      on-click-right = "rofi -show drun";
      tooltip = "true";
      tooltip-format = "Random Wallpaper";
    };
    "custom/notification" = {
      tooltip = false;
      format = "{icon} ";
      format-icons = {
        notification = "  <span foreground='${red}'></span>";
        none = "  <span foreground='${red}'></span>";
        dnd-notification = "  <span foreground='${red}'></span>";
        dnd-none = "  <span foreground='${red}'></span>";
        inhibited-notification = "  <span foreground='${red}'></span>";
        inhibited-none = "  <span foreground='${red}'></span>";
        dnd-inhibited-notification = "  <span foreground='${red}'></span>";
        dnd-inhibited-none = "  <span foreground='${red}'></span>";
      };
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "swaync-client -t -sw";
      on-click-right = "swaync-client -d -sw";
      escape = true;
    };
  };
}
