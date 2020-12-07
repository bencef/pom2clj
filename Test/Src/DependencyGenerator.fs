namespace Bencef.Pom2Boot.Test

open FsCheck

open Bencef.Pom2Boot.Lib

type DependencyGenerator =
    static member Dependency () =
        let genLetter = Gen.elements "abcdefghijkl"
        let genPart = gen {
            let! len = Gen.choose (2, 10)
            let! letters = Gen.listOfLength len genLetter
            return letters |> System.String.Concat }
        let genIdentifier = gen {
            let! nParts = Gen.choose (1, 4)
            let! parts = Gen.listOfLength nParts genPart
            return parts |> String.concat "." }
        let someString = gen {
            let! str = genIdentifier
            return Some str }
        let genOptional = gen {
            let! isNeeded = Arb.generate<bool>
            if isNeeded
            then return! someString
            else return None }
        let genDep = gen {
            let! groupId = genIdentifier
            let! artifactId = genIdentifier
            let! version = genIdentifier
            let! scope = genOptional
            let! dType = genOptional
            return { Dependency.groupId = groupId
                     Dependency.artifactId = artifactId
                     Dependency.version = version
                     Dependency.scope = scope
                     Dependency.dType = dType }}
        { new Arbitrary<Dependency.t>() with
            override __.Generator  = genDep
            override __.Shrinker t = Seq.empty }
