module Uncertainties

# To extend the base operations
import Base: +,-,==,*,/,^,≈
import Base: promote_rule, convert

# Store as floating point for division to make sense (ie integers are converted)
struct Uncertainty{T<:AbstractFloat} <: AbstractFloat
    nom::T
    uncert::T
end

Uncertainty(nom::AbstractFloat) = Uncertainty(nom, 0.0)
Uncertainty(nom::Integer) = Uncertainty(nom, 0.0)
Uncertainty(nom::Rational) = Uncertainty(nom, 0.0)

function Uncertainty(a::Real, b::Real)
    if typeof(a) <: AbstractFloat || typeof(b) <: AbstractFloat
        return Uncertainty(promote(a,b)...)
    end
    # Use Float64 probably
    return Uncertainty(convert(AbstractFloat, a), convert(AbstractFloat, b))
end

# Allow Uncertainty{AbstractFloat} + 3.3 to be valid
#convert(::Type{Uncertainty}, a::Float64) = Uncertainty(a)
#promote_rule(::Type{Uncertainty{T}}, ::Type{T}) where {T <: AbstractFloat} = Uncertainty{T}

# Overload basic methods

+(a::Uncertainty, b::Uncertainty)::Uncertainty = Uncertainty(a.nom + b.nom, a.uncert+b.uncert)
-(a::Uncertainty, b::Uncertainty)::Uncertainty = Uncertainty(a.nom - b.nom, a.uncert+b.uncert)

# use relative Uncertainties
*(a::Uncertainty, b::Uncertainty)::Uncertainty = Uncertainty(a.nom*b.nom, (a.uncert/a.nom + b.uncert/b.nom)*(a.nom*b.nom))
/(a::Uncertainty, b::Uncertainty)::Uncertainty = Uncertainty(a.nom/b.nom, (a.uncert/a.nom + b.uncert/b.nom)*(a.nom/b.nom))

^(a::Uncertainty, b::AbstractFloat)::Uncertainty = Uncertainty(a.nom^b, (a.uncert/a.nom)*(a.nom*b))

==(a::Uncertainty, b::Uncertainty) = (a.nom == b.nom) && (a.uncert == b.uncert)
≈(a::Uncertainty, b::Uncertainty) = (a.nom ≈ b.nom) && (a.uncert ≈ b.uncert)


export Uncertainty
end