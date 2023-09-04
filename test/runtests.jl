# Run the test

using Uncertainties
using Test

# use skip=true if the test is broken

@testset "Type Tests" begin include("types.jl") end
@testset "Numerical Tests" begin include("numerical.jl") end

