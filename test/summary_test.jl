@testitem "checker.jl" begin
    using TOML

    using OkinawaCompPhysFoodSurvey2024: summarize
    @testset "checktomlformat summarize" begin
        df = summarize()
        @test length(df.food) > 1
    end
end
