{ pkgs, lib, ... }:
{
  programs.dconf.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "lsd -1";
      la = "lsd -1a";
      ll = "lsd -l";
      lla = "lsd -la";
      interactiveShellInit = ''
        quickshell init fish | source
      '';
    };
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];
}
