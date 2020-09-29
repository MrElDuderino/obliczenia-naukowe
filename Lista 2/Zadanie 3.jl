#Autor: Jakub Iwon (236612)

using LinearAlgebra

include("hilb.jl")
include("matcond.jl")


println("Macierz Hilberta: \n")

conds = []
ns = []


for n in 2:100

	A = hilb(n)
	x = ones(n)
	b = A * x
	xe1 = inv(A) * b
	xe2 = A\b

	println("n = ", n, "  c = ", cond(A), "  Błąd (odwrotność) = ", (norm(x - xe1)/norm(x)) * 100, "%   Błąd (eliminacja Gaussa) = ", (norm(x - xe2)/norm(x)) * 100, "%")

end


println("\n_________________________________________________________________________________________________\n")
println("Macierz losowa: \n")


nArr = [5, 10, 20]
cArr = [1, 10, 10^3 , 10^7 , 10^12 , 10^16]

condss = []
errorGauss = []
errorInv = []

for n in nArr

	println("n = ", n, "\n")

	for c in cArr


		A = matcond(n, Float64(c))
		x = ones(n)
		b = A * x

		xe1 = inv(A) * b
		xe2 = A\b

		println("c = ", c, "  Błąd (odwrotność) = ", (norm(x - xe1)/norm(x)) * 100, "%   Błąd (eliminacja Gaussa) = ", (norm(x - xe2)/norm(x)) * 100, "%")

	end

	println("\n_______________________________________")

end
