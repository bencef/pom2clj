namespace Bencef.Pom2Clj.Lib

open FSharp.Data

module Pom =

    type PomProvider = XmlProvider<"../pom-example.xml">

    let extractDependencies (project: PomProvider.Project): Dependency.t list =
        let mkDep (dep: PomProvider.Dependency) = {
            Dependency.groupId = dep.GroupId
            Dependency.artifactId = dep.ArtifactId
            Dependency.version = dep.Version
            Dependency.scope = dep.Scope
            Dependency.dType = dep.Type
        }
        project.Dependencies
        |> Array.map mkDep
        |> List.ofArray

    let parseString (contents: string): Dependency.t list =
        PomProvider.Parse contents |> extractDependencies

    let parseFile (reader: System.IO.TextReader): Dependency.t list =
        PomProvider.Load reader |> extractDependencies
