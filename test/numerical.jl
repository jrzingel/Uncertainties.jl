# equality tests
@test 1.0 ± 0.2 == uncertainty(1.0, 0.2)
@test uncertainty(2.2-1.2, 0.0) == uncertainty(1.0000000000000002, 0.0)

# approximate tests
@test (1.0 ± 0.2) ≈ (1.0 ± 0.2)
@test (2.2-1.2 ± 0.0) ≈ (1.0000000000000002 ± 0.0) skip=true

# addition
@test (1.0 ± 0.5)+(2.0 ± 0.2) ≈ (3.0 ± 0.7) 
@test (3.0 ± 0.2) + 4.0 == (7.0 ± 0.2)

# subtraction
@test (1.2 ± 0.5)-(2.2 ± 0.2) ≈ (-1.0 ± 0.7)  # floating point error 


# multiplication
@test (1.2 ± 0.5)*(2.2 ± 0.2) ≈ (2.64 ± 1.34)


# power
@test (1.0 ± 0.5)^2 ≈ (1.0 ± 1.0)
@test (1.3 ± 0.5)^2 ≈ (1.3^2 ± 1.3)

# Tests to add
# - Negative value tests
# - 0 value tests
# - Multiple additions 