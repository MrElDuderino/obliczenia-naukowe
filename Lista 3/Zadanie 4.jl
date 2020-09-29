#Autor: Jakub Iwon (236612)

include("MetodyIteracyjne.jl")
using .MetodyIteracyjne


f(x) = sin(x) - (0.5*x)^2
pf(x) = cos(x) - 0.5*x
delta = 0.5 * 10^-5
epsilon = delta

println("Metoda bisekcji: ", mbisekcji(f, 1.5, 2.0, delta, epsilon))
println("Metoda Newtona: ", mstycznych(f, pf, 1.5, delta, epsilon, 100))
println("Metoda siecznych: ", msiecznych(f, 1.0, 2.0, delta, epsilon, 100))