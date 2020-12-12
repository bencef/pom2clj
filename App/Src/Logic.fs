namespace Bencef.Pom2Clj

open Bencef.Pom2Clj.Lib


module Logic =

    let convert (filename: string): Result<unit, exn> =
        try
            let deps = Pom.parseFile filename
            printf "%s" (Clj.emit deps)
            Ok ()
        with
        | e -> Error e
