const INTERACTIVE_OKINAWA_FOOD_OPTIONS = ["沖縄そば", "ヤギの刺身", "ミミガー", "黒糖", "海ぶどう"]

struct OkinawaFood end

function isvalid(::Type{OkinawaFood}, o)
    b1 = o isa String
    b2 = o isa Vector{String}
    return b1 || b2
end
