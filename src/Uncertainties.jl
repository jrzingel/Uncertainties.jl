module Uncertainties

# To extend the base operations
import Base: +,-,==,*,/,^,sqrt
import Base: promote, promote_rule

# Uncertainty with the values using any real number, which is a subtype of real numbers
# (should it be only floats instead?)
struct Uncertainty{T<:AbstractFloat} <: AbstractFloat
    nom::T
    uncert::T
end

Uncertainty(nom::AbstractFloat) = Uncertainty(nom, 0.0)
Uncertainty(a::Type{T}, b::Type{S}) where {T<:Real, S<:Real} = Uncertainty(promote(a,b)...)

promote_rule(::Type{Uncertainty{T}}, ::Type{S}) where {T<:AbstractFloat, S<:AbstractFloat} = Uncertainty{promote_type(T,S)}
#promote(un::Uncertainty, a::AbstractFloat)::Uncertainty = 
#Uncertainty(a<:Integer, b<:Integer) = Uncertainty()

+(a::Uncertainty, b::Uncertainty)::Uncertainty = Uncertainty(a.nom + b.nom, a.uncert+b.uncert)
-(a::Uncertainty, b::Uncertainty)::Uncertainty = Uncertainty(a.nom - b.nom, a.uncert+b.uncert)

# use relative Uncertainties
*(a::Uncertainty, b::Uncertainty)::Uncertainty = Uncertainty(a.nom*b.nom, (a.uncert/a.nom + b.uncert/b.nom)*(a.nom*b.nom))
/(a::Uncertainty, b::Uncertainty)::Uncertainty = Uncertainty(a.nom/b.nom, (a.uncert/a.nom + b.uncert/b.nom)*(a.nom/b.nom))

^(a::Uncertainty, b::AbstractFloat)::Uncertainty = Uncertainty(a.nom^b, (a.uncert/a.nom)*(a.nom*b))


==(a::Uncertainty, b::Uncertainty) = (a.nom == b.nom) && (a.uncert == b.uncert)


export Uncertainty
end