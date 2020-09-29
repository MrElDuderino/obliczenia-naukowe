#Autor: Jakub Iwon (236612)


function main()

	x64 = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
	y64 = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

	xe64 = [2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]

	x32 = []
	y32 = []
	xe32 = []

	exactValue = -0.0000000000100657107000000

	sum64 :: Float64 = 0.0
	sum32 :: Float32 = 0.0


	println("\nFloat64:\n")
	println("_________________________________________________________________________\n")
	println("Algorytm A:\n");
	println("Oryginalne dane: ")
	algorithmA(sum64, x64, y64, exactValue)
	println("Zaburzone dane: ")
	algorithmA(sum64, xe64, y64, exactValue)
	println("_________________________________________________________________________\n")
	println("Algorytm B:\n");
	println("Oryginalne dane: ")
	algorithmB(sum64, x64, y64, exactValue)
	println("Zaburzone dane: ")
	algorithmB(sum64, xe64, y64, exactValue)
	println("_________________________________________________________________________\n")
	println("Algorytm C:\n");
	println("Oryginalne dane: ")
	algorithmC(sum64, x64, y64, exactValue)
	println("Zaburzone dane: ")
	algorithmC(sum64, xe64, y64, exactValue)
	println("_________________________________________________________________________\n")
	println("Algorytm D:\n");
	println("Oryginalne dane: ")
	algorithmD(sum64, x64, y64, exactValue)
	println("Zaburzone dane: ")
	algorithmD(sum64, xe64, y64, exactValue)
	println("_________________________________________________________________________\n")



	for i = 1:length(x64)
		push!(x32, Float32(x64[i]))
	end

	for i = 1:length(xe64)
		push!(xe32, Float32(xe64[i]))
	end

	for i = 1:length(y64)
		push!(y32, Float32(y64[i]))
	end


	println("\nFloat32:\n")
	println("_________________________________________________________________________\n")
	println("Algorytm A:\n");
	println("Oryginalne dane: ")
	algorithmA(sum32, x32, y32, exactValue)
	println("Zaburzone dane: ")
	algorithmA(sum32, xe32, y32, exactValue)
	println("_________________________________________________________________________\n")
	println("Algorytm B:\n");
	println("Oryginalne dane: ")
	algorithmB(sum32, x32, y32, exactValue)
	println("Zaburzone dane: ")
	algorithmB(sum32, xe32, y32, exactValue)
	println("_________________________________________________________________________\n")
	println("Algorytm C:\n");
	println("Oryginalne dane: ")
	algorithmC(sum32, x32, y32, exactValue)
	println("Zaburzone dane: ")
	algorithmC(sum32, xe32, y32, exactValue)
	println("_________________________________________________________________________\n")
	println("Algorytm D:\n");
	println("Oryginalne dane: ")
	algorithmD(sum32, x32, y32, exactValue)
	println("Zaburzone dane: ")
	algorithmD(sum32, xe32, y32, exactValue)
	println("_________________________________________________________________________\n")


end



function algorithmA(sum, x, y, exactValue)

	if length(x) != length(y)
		return 0
	end
	
	for i = 1:length(x)
		# println(x[i], " * ", y[i], " = ", x[i] * y[i])
		# println(sum, " + ", x[i] * y[i], " = ", sum + x[i] * y[i], "\n")
		sum += x[i] * y[i]
	end	

	println("Wynik: ", sum, "   Błąd względny: ", relativeError(sum, exactValue),"%")
	return sum
end


function algorithmB(sum, x, y, exactValue)

	if length(x) != length(y)
		return 0
	end

	for i = length(x):-1:1
		# println(x[i], " * ", y[i], " = ", x[i] * y[i])
		# println(sum, " + ", x[i] * y[i], " = ", sum + x[i] * y[i], "\n")
		sum += x[i] * y[i]
	end	

	println("Wynik: ", sum, "   Błąd względny: ", relativeError(sum, exactValue),"%")
	return sum
end


function algorithmC(sum, x, y, exactValue)

	if length(x) != length(y)
		return 0
	end

	positive = []
	negative = []

	sum1 = sum
	sum2 = sum
	n = 5


	for i = 1:length(x)

		a = x[i]*y[i]
		# println(x[i], " * ", y[i], " = ", x[i] * y[i])

		if a < 0
			push!(negative, a)
		else
			push!(positive, a)
		end

	end
	
	sort!(positive, rev=true)
	sort!(negative)
		

	# println("\n")
	for i in positive
		# println(sum1, " + ", i, " = ", sum1 + i)
		sum1 += i
	end


	# println("\n")
	for i in negative
		# println(sum2, " + ", i, " = ", sum2 + i)
		sum2 += i
	end


	# println("\n", sum1, " + ", sum2, " = ", sum1 + sum2, "\n")
	println("Wynik: ", sum1 + sum2, "   Błąd względny: ", relativeError(sum1 + sum2, exactValue),"%")
	return sum1 + sum2

end


function algorithmD(sum, x, y, exactValue)

	if length(x) != length(y)
		return 0
	end

	positive = []
	negative = []

	sum1 = sum
	sum2 = sum
	n = 5


	for i = 1:length(x)
		
		a = x[i]*y[i]
		# println(x[i], " * ", y[i], " = ", x[i] * y[i])
		
		if a < 0
			push!(negative, a)
		else
			push!(positive, a)
		end

	end
	
	sort!(positive)
	sort!(negative, rev=true)


	# println("\n")
	for i in positive
		# println(sum1, " + ", i, " = ", sum1 + i)
		sum1 += i
	end


	# println("\n")
	for i in negative
		# println(sum2, " + ", i, " = ", sum2 + i)
		sum2 += i
	end


	# println("\n", sum1, " + ", sum2, " = ", sum1 + sum2, "\n")
	println("Wynik: ", sum1 + sum2, "   Błąd względny: ", relativeError(sum1 + sum2, exactValue),"%")
	return sum1 + sum2

end


function relativeError(value, exactValue)
	return abs(abs(value-exactValue)/exactValue) * 100
end



main()

