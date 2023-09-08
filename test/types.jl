# no Uncertainty
@test uncertainty(2.0) == uncertainty(2.0, 0.0)
@test uncertainty(3//2) == uncertainty(1.5, 0.0)
@test uncertainty(4) == uncertainty(4.0, 0.0)


# with uncertainty
# with ± symbol
@test (3.0 ± 2.0) == uncertainty(3.0, 2.0)
# creation with Integer
@test uncertainty(2, 1) == uncertainty(2.0, 1.0)
@test uncertainty(2, 1.0) == uncertainty(2.0, 1.0)
@test uncertainty(2.0, 1) == uncertainty(2.0, 1.0)

# creation with Rational
@test uncertainty(4//2, 1.0) == uncertainty(2.0, 1.0)

# different float types
@test uncertainty(Float32(2.3), Float64(1.0)) == uncertainty(Float32(2.3), Float64(1.0))