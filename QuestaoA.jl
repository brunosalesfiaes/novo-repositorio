n = 9

p = zeros(Float64, n, n)

vizinhancas = Dict(
    1=> [2, 4],
    2=> [1, 3, 5],
    3=> [2, 6],
    4=> [1, 5, 7],
    5=> [2, 4, 6, 8],
    6=> [6], #absorvente
    7=> [4, 8],
    8=> [8], #absorvente
    9=> [6, 8],
)

for estado in 1:N 
    vizinhos = vizinhancas[estado]
    for v in vizinhos 
          P[estado, v] = 1.0 / length(vizinhos)

    end 
end  

println("matriz de transição de probabilidade:")
println(p)
    
      
