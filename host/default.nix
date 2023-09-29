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
        libsForQt5.qt5.qtgraphicaleffects
        virt-manager
        qemu
      ];
      xdg.portal.enable = true;
      xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

      fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        noto-fonts
      ];
      virtualisation.waydroid.enable = true;
      virtualisation.libvirtd.enable = true;
      users.users.nocta.extraGroups = [ "libvirtd" ];
      services.xserver.displayManager.sessionPackages = [ pkgs.hyprland ];
      programs.fish.enable = true;
      users.defaultUserShell = pkgs.fish;

    }
