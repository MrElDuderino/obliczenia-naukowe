#Autor: Jakub Iwon (236612)

include("Interpolacja.jl")
using .Interpolacja

rysujNnfx(x->exp(x), 0.0, 1.0, 5, 10)
rysujNnfx(x->exp(x), 0.0, 1.0, 10, 11)
rysujNnfx(x->exp(x), 0.0, 1.0, 15, 12)
rysujNnfx(x->(x^2)*sin(x), -1.0, 1.0, 5, 13)
rysujNnfx(x->(x^2)*sin(x), -1.0, 1.0, 10, 14)
rysujNnfx(x->(x^2)*sin(x), -1.0, 1.0, 15, 15)


