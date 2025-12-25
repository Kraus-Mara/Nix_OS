{ ... }:
let
  custom = {
    font = "Fira Mono Nerd Font";
    font_size = "14px";
    text_color = "#cdd6f4";
    background_0 = "#181825";
    border_color = "#373737";
    red = "#4E7C8A";
    empty = "#949494";
    opacity = "1";
  };
in
{
  programs.waybar.style = with custom; ''
    * {
      border : none;
      border-radius:0px;
      padding: 0px;
      margin: 0px;
      font-family: ${font};
      font-size: ${font_size};
    }

    window#waybar {
      background: transparent;
      border: 0px;
      border-radius: 0px;
      padding:0px;
      margin:0px;
    }

    tooltip {
      background: ${background_0};
      border: 1px solid ${border_color};
    }
    tooltip label {
      margin: 5px;
      color: ${text_color};
    }

    #workspaces {
      background: ${background_0};
      border-radius: 10px;
      padding-left: 10px;
      padding-right: 10px;
    }
    #workspaces button {
      color: ${text_color};
      padding-left:  5px;
      padding-right: 5px;
    }
    #workspaces button.empty {
      color: ${empty};
    }
    #workspaces button.active {
      color: ${red};
    }

    #clock {
      background: ${background_0};
      padding-left:  5px;
      padding-right: 5px;
      color: ${text_color};
    }

    #tray {
      border-radius: 10px 0px 0px 10px;
      padding-left: 15px;
      padding-right: 15px;
      background: ${background_0};
    }

    #tray menu {
      background: ${background_0};
      border: 1px solid ${border_color};
      opacity: 1;
      padding-left: 10px;
      padding-right: 20px;
    }
    #tray menuitem {
      padding: 5px;
    }
    #memory {
      border-radius: 0px 10px 10px 0px;
      padding-right: 25px;
    }
    #pulseaudio, #network, #cpu, #memory, #disk, #battery, #language, #custom-notification {
      background: ${background_0};
      padding-left: 8px;
      padding-right: 8px;
      color: ${text_color};
    }

    #custom-notification {
      background: ${background_0};
      padding-right: 6px;
      border-radius: 0px 10px 10px 0px;
    }

    #custom-launcher {
      background: ${background_0};
      font-size: 20px;
      color: ${text_color};
      font-weight: bold;
      padding-left: 6px;
      padding-right: 15px;
      border-radius: 10px 0px 0px 10px;
    }
  '';
}
