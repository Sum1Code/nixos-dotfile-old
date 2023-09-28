{config, pkgs, lib, ...}:
{
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.enable = true;

    services.xserver.displayManager.sddm.theme = "${import ./sddm-theme.nix {inherit pkgs;}}";
}