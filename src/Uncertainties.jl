module Uncertainties

# To extend the base operations
import Base: promote_rule, convert

# Store as floating point for division to make sense (ie integers are converted)
struct Uncertainty{T<:AbstractFloat} <: AbstractFloat
    nom::T
    uncert::T
end

uncertainty(nom::T) where {T<:AbstractFloat} = Uncertainty(nom, zero(T))
uncertainty(nom::Real) = uncertainty(float(nom))

# root method to create uncertainty
function uncertainty(nom::T, uncert::T) where {T<:AbstractFloat}
    return Uncertainty(nom, uncert)
end

function uncertainty(nom::T, uncert::S) where {T<:AbstractFloat, S<:AbstractFloat}
    return uncertainty(promote(nom, uncert)...)
end

function uncertainty(a::Real, b::Real)
    if typeof(a) <: AbstractFloat || typeof(b) <: AbstractFloat
        return uncertainty(promote(a,b)...)
    end
    # Use Float64 probably
    return uncertainty(promote(float(a), float(b))...)
end


promote_rule(::Type{Uncertainty{T}}, ::Type{S}) where {T<:AbstractFloat, S<:Real} = Uncertainty{promote_type(T,S)}
promote_rule(::Type{Uncertainty{T}}, ::Type{Uncertainty{S}}) where {T<:AbstractFloat, S<:AbstractFloat} = Uncertainty{promote_type(T,S)}

convert(::Type{Uncertainty{T}}, a::Uncertainty{<:AbstractFloat}) where {T<:AbstractFloat} = uncertainty(T(a.nom), T(a.uncert))
convert(::Type{Uncertainty{T}}, a::Real) where {T<:AbstractFloat} = uncertainty(T(a))

± = uncertainty 


include("math.jl")


# `Uncertainty` is the type and `uncertainty` is the initilisation function
export Uncertainty, uncertainty, ±
end