#Autor: Jakub Iwon (236612)

include("MetodyIteracyjne.jl")
using .MetodyIteracyjne

f1(x) = exp(1-x) - 1
pf1(x) = -exp(1-x)
f2(x) = x * exp(-x)
pf2(x) = -1 * (x-1) * exp(-x)

delta = 10^-5
epsilon = delta

println("\ne^(1-x) - 1\n")

println("Metoda bisekcji dla przedziału [0.6, 1.5]: ", mbisekcji(f1, 0.6, 1.5, delta, epsilon))
println("Metoda bisekcji dla przedziału [-10, 10] ", mbisekcji(f1, -10.0, 10.0, delta, epsilon))
println("Metoda bisekcji dla przedziału [-1000, 1000] ", mbisekcji(f1, -1000.0, 1000.0, delta, epsilon))


println("Metoda Newtona dla x0 = 1.5: ", mstycznych(f1, pf1, 1.5, delta, epsilon, 100))
println("Metoda Newtona dla x0 = 10: ", mstycznych(f1, pf1, 10.0, delta, epsilon, 100))
println("Metoda Newtona dla x0 = 1000: ", mstycznych(f1, pf1, 1000.0, delta, epsilon, 100))


println("Metoda siecznych dla x0 = 0 oraz x1 = 1.5 ", msiecznych(f1, 0.0, 1.5, delta, epsilon, 100))
println("Metoda siecznych dla x0 = 0.2 oraz x1 = 10 ", msiecznych(f1, 0.2, 3.0, delta, epsilon, 100))
println("Metoda siecznych dla x0 = 2 oraz x1 = 4 ", msiecznych(f1, 2.0, 4.0, delta, epsilon, 100))



println("\nx * e^(-x)\n")

println("Metoda bisekcji dla przedziału [-1, 1.5]: ", mbisekcji(f2, -1.0, 1.5, delta, epsilon))
println("Metoda bisekcji dla przedziału [-15, 10] ", mbisekcji(f2, -15.0, 10.0, delta, epsilon))
println("Metoda bisekcji dla przedziału [-1000, 30] ", mbisekcji(f2, -1000.0, 30.0, delta, epsilon))


println("Metoda Newtona dla x0 = 0.5: ", mstycznych(f2, pf2, 0.5, delta, epsilon, 100))
println("Metoda Newtona dla x0 = 1: ", mstycznych(f2, pf2, 1.0, delta, epsilon, 100))
println("Metoda Newtona dla x0 = 40: ", mstycznych(f2, pf2, 40.0, delta, epsilon, 100))


println("Metoda siecznych dla x0 = 0.5 oraz x1 = 1.5 ", msiecznych(f2, 0.5, 1.5, delta, epsilon, 100))
println("Metoda siecznych dla x0 = 0.2 oraz x1 = 3.0 ", msiecznych(f2, 0.2, 3.0, delta, epsilon, 100))
println("Metoda siecznych dla x0 = 2.0 oraz x1 = 4.0 ", msiecznych(f2, 2.0, 4.0, delta, epsilon, 100))