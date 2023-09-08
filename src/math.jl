# math functions

import Base: +,-,==,*,/,^,≈

# Overload basic methods

+(a::Uncertainty, b::Uncertainty)::Uncertainty = uncertainty(a.nom + b.nom, a.uncert+b.uncert)
-(a::Uncertainty, b::Uncertainty)::Uncertainty = uncertainty(a.nom - b.nom, a.uncert+b.uncert)

# use relative Uncertainties
*(a::Uncertainty, b::Uncertainty)::Uncertainty = uncertainty(a.nom*b.nom, (a.uncert/abs(a.nom) + b.uncert/abs(b.nom))*abs(a.nom*b.nom))
/(a::Uncertainty, b::Uncertainty)::Uncertainty = uncertainty(a.nom/b.nom, (a.uncert/abs(a.nom) + b.uncert/abs(b.nom))*abs(a.nom/b.nom))

^(a::Uncertainty, b::AbstractFloat)::Uncertainty = uncertainty(a.nom^b, a.uncert*abs(b*a.nom^(b-1)))

==(a::Uncertainty, b::Uncertainty) = (a.nom == b.nom) && (a.uncert == b.uncert)

# TODO Update approx to be true if within range
≈(a::Uncertainty, b::Uncertainty) = (a.nom ≈ b.nom) && (a.uncert ≈ b.uncert)