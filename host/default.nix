{inputs, config, lib, pkgs, ...}:
{
  imports = [
    ./sddm
  ];
  environment.variables = {
    NIXOS_OZONE_WL = "1";
    PATH = [
      "\${HOME}/.local/bin"
    ];
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  environment.systemPackages = with pkgs; [
        # (waybar.overrideAttrs (oldAttrs: {
        # 	mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
        # })
        # )
        libnotify
        dunst
        pavucontrol
        pamixer
        papirus-icon-theme
        xfce.thunar
        xfce.tumbler
        mpv
        swaylock-effects
        wl-clipboard
        grim
        slurp
        clang
        wlogout
        waydroid
        libsForQt5.qt5.qtgraphicaleffects
      ];
      xdg.portal.enable = true;
      xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

      fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        noto-fonts
      ];
      services.xserver.displayManager.sessionPackages = [ pkgs.hyprland ];
    }
