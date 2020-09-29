#Autor: Jakub Iwon (236612)

function f(x)

	return sin(x) + cos(3*x)

end

function derivativeApprox(x, h)
	return (f(x + h) - f(x))/h 
end

function derivative(x)
	return cos(x) - 3*sin(3*x)
end


function main()


	for n = 0:54
		x = 1.0
		h = 2.0^-n
		println("n = ", n, "  f'(1.0) = ", derivative(x), "  f'~(1.0) = ", derivativeApprox(x, h), " 	Błąd bezwzględny = ", abs(derivative(x) - derivativeApprox(x, h)))
	end


end


main()