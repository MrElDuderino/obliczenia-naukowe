#Autor: Jakub Iwon (236612)

using Plots

function main()

	xArr = [1.0, 2.0, 1.99999999999999, 1, -1, 0.75, 0.25]
	cArr = [-2.0, -2.0, -2.0, -1.0, -1.0, -1.0, -1.0]

	for a = 1:length(xArr)
		
		println("\n-------- ", a, " --------\n")

		x = xArr[a] 
		c = cArr[a]

		xx = []
		yy = []


		f(x) = x^2 + c

		push!(xx, x)
		push!(yy, 0)

		for i = 1:40

			push!(xx, x)

			x = f(x)

			push!(yy, x)
			push!(xx, x)
			push!(yy, x)

			println("x", i, " = ", x)
		end

		graphicalIteration(f, xx, yy, a)

	end

end

function graphicalIteration(f, xx, yy, i)

	g(x) = x
	plot(xx, yy, leg=false)
	plot!(f, leg=false)
	plot!(g, leg=false)
	savefig("plot: $i")

end


main()