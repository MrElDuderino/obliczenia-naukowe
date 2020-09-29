#Autor: Jakub Iwon (236612)

include("MetodyIteracyjne.jl")
using .MetodyIteracyjne

f1(x) = x^3 - 27
pf1(x) = 3*x^2
f2(x) = 4*x - 4
pf2(x) = 4*x - 4
f3(x) = exp(x) - 1
pf3(x) = exp(x)


delta = 2.0^-20
epsilon = 2.0^-20
maxit = 60


println("f1 = x^3 - 27\n")

println("Metoda bisekcji: ", mbisekcji(f1, 1.0, 7.0, delta, epsilon))
println("Metoda Newtona: ", mstycznych(f1, pf1, 8.0, delta, epsilon, maxit))
println("Metoda siecznych: ", msiecznych(f1, 1.0, 7.0, delta, epsilon, maxit))

println("\nf2 = 4x - 4\n")

println("Metoda bisekcji: ", mbisekcji(f2, -4.0, 6.0, delta, epsilon))
println("Metoda Newtona: ", mstycznych(f2, pf2, 5.0, delta, epsilon, maxit))
println("Metoda siecznych: ", msiecznych(f2, 4.0, 8.0, delta, epsilon, maxit))

println("\nf3 = e^x - 1\n")

println("Metoda bisekcji: ", mbisekcji(f3, -3.0, 2.0, delta, epsilon))
println("Metoda Newtona: ", mstycznych(f3, pf3, 4.0, delta, epsilon, maxit))
println("Metoda siecznych: ", msiecznych(f3, 3.0, 7.0, delta, epsilon, maxit))
