#!/bin/sh

# Based on the servers/nosql/eventstore package

urlbase="https://www.nuget.org/api/v2/package"
cat << EOL
{ fetchurl }: let

  fetchNuGet = { name, version, sha256 }: fetchurl {
    inherit sha256;
    url = "$urlbase/\${name}/\${version}";
  };

in [
EOL
IFS=''
while read line; do
    name=$(echo $line | sed -r 's#([^/]+)/(.+)#\1#')
    version=$(echo $line | sed -r 's#([^/]+)/(.+)#\2#')
    sha256=$(nix-prefetch-url "$urlbase/$name/$version" 2>/dev/null)
    cat << EOL

  (fetchNuGet {
    name = "$name";
    version = "$version";
    sha256 = "$sha256";
  })
EOL
done < $1
cat << EOL

]
EOL
