#Autor: Jakub Iwon (236612)

function spacing()

	num :: Float64 = 1.0
	space :: Float64 = 2^-52

	i = 1

	while num <= 2 && i <= 150
		println(bitstring(num))
		num += space
		i+=1
	end

	println("\n\n")

	println("bitstring(prevfloat(2.0)): ", bitstring(prevfloat(2.0)))
	println("bitstring(2.0):            ", bitstring(2.0))

end

spacing()
