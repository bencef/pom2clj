namespace Bencef.Pom2Boot.Lib

module Boot =

    let private dep2str (dep: Dependency.t): string =
        let fields =
            let parts = [
                sprintf "%s/%s" dep.groupId dep.artifactId
                sprintf "\"%s\"" dep.version
                sprintf ":scope \"%s\"" <| Option.defaultValue "" dep.scope
                sprintf ":type \"%s\"" <| Option.defaultValue "" dep.dType ]
            parts
            |> List.filter (System.String.IsNullOrEmpty >> not)
            |> String.concat " "
        sprintf "[%s]" fields

    let emit (deps: Dependency.t list): string =
        deps
        |> List.map dep2str
        |> String.concat "\n"
