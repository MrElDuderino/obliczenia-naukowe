#Autor: Jakub Iwon (236612)

include("Interpolacja.jl")
using .Interpolacja

rysujNnfx(x->x, -50.0, 50.0, 3, 1)
rysujNnfx(x->x, -50.0, 50.0, 10, 2)
rysujNnfx(x->x, -50.0, 50.0, 30, 3)

rysujNnfx(x->x^2 + 4*x, -50.0, 50.0, 3, 4)
rysujNnfx(x->x^2 + 4*x, -50.0, 50.0, 10, 5)
rysujNnfx(x->x^2 + 4*x, -50.0, 50.0, 30, 6)

rysujNnfx(x->x^3, -50.0, 50.0, 3, 7)
rysujNnfx(x->x^3, -50.0, 50.0, 10, 8)
rysujNnfx(x->x^3, -50.0, 50.0, 30, 9)
