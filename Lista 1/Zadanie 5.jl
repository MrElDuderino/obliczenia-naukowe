#Autor: Jakub Iwon (236612)


function main()

	x = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
	y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
	sum :: Float64 = 0.0


	println("\nFloat64:\n")
	println("_________________________________________________________________________\n")
	println("Algorytm A:\n"); algorithmA(sum, x, y)
	println("_________________________________________________________________________\n")
	println("Algorytm B:\n"); algorithmB(sum, x, y)
	println("_________________________________________________________________________\n")
	println("Algorytm C:\n"); algorithmC(sum, x, y)
	println("_________________________________________________________________________\n")
	println("Algorytm D:\n"); algorithmD(sum, x, y)
	println("_________________________________________________________________________\n")


	for i = 1:length(x)
		x[i] = Float32(x[i])
	end

	for i = 1:length(y)
		y[i] = Float32(y[i])
	end

	sum = Float32(sum)

	println("\nFloat32:\n")
	println("_________________________________________________________________________\n")
	println("Algorytm A:\n"); algorithmA(sum, x, y)
	println("_________________________________________________________________________\n")
	println("Algorytm B:\n"); algorithmB(sum, x, y)
	println("_________________________________________________________________________\n")
	println("Algorytm C:\n"); algorithmC(sum, x, y)
	println("_________________________________________________________________________\n")
	println("Algorytm D:\n"); algorithmD(sum, x, y)
	println("_________________________________________________________________________\n")

end


function algorithmA(sum, x, y)

	if length(x) != length(y)
		return 0
	end
	
	for i = 1:length(x)
		println(x[i], " * ", y[i], " = ", x[i] * y[i])
		println(sum, " + ", x[i] * y[i], " = ", sum + x[i] * y[i], "\n")
		sum += x[i] * y[i]
	end	

	return sum
end


function algorithmB(sum, x,y)

	if length(x) != length(y)
		return 0
	end

	for i = length(x):-1:1
		println(x[i], " * ", y[i], " = ", x[i] * y[i])
		println(sum, " + ", x[i] * y[i], " = ", sum + x[i] * y[i], "\n")
		sum += x[i] * y[i]
	end	

	return sum
end


function algorithmC(sum, x, y)

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
		println(x[i], " * ", y[i], " = ", x[i] * y[i])

		if a < 0
			push!(negative, a)
		else
			push!(positive, a)
		end

	end
	
	sort!(positive, rev=true)
	sort!(negative)
		

	println("\n")
	for i in positive
		println(sum1, " + ", i, " = ", sum1 + i)
		sum1 += i
	end


	println("\n")
	for i in negative
		println(sum2, " + ", i, " = ", sum2 + i)
		sum2 += i
	end


	println("\n", sum1, " + ", sum2, " = ", sum1 + sum2, "\n")
	return sum1 + sum2

end


function algorithmD(sum, x, y)

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
		println(x[i], " * ", y[i], " = ", x[i] * y[i])
		
		if a < 0
			push!(negative, a)
		else
			push!(positive, a)
		end

	end
	
	sort!(positive)
	sort!(negative, rev=true)


	println("\n")
	for i in positive
		println(sum1, " + ", i, " = ", sum1 + i)
		sum1 += i
	end


	println("\n")
	for i in negative
		println(sum2, " + ", i, " = ", sum2 + i)
		sum2 += i
	end


	println("\n", sum1, " + ", sum2, " = ", sum1 + sum2, "\n")
	return sum1 + sum2

end



main()

