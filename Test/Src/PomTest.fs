namespace Bencef.Pom2Boot.Test

open Xunit

open Bencef.Pom2Boot.Lib

module PomTest =

    [<Fact>]
    let ``Can call into module`` () =
        let result = Pom.changeMe ()
        let expected = 0
        Assert.Equal(expected, result)
