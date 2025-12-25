{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    nixvim
  ];

  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.nixvim.nixosModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    plugins.treesitter.enable = true;
  };
}
