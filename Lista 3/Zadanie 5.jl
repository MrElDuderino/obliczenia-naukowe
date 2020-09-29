#Autor: Jakub Iwon (236612)

include("MetodyIteracyjne.jl")
using .MetodyIteracyjne

f(x) = exp(x) - 3*x
delta = 10^-4
epsilon = delta

println(mbisekcji(f, 0.5, 0.75, delta, epsilon))
println(mbisekcji(f, 1.45, 1.6, delta, epsilon))