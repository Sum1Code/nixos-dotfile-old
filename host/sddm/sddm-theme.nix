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
    owner = "MarianArlt";
    repo = "sddm-chili" ;
    rev = "6516d50176c3b34df29003726ef9708813d06271";
    sha256 = "wxWsdRGC59YzDcSopDRzxg8TfjjmA3LHrdWjepTuzgw=";
  };
  installPhase = ''
    			mkdir -p $out
    			cp -R ./* $out/
    			cd $out/
    			rm assets/background.jpg
    			cp -r ${image} $out/assets/background.jpg

    		'';
}
