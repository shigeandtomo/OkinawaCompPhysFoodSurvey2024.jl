using OkinawaCompPhysFoodSurvey2024
using Documenter
using DocumenterMermaid: DocumenterMermaid

DocMeta.setdocmeta!(
    OkinawaCompPhysFoodSurvey2024,
    :DocTestSetup,
    :(using OkinawaCompPhysFoodSurvey2024);
    recursive=true,
)

makedocs(;
    modules=[OkinawaCompPhysFoodSurvey2024],
    authors="Satoshi Terasaki <terasakisatoshi.math@gmail.com> and contributors",
    sitename="OkinawaCompPhysFoodSurvey2024.jl",
    format=Documenter.HTML(;
        canonical="https://terasakisatoshi.github.io/OkinawaCompPhysFoodSurvey2024.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "API" => "api.md",
    ],
)

deploydocs(;
    repo="github.com/terasakisatoshi/OkinawaCompPhysFoodSurvey2024.jl",
    devbranch="main",
)
