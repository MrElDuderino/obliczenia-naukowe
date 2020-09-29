#Autor: Jakub Iwon (236612)

module blocksys
export readMatrixFromFile, readRightSideFromFile, gaussianElimination, partialPivotingGaussianElimination, 
LUDecomposition, partialPivotingLUDecomposition, LUEquation, partialPivotingLUEquation, calculateRightSide, saveSolution
using SparseArrays
	

	function readMatrixFromFile(path)

		open(path) do io
			
			words = split(readline(io))
			n = parse(Int64, words[1])
			l = parse(Int64, words[2])
			vectorLength = l*(n-3) + 3*n

			is = Vector{Int64}(undef, vectorLength)
			js = Vector{Int64}(undef, vectorLength)
			as = Vector{Float64}(undef, vectorLength)
			i = 1

			for line in readlines(io)
				words = split(line)
				is[i] = parse(Int64, words[1])
				js[i] = parse(Int64, words[2])
				as[i] = parse(Float64, words[3])
				i+=1
			end

			A = sparse(is, js, as)
			return(A, n, l)


		end

	end

	function readRightSideFromFile(path)

		open(path) do io

			n = parse(Int64, readline(io))
			b = Vector{Float64}(undef, n)
			i = 1

			for line in readlines(io)
				b[i] = parse(Float64, line)
				i+=1
			end

			return b

		end		

	end

	function saveSolution(x, path, relativeError)

		open(path, "w") do io
			
			if relativeError != nothing
				println(io, relativeError)
			end

			for entry in x
				println(io, entry)
			end
		end

	end


	function gaussianElimination(A, b, n, l)

		for k = 1:n-1
			
			rowLimit = convert(Int64, l*(floor((k+1)/l) + 1))
			columnLimit = convert(Int64, k + l)

			if rowLimit > n
				rowLimit = n
			end

			if columnLimit > n
				columnLimit = n
			end
			
			for i = k+1:rowLimit
				
				if abs(A[k,k]) < eps(Float64)
					error("Dzielenie przez 0.")
				end
				
				ratio = A[i,k]/A[k,k]
				
				for j = k+1:columnLimit
					A[i,j] -= ratio*A[k,j]
				end

				b[i] -= ratio*b[k]
			
			end
		end

		x = Vector{Float64}(undef, n)

		for i = n:-1:1
			
			sum = 0.0
			columnLimit = i + l

			if columnLimit > n
				columnLimit = n
			end

			for j = i+1:columnLimit
				sum += A[i,j]*x[j]
			end

			x[i] = (b[i]-sum)/A[i,i]
		
		end

		return x

	end


	function partialPivotingGaussianElimination(A, b, n, l)
		
		positions = Vector(1:n)

		for k = 1:n-1

			rowLimit = convert(Int64, l *(floor((k+1)/l) + 1))
			columnLimit = convert(Int64, l * (floor((k+1)/l) + 2))
			
			if rowLimit > n
				rowLimit = n
			end

			if columnLimit > n
				columnLimit = n
			end

			for i = k+1:rowLimit
				
				pivotPosition = k
				maxEntry = abs(A[positions[k], k])
				
				for p = i:rowLimit
					value = abs(A[positions[p], k])
					if value > maxEntry
						pivotPosition = p
						maxEntry = value
					end
				end
				
				if abs(maxEntry) < eps(Float64)
					error("Dzielenie przez 0.")
				end

				positions[k], positions[pivotPosition] = positions[pivotPosition], positions[k]
				ratio = A[positions[i], k]/A[positions[k], k]
				
				for j = k+1:columnLimit
					A[positions[i], j] -= ratio*A[positions[k], j]
				end
				
				b[positions[i]] -= ratio*b[positions[k]]
			
			end
		end

		x = Vector{Float64}(undef, n)

		for i = n:-1:1
		
			sum = 0.0
			columnLimit = convert(Int64, l *(floor((positions[i]+1)/l) + 2))
			
			if columnLimit > n
				columnLimit = n
			end

			for j = i+1:columnLimit
				sum += A[positions[i], j] * x[j]
			
			end
			x[i] = (b[positions[i]]-sum)/A[positions[i], i]
		
		end
		return x

	end



	function LUDecomposition(A, n, l)
		
		for k = 1:n-1
			
			rowLimit = convert(Int64, l * (floor((k+1) / l) + 1))
			columnLimit = convert(Int64, k + l)
			
			if rowLimit > n
				rowLimit = n
			end

			if columnLimit > n
				columnLimit = n
			end

			for i = k+1:rowLimit
				
				if abs(A[k,k]) < eps(Float64)
					error("Dzielenie przez 0.")
				end

				ratio = A[i,k]/A[k,k]
				A[i,k] = ratio
				
				for j = k+1:columnLimit
					A[i,j] -= ratio*A[k,j]
				end
			end
		end

		return A

	end


	function partialPivotingLUDecomposition(A, n, l)

		positions = Vector(1:n)

		for k = 1:n-1

			rowLimit = convert(Int64, l * (floor((k+1) / l) + 1))
			columnLimit = convert(Int64, l * (floor((k+1)/l) + 2))

			if rowLimit > n
				rowLimit = n
			end

			if columnLimit > n
				columnLimit = n
			end

			for i = k+1:rowLimit

				pivotPosition = k
				maxEntry = abs(A[positions[k], k])

				for p = i:rowLimit
					value = abs(A[positions[p], k])
					if value > maxEntry
						pivotPosition = p;
						maxEntry = value
					end
				end

				if abs(maxEntry) < eps(Float64)
					error("Dzielenie przez 0.")
				end

				positions[k], positions[pivotPosition] = positions[pivotPosition], positions[k]
				ratio = A[positions[i], k]/A[positions[k], k]
				A[positions[i], k] = ratio
				
				for j = k+1:columnLimit
					A[positions[i], j] -= ratio * A[positions[k], j]
				end

			end
		end

		return A, positions
	end


	function LUEquation(A, b, n, l)
		
		A = LUDecomposition(A, n, l)
		z = Vector{Float64}(undef, n)
		
		for i = 1:n
			
			sum = 0.0
			columnStart = convert(Int64, l * floor((i-1)/l) - 1)
			
			if columnStart < 1
				columnStart = 1
			end

			for j = columnStart:i-1
				sum += A[i,j] * z[j]
			end

			z[i] = b[i] - sum
		
		end


		x = Vector{Float64}(undef, n)
		
		for i = n:-1:1
			
			sum = 0.0
			columnLimit = i + l
			
			if columnLimit > n
				columnLimit = n
			end


			for j = i+1:columnLimit
				sum += A[i,j] * x[j]
			end
			
			x[i] = (z[i]-sum)/A[i,i]
		
		end
		
		return x
	end


	function partialPivotingLUEquation(A, b, n, l)
		
		A, positions = partialPivotingLUDecomposition(A, n, l)
		z = Vector{Float64}(undef, n)
		
		for i = 1:n

			sum = 0.0
			columnStart = convert(Int64, l * floor((positions[i]-1)/l) - 1)
			
			if columnStart < 1
				columnStart = 1
			end

			for j = columnStart:i-1
				sum += A[positions[i], j] * z[j]
			end

			z[i] = b[positions[i]] - sum
		end

		x = Vector{Float64}(undef, n)

		for i = n:-1:1

			sum = 0.0
			columnLimit = convert(Int64, l * (floor((positions[i]+1)/l) + 2))
			
			if columnLimit > n
				columnLimit = n
			end

			for j = i+1:columnLimit
				sum += A[positions[i], j] * x[j]
			end
			
			x[i] = (z[i]-sum)/A[positions[i], i]
		
		end

		return x
	end


	function calculateRightSide(A, n, l)
		
		b = zeros(Float64, n)
		
		for i = 1:n

			columnStart = convert(Int64, l * floor((i-1)/l) - 1)
			columnLimit = convert(Int64, i + l)
		
			if columnStart < 1
				columnStart = 1
			end

			if columnLimit > n
				columnLimit = n
			end

			for j = columnStart:columnLimit
				b[i] += A[i,j]
			end

		end

		return b
	end

end
