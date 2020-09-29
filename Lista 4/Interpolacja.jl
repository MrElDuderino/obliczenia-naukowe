#Autor: Jakub Iwon (236612)

module Interpolacja
export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx
using Plots

function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})

	if length(x) != length(f)
		println("Podane wektory są różnej długości.")
		return
	end

	n = length(x)
	fx = copy(f)

	for i = 2:n
		for j = n:-1:i
			fx[j] = (fx[j]-fx[j-1])/(x[j]-x[j-i+1])
		end
	end

    return fx
end


function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)

	if length(x) != length(fx)
		println("Podane wektory są różnej długości.")
		return
	end

	n = length(x)
	nt = fx[n]

	for i = n-1:-1:1
		nt = nt*(t-x[i]) + fx[i]
	end

	return nt
end

function naturalna(x::Vector{Float64}, fx::Vector{Float64})

	if length(x) != length(fx)
		println("Podane wektory są różnej długości.")
		return
	end

    n = length(fx)
    a = Vector{Float64}(undef, n)

    for i in n:-1:1
        a[i] = fx[i]
        for j in i:n-1
            a[j] = a[j]-a[j+1]*x[i]
        end
    end

    return a

end

function rysujNnfx(f, a::Float64, b::Float64, n::Int, i::Int)

	h = (b-a)/n
	x = Vector{Float64}(undef, n+1)
	y = Vector{Float64}(undef, n+1)
	yint = Vector{Float64}(undef, n+1)

	for i = 0:n
		x[i+1] = a + i*h
		y[i+1] = f(x[i+1])
	end

	fx = ilorazyRoznicowe(x, y)

	points = 30
	h = (b-a)/points
	xs = []
	ys = []

	for i = 0:points
		p = a+h*i
		push!(xs, p)
		push!(ys, warNewton(x, fx, p))
	end

	plot(f, a, b, label="f")
	plot!(xs, ys, label="inter")
	savefig("plot$i")

end

end