namespace Bencef.Pom2Clj

open Bencef.Pom2Clj.Lib


module Logic =

    let convert (filename: string): Result<unit, exn> =
        try
            use fileReader = System.IO.File.OpenText filename
            let deps = Pom.parseFile fileReader
            printf "%s" (Clj.emit deps)
            Ok ()
        with
        | e -> Error e
