# math functions

import Base: +,-,==,*,/,^,≈

# Overload basic methods

+(a::Uncertainty, b::Uncertainty)::Uncertainty = Uncertainty(a.nom + b.nom, a.uncert+b.uncert)
-(a::Uncertainty, b::Uncertainty)::Uncertainty = Uncertainty(a.nom - b.nom, a.uncert+b.uncert)

# use relative Uncertainties
*(a::Uncertainty, b::Uncertainty)::Uncertainty = Uncertainty(a.nom*b.nom, (a.uncert/a.nom + b.uncert/b.nom)*(a.nom*b.nom))
/(a::Uncertainty, b::Uncertainty)::Uncertainty = Uncertainty(a.nom/b.nom, (a.uncert/a.nom + b.uncert/b.nom)*(a.nom/b.nom))

^(a::Uncertainty, b::AbstractFloat)::Uncertainty = Uncertainty(a.nom^b, (a.uncert/a.nom)*(a.nom*b))

==(a::Uncertainty, b::Uncertainty) = (a.nom == b.nom) && (a.uncert == b.uncert)

# TODO Update approx to be true if within range
≈(a::Uncertainty, b::Uncertainty) = (a.nom ≈ b.nom) && (a.uncert ≈ b.uncert)