include("Interpolacja.jl")
using .Interpolacja

x = [-1.0, 0.0, 1.0, 2.0]
y = [-1.0, 0.0, -1.0, 2.0]

fx = ilorazyRoznicowe(x, y)
println(naturalna(x, fx))