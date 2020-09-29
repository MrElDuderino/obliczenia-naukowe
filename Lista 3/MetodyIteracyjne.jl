#Autor: Jakub Iwon (236612)

module MetodyIteracyjne
export mbisekcji, mstycznych, msiecznych

function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)

	err = 0
	it = 0
	u = f(a)
	w = f(b)

	e = b-a

	if sign(u) == sign(w)
		err = 1
		return nothing, nothing, nothing, err
	end


	while true 

		it = it + 1
		e = e/2
		r = a + e
		v = f(r)
	
		if abs(e) < delta || abs(v) < epsilon
			return r, v, it, err
		end

		if sign(v) != sign(u)
			b = r
			w = v
		else
			a = r
			u = v
		end
	end
end


function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)

	err = 0
	v = f(x0)
	it = 0

	if abs(v) < epsilon
		return x0, v, 0, err;
	end

	x1 = 0.0

	for it=1:maxit
		
		if abs(pf(x0)) < epsilon
			err = 2
			return nothing, nothing, nothing, err
		end

		x1 = x0 - (v/pf(x0))
		v = f(x1)

		if abs(x1-x0)< delta || abs(v) < epsilon
			return x1, v, it, err
		end

		x0 = x1
	end

	err = 1
	return nothing, nothing, nothing, err

end


function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
	
	f0 = f(x0)
	f1 = f(x1)
	err = 0

	for it=1:maxit
		
		if abs(f0) > abs(f1)
			tmp0 = x0; x0 = x1; x1 = tmp0
			tmpF0 = f0; f0 = f1; f1 = tmpF0
		end

		s = (x1-x0)/(f1-f0)
		x1 = x0
		f1 = f0
		x0 = x0 - f0*s
		f0 = f(x0)

		if abs(x1-x0) < delta || abs(f0) < epsilon
			return x0, f0, it, err
		end
	end

	err = 1
	return nothing, nothing, nothing, err

end

end