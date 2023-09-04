# Run the test

using Uncertainties
using Test

@testset "Type Tests" begin include("types.jl") end
@testset "Numerical Tests" begin include("numerical.jl") end

