# addition
@test Uncertainty(1.0,0.5)+Uncertainty(2.0,0.2) == Uncertainty(3.0,0.7)
#@test Uncertainty(3.0, 0.2) + 4.0 == Uncertainty(7.0, 0.2)

# subtraction
@test Uncertainty(1.2,0.5)-Uncertainty(2.2,0.2) == Uncertainty(-1.0000000000000002,0.7)  # floating point error


# multiplication
@test Uncertainty(1.2,0.5)*Uncertainty(2.2,0.2) == Uncertainty(2.64, 1.34)


# power
@test Uncertainty(1.0,0.5)^2 == Uncertainty(1.0, 1.0)
@test Uncertainty(1.3, 0.5)^2 == Uncertainty(1.3^2, 1.3)

# Tests to add
# - Negative value tests
# - 0 value tests