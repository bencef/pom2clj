namespace Bencef.Pom2Clj.Test

open FsCheck
open FsCheck.Xunit

open Bencef.Pom2Clj.Lib

[<Properties( Arbitrary=[| typeof<DependencyGenerator> |] )>]
module PomTest =

    let createDocWith (deps: Dependency.t list): string =
        let optionally tag value =
            value
            |> Option.map (fun s -> sprintf "      <%s>%s</%s>" tag s tag)
            |> Option.defaultValue ""
        let dep2str (dep: Dependency.t) =
            [
                "    <dependency>"
                sprintf "      <groupId>%s</groupId>" dep.groupId
                sprintf "      <artifactId>%s</artifactId>" dep.artifactId
                sprintf "      <version>%s</version>" dep.version
                optionally "scope" dep.scope
                optionally "type" dep.dType
                "    </dependency>"
            ]
            |> List.filter (fun s -> s <> "")
            |> String.concat "\n"

        let render depStrings =
            [
                "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                "<project xmlns=\"http://maven.apache.org/POM/4.0.0\""
                "         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
                "         xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\">"
                "  <modelVersion>4.0.0</modelVersion>"
                ""
                "  <dependencies>"
                depStrings |> String.concat "\n"
                "  </dependencies>"
                "</project>"
            ] |> String.concat "\n"
        deps
        |> Seq.map dep2str
        |> render

    [<Property>]
    let ``Dependencies are parsed correctly`` (deps: Dependency.t list) =
        let doc = createDocWith deps
        let paredDeps = Pom.parseString doc
        deps = paredDeps |@ sprintf "%A = %A" deps paredDeps
