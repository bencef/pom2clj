namespace Bencef.Pom2Clj.Test

open FsCheck
open FsCheck.Xunit
open FParsec

open Bencef.Pom2Clj.Lib

module private CljParser =

    let parseIdentifier: Parser<string, unit> =
        many1Chars (pchar '-' <|> pchar '.' <|> letter <|> digit)

    let parseDependency: Parser<Dependency.t, unit> =
        let quoted p = between (pchar '"') (pchar '"') p
        let parseOpt kind =
            (spaces .>> skipString kind .>> spaces >>. quoted parseIdentifier)
            |> attempt |> opt
        let parseDepFields =
            parseIdentifier >>= (fun groupId ->
            pchar '/' >>. parseIdentifier >>= (fun artifactId ->
            spaces >>. quoted parseIdentifier >>= (fun version ->
            parseOpt ":scope" >>= (fun scope ->
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
module CljTest =

    [<Property>]
    let ``Clj dependency output conforms to model`` (deps: Dependency.t list) =
        let textOutput = Clj.emit deps
        let (parsedDeps, parseResult) =
            let parseResult = run CljParser.parseDependencies textOutput
            match parseResult with
            | Success (res, _, _) -> (res, parseResult)
            | _ -> ([], parseResult)
        let label = sprintf "while parsing %A\n parse result was: %A" deps parseResult
        deps = parsedDeps |@ label
