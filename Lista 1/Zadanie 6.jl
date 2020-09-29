#Autor: Jakub Iwon (236612)

function f(x)

	return sqrt(x^2) - 1

end

function g(x)

	return x^2/(sqrt(x^2 + 1) + 1)

end


function main()

	for i = -1:-1:-45

		x = 8.0^i
		println("x = ", x, "		f(x) = ", f(x), "		g(x) = ", g(x))

	end 

end

main()
