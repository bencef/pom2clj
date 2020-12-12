open System

open FSharp.CommandLine
open FSharp.CommandLine.Internals

open Bencef.Pom2Boot.Lib

let fileOption =
    commandOption {
        names ["f"; "file"]
        description "The pom file to read"
        takes (format("%s").withNames ["path-to-pom.xml"])
    }

let failOnFurtherArguments () =
    command {
        let! args = Abstraction.StateConfig.args
        if not args.IsEmpty
        then sprintf "unknown arguments: %A" args |> RequestShowHelp |> raise
        else return ()
    }

let mainCommand () =
    command {
        opt file in fileOption |> CommandOption.zeroOrExactlyOne
        failOnFurtherArguments ()
        match file with
        | Some file -> printfn "Got file: %s" file
        | None      -> printfn "Got nothing"
        return 0
    }

[<EntryPoint>]
let main argv =
    mainCommand() |> Command.runAsEntryPoint argv
