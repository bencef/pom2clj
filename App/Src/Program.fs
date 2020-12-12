open System

open FSharp.CommandLine
open FSharp.CommandLine.Internals

open Bencef.Pom2Clj

let fileOption =
    commandOption {
        names ["f"; "file"]
        description "The pom file to read"
        takes (format("%s").withNames ["path-to-pom.xml"])
        style SingleShort
    }

let failOnFurtherArguments () =
    command {
        let! args = Abstraction.StateConfig.args
        if not args.IsEmpty
        then sprintf "unknown arguments: %A" args |> Command.failShowingHelp
        else return ()
    }

let handleResult (res: Result<unit, exn>) =
    command {
        match res with
        | Ok _ -> exit 0
        | Error e -> e.Message |> sprintf "File reading error: %A"
                               |> Command.fail
    }


let mainCommand () =
    command {
        opt file in fileOption |> CommandOption.zeroOrExactlyOne
        failOnFurtherArguments ()
        match file with
        | Some file -> Logic.convert file |> handleResult
        | None      -> return "No file provided" |> Command.failShowingHelp
        return 0
    }

[<EntryPoint>]
let main argv =
    mainCommand() |> Command.runAsEntryPoint argv
