namespace Bencef.Pom2Boot.Lib

module Dependency =

    type t =
        {
            groupId: string
            artifactId: string
            version: string
            scope: string option
            dType: string option
        }
