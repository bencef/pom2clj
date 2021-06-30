{ pkgs ? import <nixpkgs> {}
}:

# Lifted from the Eventsorce package

let
  deps = import ./deps.nix { fetchurl = pkgs.fetchurl; };
in
pkgs.stdenv.mkDerivation rec {
  pname = "pom2clj";
  version = "0.1.1";

  src = pkgs.fetchFromGitHub {
    owner = "bencef";
    repo = pname;
    rev = "v${version}";
    sha256 = "15yp3hjhpyd6x4dglnarqypz4w64rjsmg5vcv1b4f0kvhq0cappp";
  };

  buildInputs = with pkgs; [ dotnet-sdk_3 makeWrapper dotnetPackages.Nuget ];

  # TODO: use 'publish' instead of 'build'
  buildPhase = ''
    mkdir home
    export HOME=$PWD/home
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
    # disable default-source so nuget does not try to download from online-repo
    nuget sources Disable -Name "nuget.org"
    # add all dependencies to a source called 'nixos'
    for package in ${toString deps}; do
      nuget add $package -Source nixos
    done
    dotnet restore --source nixos App/App.fsproj
    dotnet build --no-restore -c Release App/App.fsproj
  '';


  installPhase = ''
    mkdir -p $out/{App,Lib}/bin $out/bin
    cp -r App/bin/Release $out/App/bin
    cp -r Lib/bin/Release $out/Lib/bin
    makeWrapper $out/App/bin/Release/netcoreapp3.1/App $out/bin/pom2clj \
      --set DOTNET_ROOT ${pkgs.dotnet-sdk_3}
  '';
}
