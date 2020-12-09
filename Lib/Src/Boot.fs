namespace Bencef.Pom2Boot.Lib

module Boot =

    let private dep2str (dep: Dependency.t): string =
        let optionally tag valueOpt =
            Option.map (fun v -> sprintf ":%s \"%s\"" tag v) valueOpt
        let fields =
            let parts = [
                sprintf "%s/%s" dep.groupId dep.artifactId
                sprintf "\"%s\"" dep.version
                optionally "scope" dep.scope |> Option.defaultValue ""
                optionally "type" dep.dType  |> Option.defaultValue "" ]
            parts
            |> List.filter (System.String.IsNullOrEmpty >> not)
            |> String.concat " "
        sprintf "[%s]" fields

    let emit (deps: Dependency.t list): string =
        deps
        |> List.map dep2str
        |> String.concat "\n"
