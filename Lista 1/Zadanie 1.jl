#Autor: Jakub Iwon (236612)

using Statistics


function machineEpsilon(i, b)

	a = i
	
	while a + i >  a
	    i = i/b

	end

	return i * b
end


function minimum(a, b)

	while a/b > 0
		a = a/b
	end

	return a
end

function maximum(a, b)

	while !isinf(a*b)
		a = a*b
	end

	return a
end

function main()
	
	#Wartości początkowe i mnożniki poszczególnych typów, przekazywane do funkcji

	i64::Float64 = 1.0
	b64::Float64 = 2.0

	i32::Float32 = 1.0
	b32::Float32 = 2.0

	i16::Float16 = 1.0
	b16::Float16 = 2.0


	println("Obliczony epsilon maszynowy Float64:   ", machineEpsilon(i64, b64))
	println("Eps(Float64):                          ", eps(Float64))
	println("Obliczony epsilon maszynowy Float32:   ", machineEpsilon(i32, b32))
	println("Eps(Float32):                          ", eps(Float32))
	println("Obliczony epsilon maszynowy Float16:   ", machineEpsilon(i16, b16))
	println("Eps(Float16):                          ", eps(Float16))

	println("\n")

	println("eta64:                   ", minimum(i64, b64))
	println("nextfloat(Float64(0.0)): ", nextfloat(Float64(0.0)))
	println("eta32:                   ", minimum(i32, b32))
	println("nextfloat(Float32(0.0)): ", nextfloat(Float32(0.0)))
	println("eta16:                   ", minimum(i16, b16))
	println("nextfloat(Float16(0.0)): ", nextfloat(Float16(0.0)))

	println("\n")

	println("bitstring(floatmin(Float64)): ", bitstring(floatmin(Float64)))
	println("bitstring(floatmin(Float32)): ", bitstring(floatmin(Float32)))


	println("\n")

	println("Obliczona maksymalna wartość Float64: ", maximum(prevfloat(i64), b64))
	println("floatmax(Float64):                    ", floatmax(Float64))
	println("Obliczona maksymalna wartość Float32: ", maximum(prevfloat(i32), b32))
	println("floatmax(Float32):                    ", floatmax(Float32))
	println("Obliczona maksymalna wartość Float16: ", maximum(prevfloat(i16), b16))
	println("floatmax(Float16):                    ", floatmax(Float16))


end

main()