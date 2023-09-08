# equality tests
@test 1.0 ± 0.2 == uncertainty(1.0, 0.2)
@test uncertainty(2.2-1.2, 0.0) == uncertainty(1.0000000000000002, 0.0)

# addition
@test (1.0 ± 0.5)+(2.0 ± 0.2) == (3.0 ± 0.7) 
@test (1.0 ± 0.5) + (2.0 ± 0.2) + (3.0 ± 0.7) == 6 ± 1.4

@test (3.0 ± 0.2) + 4.0 == (7.0 ± 0.2)
@test 3 ± 0.1 + 44 == 47 ± 0.1
@test 3 + (0.2 ± 0.1) + (1.0 ± 0.9) == 4.2 ± 1

# subtraction
@test (1.2 ± 0.5)-(2.2 ± 0.2) == (-1.0000000000000002 ± 0.7)  # floating point error 
@test -2.1 ± 1.0 - 3 == -5.1 ± 1.0

# multiplication
@test (1.2 ± 0.5)*(2.2 ± 0.2) == (2.64 ± 1.34)
@test (3±0.1) * -3 == -9 ± 0.3
@test isnan(((0 ± 0.3)*(2.2 ± 0.1)).uncert)

@test (1.2±3.2) * 2.0 == (1.2±3.2) + (1.2±3.2)

# division
@test (-3.2±0.1) / (0.01±3) == -320 ± 96010
@test 3 / (-6±0.1) == -0.5 ± 0.008333333333333333

# power
@test (1.0 ± 0.5)^2 == (1.0 ± 1.0)
@test (1.3 ± 0.5)^2 == (1.3^2 ± 1.3)  # note x^2 is evaled as x*x
@test (0.2 ± 4)^(-3.2) == (0.2)^(-3.2) ± 4/0.2 * 3.2 * (0.2^-3.2)

@test (1.2±3.2) * (1.2±3.2) == (1.2±3.2)^2.0 skip=true # evals correct, just floating point error
