namespace Bencef.Pom2Boot

open Bencef.Pom2Boot.Lib


module Logic =

    let convert (filename: string): Result<unit, exn> =
        try
            let deps = Pom.parseFile filename
            printf "%s" (Boot.emit deps)
            Ok ()
        with
        | e -> Error e
