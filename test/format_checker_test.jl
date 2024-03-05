@testitem "checker.jl" begin
    using Test
    using TOML
    using OkinawaCompPhysFoodSurvey2024
    using OkinawaCompPhysFoodSurvey2024: DataFormatError
    using OkinawaCompPhysFoodSurvey2024: checktomlformat
    @testset "checktomlformat Valid cases" begin
        valid_yakiniku = "references/poll/valid_kokutou/Data.toml"
        toml = TOML.parsefile(valid_yakiniku)
        toml["food"] == ["黒糖"]
        @test checktomlformat(valid_yakiniku)

        valid_yakiniku = "references/poll/valid_yagi/Data.toml"
        toml = TOML.parsefile(valid_yakiniku)
        toml["food"] == "ヤギの刺身"
        @test checktomlformat(valid_yakiniku)

        valid_yakiniku = "references/poll/valid_misc/Data.toml"
        toml = TOML.parsefile(valid_yakiniku)
        toml["food"] == "DragonFruit"
        @test checktomlformat(valid_yakiniku)

        valid_yakiniku = "references/poll/valid_multiple_values/Data.toml"
        toml = TOML.parsefile(valid_yakiniku)
        toml["food"] == "DragonFruit"
        @test checktomlformat(valid_yakiniku)
    end

    @testset "checktomlformat Exception" begin
        invalid_tomlfile1 = "references/poll/invalid1/Data.toml"
        @test_throws "OkinawaCompPhysFoodSurvey2024.DataFormatError(\"Please add food key.\")" checktomlformat(
            invalid_tomlfile1,
        )

        invalid_tomlfile2 = "references/poll/invalid2/Data.toml"
        @test_throws TOML.ParserError checktomlformat(invalid_tomlfile2)

        invalid_tomlfile3 = "references/poll/invalid3/Data.toml"
        @test_throws DataFormatError(
            "Unexpected key(s) Set([\"unexpectedkey\", \"food\"])",
        ) checktomlformat(
            invalid_tomlfile3,
        )

        invalid_tomlfile4 = "references/poll/invalid4/Data.toml"
        @test_throws DataFormatError(
            "The value for key \"food\" is empty. Please add something.",
        ) checktomlformat(
            invalid_tomlfile4,
        )
    end
end
