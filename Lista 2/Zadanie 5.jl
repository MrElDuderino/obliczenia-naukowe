#Autor: Jakub Iwon (236612)


function main()
	
	p32::Float32 = 0.01
	r32::Float32 = 3.0

	println("Float32\n")

	println("Bez obcięcia:\n")

	for i = 1:40
		p32 = p32 + r32*p32*(Float32(1.0)-p32)
		println("p", i, " = ", p32)
	end

	p32 = 0.01

	println("\nZ obcięciem:\n")

	for i = 1:40
		p32 = p32 + r32*p32*(Float32(1.0)-p32)
		
		if i == 10
			p32 = Float32(truncate(p32, 3))
		end

		println("p", i, " = ", p32)
	end

	println("\nFloat64\n")

	p64 = Float64(0.01)
	r64 = Float64(3.0)

	println("Bez obcięcia:\n")

	for i = 1:40
		p64 = p64 + r64*p64*(Float64(1.0)-p64)
		println("p", i, " = ", p64)
	end



end


function truncate(x, n)
	return round((x - 5.0 * 10.0^-(n+1)), digits=n)
end




main()