# recursion with cache does not really work here, 
# because look up in dictionary also takes time

cache = Dict{Int, Int}()
calls = 0

function grow2(age, day, cache)
    day == 0 && return 1
    if age == 0
        return get!(cache, day, grow2(6, day-1, cache) + grow2(8, day-1, cache))
    end
    return grow2(age-1, day-1, cache)
end

function grow(age, day)
    day == 0 && return 1
    age == 0 && return grow(6, day-1) + grow(8, day-1)
    return grow(age-1, day-1)
end

m = [3,4,3,1,2]
p = [3,1,4,2,1,1,1,1,1,1,1,4,1,4,1,2,1,1,2,1,3,4,5,1,1,4,1,3,3,1,1,1,1,3,3,1,3,3,1,5,5,1,1,3,1,1,2,1,1,1,3,1,4,3,2,1,4,3,3,1,1,1,1,5,1,4,1,1,1,4,1,4,4,1,5,1,1,4,5,1,1,2,1,1,1,4,1,2,1,1,1,1,1,1,5,1,3,1,1,4,4,1,1,5,1,2,1,1,1,1,5,1,3,1,1,1,2,2,1,4,1,3,1,4,1,2,1,1,1,1,1,3,2,5,4,4,1,3,2,1,4,1,3,1,1,1,2,1,1,5,1,2,1,1,1,2,1,4,3,1,1,1,4,1,1,1,1,1,2,2,1,1,5,1,1,3,1,2,5,5,1,4,1,1,1,1,1,2,1,1,1,1,4,5,1,1,1,1,1,1,1,1,1,3,4,4,1,1,4,1,3,4,1,5,4,2,5,1,2,1,1,1,1,1,1,4,3,2,1,1,3,2,5,2,5,5,1,3,1,2,1,1,1,1,1,1,1,1,1,3,1,1,1,3,1,4,1,4,2,1,3,4,1,1,1,2,3,1,1,1,4,1,2,5,1,2,1,5,1,1,2,1,2,1,1,1,1,4,3,4,1,5,5,4,1,1,5,2,1,3]


@time grow.(m, 80) |> sum
@time grow.(m, 80) |> sum

@time [grow2(i, 80, cache) for i in m] |> sum
@time [grow2(i, 80, cache) for i in m] |> sum



nothing