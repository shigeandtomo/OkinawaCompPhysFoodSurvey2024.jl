

using LibGit2
using REPL.TerminalMenus
using TOML

using OkinawaCompPhysFoodSurvey2024: OkinawaFood, checktomlformat

default_githubuser() = LibGit2.getconfig("github.user", "")

struct MissingUserException <: Exception end
function Base.showerror(io::IO, ::MissingUserException)
    s = """Git hosting service username is required, set one with keyword `githubuser="<YourGitHubUserName>"`"""
    print(io, s)
end

function check(; githubuser::Union{String,Nothing}=nothing)
    if isnothing(githubuser)
        githubuser = default_githubuser()::String
    end
    @info "githubuser=$githubuser"
    !isempty(githubuser) || throw(MissingUserException())

    userworkspace = joinpath("poll", githubuser, "food")
    tomlfile = joinpath(userworkspace, "Data.toml")
    checktomlformat(tomlfile)
    @info "Your tomlfile=$tomlfile is valid. Go on to the next step"
end

check()