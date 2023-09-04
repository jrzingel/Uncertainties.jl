# no Uncertainty
@test Uncertainty(2.0) == Uncertainty(2.0, 0.0)

# different float types
@test Uncertainty(Float32(2.3), Float64(1.0))

# creation with Integer
@test Uncertainty(2, 1) == Uncertainty(2.0, 1.0)
@test Uncertainty(2, 1.0) == Uncertainty(2.0, 1.0)
@test Uncertainty(2.0, 1) == Uncertainty(2.0, 1.0)
