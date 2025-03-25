{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "nvm";
  version = "0.39.5";

  src = fetchFromGitHub {
    owner = "nvm-sh";
    repo = "nvm";
    rev = "v${version}";
    sha256 = "sha256-+n+mGeEOfTBZNDPiQ6CSN//oy1CWzca4iGAiVELG9o4=";
  };

  installPhase = ''
    mkdir -p $out/share/nvm
    cp -r * $out/share/nvm
  '';

  meta = with lib; {
    description = "Node Version Manager - Simple bash script to manage multiple active node.js versions";
    homepage = "https://github.com/nvm-sh/nvm";
    license = licenses.mit;
    platforms = platforms.unix;
  };
} 