{ hyprland, config, lib, pkgs, ... }:
let
  system = "x86_64-linux";
in
{
  programs.waybar = {
    enable = true;
     package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or  []) ++ [ "-Dexperimental=true" ];
    patches = (oa.patches or []) ++ [
      (pkgs.fetchpatch {
        name = "fix waybar hyprctl";
        url = "https://aur.archlinux.org/cgit/aur.git/plain/hyprctl.patch?h=waybar-hyprland-git";
        sha256 = "sha256-pY3+9Dhi61Jo2cPnBdmn3NUTSA8bAbtgsk2ooj4y7aQ=";
      })
    ];
  });
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
  };

  home.file.".config/waybar/config.jsonc".source = ./config.jsonc;
  home.file.".config/waybar/style.css".source = ./style.css;
}
      