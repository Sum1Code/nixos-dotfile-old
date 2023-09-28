{ pkgs }:
let
  imgLink = "https://raw.githubusercontent.com/Ruixi-rebirth/wallpaper/main/23.png";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "hAfnN+beKhfhH79u3kp1c0+grOJpl5I8yPlIXqOMipk=";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "Kangie";
    repo = "sddm-sugar-candy";
    rev = "a1fae5159c8f7e44f0d8de124b14bae583edb5b8";
    sha256 = "18wsl2p9zdq2jdmvxl4r56lir530n73z9skgd7dssgq18lipnrx7";
  };
  installPhase = ''
    			mkdir -p $out
    			cp -R ./* $out/
    			cd $out/
    			rm Backgrounds/Mountain.jpg
    			cp -r ${image} $out/Backgrounds/Mountain.jpg

    		'';
}