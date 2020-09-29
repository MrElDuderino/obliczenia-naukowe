#Autor: Jakub Iwon (236612)

function f(x)
	return exp(x) * log(1 + exp(-x))
end


for x = 0:1000
	println("x = ", x, "  f(x) = ", f(x))
end

