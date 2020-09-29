#Autor: Jakub Iwon (236612)

using Polynomials



coefficients = [2432902008176640000.0, -8752948036761600000.0, 13803759753640704000.0, -12870931245150988800.0,
 8037811822645051776.0, -3599979517947607200.0,
1206647803780373360.0, -311333643161390640.0, 63030812099294896.0,
-10142299865511450.0, 1307535010540395.0, -135585182899530.0,
11310276995381.0, -756111184500.0, 40171771630.0, -1672280820.0,
53327946.0, -1256850.0, 20615.0, -210.0, 1]



println("Oryginalne współczynniki: \n")

P = Poly(coefficients)  
p = poly(collect(1.0:20.0))
foundRoots = roots(P)

k = 1

for z in foundRoots
	println("z = ", z, "  |P(z)| = ", abs(polyval(P, z)), "  |p(z)| = ", abs(polyval(p, z)), "  |zk - k| = ", abs(z - k))
	global k += 1
end


println("\n\nZaburzone współczynniki: \n")

coefficients[20] = coefficients[20] - 2^-23

P = Poly(coefficients)  
p = poly(collect(1:20))
foundRoots = roots(P)

k = 1

for z in foundRoots
	println("z = ", z, "  |P(z)| = ", abs(polyval(P, z)), "  |p(z)| = ", abs(polyval(p, z)), "  |zk - k| = ", abs(z - k))
	global k += 1
end
