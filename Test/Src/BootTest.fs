namespace Bencef.Pom2Boot.Test

open FsCheck
open FsCheck.Xunit

[<Properties( Arbitrary=[| typeof<DependencyGenerator> |] )>]
module BootTest = begin
    end
