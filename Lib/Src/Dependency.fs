namespace Bencef.Pom2Clj.Lib

module Dependency =

    type t =
        {
            groupId: string
            artifactId: string
            version: string
            scope: string option
            dType: string option
        }
