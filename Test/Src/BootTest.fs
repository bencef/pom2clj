namespace Bencef.Pom2Boot.Test

open FsCheck
open FsCheck.Xunit
open FParsec

open Bencef.Pom2Boot.Lib

module private BootParser =

    let parseIdentifier: Parser<string, unit> =
        many1Chars (pchar '-' <|> pchar '.' <|> letter <|> digit)

    let parseDependency: Parser<Dependency.t, unit> =
        let quoted p = between (pchar '"') (pchar '"') p
        let parseOpt kind =
            opt (spaces .>> skipString kind .>> spaces >>. quoted parseIdentifier)
        let parseDepFields =
            parseIdentifier >>= (fun groupId ->
            pchar '/' >>. parseIdentifier >>= (fun artifactId ->
            spaces >>. quoted parseIdentifier >>= (fun version ->
            attempt <| parseOpt ":scope" >>=? (fun scope ->
            parseOpt ":type" >>= (fun dType ->
            preturn { Dependency.groupId = groupId
                      Dependency.artifactId = artifactId
                      Dependency.version = version
                      Dependency.scope = scope
                      Dependency.dType = dType})))))
        pchar '[' >>. parseDepFields .>> pchar ']'

    let parseDependencies: Parser<Dependency.t list, unit> =
        sepBy parseDependency skipNewline

[<Properties( Arbitrary=[| typeof<DependencyGenerator> |] )>]
module BootTest =

    [<Property>]
    let ``Boot dependency output conforms to model`` (deps: Dependency.t list) =
        let textOutput = Boot.emit deps
        let (parsedDeps, parseResult) =
            let parseResult = run BootParser.parseDependencies textOutput
            match parseResult with
            | Success (res, _, _) -> (res, parseResult)
            | _ -> ([], parseResult)
        let label = sprintf "while parsing %A\n parse result was: %A" deps parseResult
        deps = parsedDeps |@ label
