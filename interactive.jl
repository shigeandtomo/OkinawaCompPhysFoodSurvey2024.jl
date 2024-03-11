using LibGit2
using REPL.TerminalMenus
using TOML

using OkinawaCompPhysFoodSurvey2024: INTERACTIVE_OKINAWA_FOOD_OPTIONS

default_githubuser() = LibGit2.getconfig("github.user", "")

struct MissingUserException <: Exception end
function Base.showerror(io::IO, ::MissingUserException)
    s = """Git hosting service username is required, set one with keyword `githubuser="<YourGitHubUserName>"`"""
    print(io, s)
end

function interactive(; githubuser::Union{String,Nothing}=nothing)
    if isnothing(githubuser)
        githubuser = default_githubuser()::String
    end
    @info "githubuser=$githubuser"
    !isempty(githubuser) || throw(MissingUserException())

    try
        menu = RadioMenu(INTERACTIVE_OKINAWA_FOOD_OPTIONS, pagesize=4)

        choice = request("Choose your favorite okinawa food:", menu)

        if choice != -1
            println("Your favorite food is ", INTERACTIVE_OKINAWA_FOOD_OPTIONS[choice], "!")
        else
            println("Menu canceled.")
        end

        userworkspace = joinpath("poll", githubuser, "food")
        mkpath(userworkspace)
        tomlfile = joinpath(userworkspace, "Data.toml")
        food = INTERACTIVE_OKINAWA_FOOD_OPTIONS[choice]
        open(tomlfile, "w") do io
            TOML.print(io, Dict(:food => String[food]))
        end
        @info "tomlfile=$tomlfile has been created"
    catch e
        e isa InterruptException || rethrow()
        println()
        @info "Cancelled"
        return nothing
    end
end

interactive()