function _polldir()
    pd = pkgdir(@__MODULE__)
    if isnothing(pd)
        pd = ""
    end
    joinpath(pd, "poll")
end


function summarize(polldir=_polldir())
    dirs = filter(p -> isdir(p), readdir(polldir, join=true))
    df = (; food=String[])

    for d in dirs
        tomlfile = joinpath(d, "food", "Data.toml")
        try
            checktomlformat(tomlfile)
        catch e
            @warn "There is a format issue in $(tomlfile) $(e)"
            continue
        end

        toml = TOML.parsefile(tomlfile)
        if toml["food"] isa String
            push!(df.food, toml["food"]))
        elseif toml["food"] isa Vector{String}
            append!(df.food, toml["food"]))
        end
    end
    df
end
