module OkinawaCompPhysFoodSurvey2024

using LibGit2
using TOML
using REPL.TerminalMenus

# Write your package code here.
include("survey_contents.jl")
const REQUIRED_KEYS = [(OkinawaFood, "food")]

include("format_checker.jl")
include("github.jl")
include("stats.jl")

end
