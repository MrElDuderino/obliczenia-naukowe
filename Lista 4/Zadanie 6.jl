#Autor: Jakub Iwon (236612)

include("Interpolacja.jl")
using .Interpolacja

rysujNnfx(x->abs(x), -1.0, 1.0, 5, 16)
rysujNnfx(x->abs(x), -1.0, 1.0, 10, 17)
rysujNnfx(x->abs(x), -1.0, 1.0, 15, 18)
rysujNnfx(x->1/(1+x^2), -5.0, 5.0, 5, 19)
rysujNnfx(x->1/(1+x^2), -5.0, 5.0, 10, 20)
rysujNnfx(x->1/(1+x^2), -5.0, 5.0, 15, 21)


