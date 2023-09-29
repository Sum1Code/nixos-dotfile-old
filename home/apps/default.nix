{ inputs, pkgs, libs, config, ... }:
{
	imports = [
	./hypr
	./kitty
	./wofi
	./waybar
	./dunst
	./swaylock
	./wlogout
    ./neovim
	];
}
