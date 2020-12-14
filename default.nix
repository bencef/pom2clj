{ pkgs ? import <nixpkgs> {}
}:

# Lifted from the Eventsorce package

let
  deps = import ./deps.nix { fetchurl = pkgs.fetchurl; };
in
pkgs.stdenv.mkDerivation rec {
  pname = "pom2clj";
  version = "0.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "bencef";
    repo = pname;
    rev = "v${version}";
    sha256 = "10nfikdjbhjkqxpwkxxmd5h7wqxgivxvl1qix14nyg1h7f538xsi";
  };

  buildInputs = with pkgs; [ dotnet-sdk_3 makeWrapper dotnetPackages.Nuget ];

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
  # installPhase = ''
  #   mkdir -p $out/{bin,lib/eventstore}
  #   cp -r bin/Release/* $out/lib/eventstore
  #   makeWrapper "${mono}/bin/mono" $out/bin/eventstored \
  #     --add-flags "$out/lib/eventstore/EventStore.ClusterNode/net471/EventStore.ClusterNode.exe"
  # '';
}
