#Autor: Jakub Iwon (236612)

include("blocksys.jl")
include("matrixgen.jl")
using .blocksys
using .matrixgen
using LinearAlgebra



function interface()

	println("1. Wczytaj macierz A z pliku.")
	println("2. Generuj macierz A")
	choiceA = parse(Int32, input())
	if choiceA == 1
		println("Podaj nazwę pliku z macierzą.")
		pathA = input()
	elseif choiceA == 2
		println("Podaj rozmiar macierzy A.")
		n = parse(Int, input())
		println("Podaj wartość l.")
		l = parse(Int, input())
		if n % l != 0 || n < 4 || l < 2
			error("Niewłaściwe parametry.")
		end
		ck = 1.0
		println("Podaj nazwę pliku do zapisu.")
		pathA = input()
		pathA = String(pathA)
		blockmat(n, l, ck, pathA)
	end


	A, n, l = readMatrixFromFile(pathA)

	
	println("1. Wczytaj wektor b z pliku.")
	println("2. Oblicz wektor b.")
	choiceB = parse(Int32, input())
	pathB = ""
	b = zeros(Float64, n)


	if choiceB == 1
		println("Podaj nazwę pliku z wektorem b.")
		pathB = input()
		b = readRightSideFromFile(pathB)
	elseif choiceB ==2 
		b = calculateRightSide(A, n, l)
	end


	println("Rozwiąż równanie za pomocą: ")
	println("1. Eliminacji Gaussa.")
	println("2. Eliminacji Gaussa z wyborem.")
	println("3. Rozkładu LU.")
	println("4. Rozkładu LU z wyborem.")

	choice = parse(Int32, input())
	x = zeros(Float64, n)

	if choice == 1
		x = gaussianElimination(A, b, n, l)
	elseif choice == 2
		x = partialPivotingGaussianElimination(A, b, n, l)
	elseif choice == 3
		x = LUEquation(A, b, n, l)
	elseif choice ==4
		x = partialPivotingLUEquation(A, b, n, l)
	end

	relativeError = nothing

	if choiceB == 2
		xExact = ones(n)
		relativeError = norm(xExact - x)/norm(xExact)
	end

	println("Podaj nazwę pliku do zapisania rozwiązania.")
	pathX = input()
 	saveSolution(x, pathX, relativeError)

end


function input()

	print("> ")
	return chomp(readline())

end

interface()