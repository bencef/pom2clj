open System
open CommandLine
open CommandLine.Text

open Bencef.Pom2Boot.Lib

[<Literal>]
let AppName = "pom2boot"
[<Literal>]
let PomHelpText = "The pom.xml file to read.  If not provided, standard input is used"

type CommandLineOptions = {
    [<Value(0, MetaName="pom_path", HelpText=PomHelpText)>] fileName: string option }
    with
        [<Usage(ApplicationAlias=AppName)>]
        static member examples
            with get() = seq {
                yield Example("Read from file.", { fileName = Some "./pom.xml" })
                yield Example("Read from standard input.", { fileName = None }) }

let inline (|Success|Help|Version|Fail|) (result : ParserResult<'a>) =
  match result with
  | :? Parsed<'a> as parsed -> Success(parsed.Value)
  | :? NotParsed<'a> as notParsed when notParsed.Errors.IsHelp() -> Help
  | :? NotParsed<'a> as notParsed when notParsed.Errors.IsVersion() -> Version
  | :? NotParsed<'a> as notParsed -> Fail(notParsed.Errors)
  | _ -> failwith "invalid parser result"

let run (options: CommandLineOptions) = ()

[<EntryPoint>]
let main argv =
    let parserResult = Parser.Default.ParseArguments<CommandLineOptions> argv
    match parserResult with
    | Success(options) -> (run options; 0)
    | Help | Version -> 0
    | _ -> 1
