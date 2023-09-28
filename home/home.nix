{ inputs, pkgs, hyprland, ... }:
{
  imports = [
     hyprland.homeManagerModules.default
	 ./apps 
   ./theme
  ];

  home = {
    username = "nocta";
    homeDirectory = "/home/nocta";

  };
  home.packages = (with pkgs; [
    #default
    kitty
    firefox
	  dunst
	  swww
	  starship
    git
    btop
    gh
  ]);


  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
