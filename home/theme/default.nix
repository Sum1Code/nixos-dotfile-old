{config, pkgs, lib, ...}:

{
    gtk.enable = true;
    qt.enable = true;
    qt.platformTheme = "gtk";
    
    gtk.cursorTheme.package = pkgs.bibata-cursors;
    gtk.cursorTheme.name = "Bibata-Modern-Ice";

    gtk.theme.package=pkgs.tokyo-night-gtk;
    gtk.theme.name="Tokyonight-Storm-BL";

    gtk.iconTheme.package= pkgs.papirus-icon-theme;
    gtk.iconTheme.name = "Papirus";
}