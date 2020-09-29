#Autor: Jakub Iwon (236612)

function findX()

	x :: Float64 = nextfloat(Float64(1.0))

	while x * (1/x) == 1 && x < 2.0
		x = nextfloat(x)
	end 
	
	return x

end

function findSmallestX()

	x :: Float64 = nextfloat(Float64(0.0))

	while x * (1/x) == 1
		x = nextfloat(x)
	end 

	return x

end


println("Znalezione x w przedziale (1, 2): ", findX())
println("Najmniejsze znalezione x:         ", findSmallestX())
