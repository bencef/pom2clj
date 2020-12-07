namespace Bencef.Pom2Boot.Test

open FsCheck
open FsCheck.Xunit
open FParsec

open Bencef.Pom2Boot.Lib

module private BootParser =

    let parseDependencies: Parser<Dependency.t list, unit> =
        preturn []

[<Properties( Arbitrary=[| typeof<DependencyGenerator> |] )>]
module BootTest =

    [<Property>]
    let ``Boot dependency output conforms to model`` (deps: Dependency.t list) =
        let textOutput = Boot.emit deps
        let parsedDeps =
            run BootParser.parseDependencies textOutput
            |> function
                | Success (res, _, _) -> res
                | _ -> []
        deps = parsedDeps |@ sprintf "%A = %A" deps parsedDeps
