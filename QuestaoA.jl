using LinearAlgebra
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
P = p
# Função para classificar estados absorventes e transientes 
function classificar_estados(P)
    n = size(P, 1)
    absorventes = [i for i in 1:n if P[i,i] == 1.0 && sum(P[i,:]) == 1.0]
    transitorios = setdiff(1:n, absorventes)
    return transitorios, absorventes
end
# Extrai submatrizes Q e R a partir de P, estados transitorios e absorventes.
function extrair_Q_R(P, transitorios, absorventes)
    Q = P[transitorios, transitorios]
    R = P[transitorios, absorventes]
    return Q, R
end 
# Resolve a cadeia de Markov:
function resolver_markov(P)
    transitorios, absorventes = classificar_estados(P)
    Q, R = extrair_Q_R(P, transitorios, absorventes)

    I = Matrix{Float64}(I, size(Q,1), size(Q,2))
    N = inv(I - Q)
    t = N * ones(size(N,1))
    B = N * R

    return Dict(
        :transitorios => transitorios,
        :absorventes => absorventes,
        :N => N,
        :passos_medio => t,
        :visitas_medio => N,
        :prob_absorcao => B
    )   
end
# Exemplo de uso:   
resultado = resolver_markov(P)
println("Estados transitorios: ", resultado[:transitorios])
println("Estados absorventes: ", resultado[:absorventes])
println("Matriz fundamental N:\n", resultado[:N])   
println("Passos médios até absorção:\n", resultado[:passos_medio])
println("Matriz de visitas esperadas:\n", resultado[:visitas_medio])
println("Probabilidades de absorção:\n", resultado[:prob_absorcao])
# Número médio de passos até absorção a partir do estado inicial 1
estado_inicial = 1  # Começando no estado 1
println("Número médio de passos até absorção, começando no estado 1: ", resultado[:passos_medio][estado_inicial])
# Número médio de passos até absorção a partir do estado inicial 2
estado_inicial = 2  # Começando no estado 2 
println("Número médio de passos até absorção, começando no estado 2: ", resultado[:passos_medio][estado_inicial])
# Número médio de passos até absorção a partir do estado inicial 3
estado_inicial = 3  # Começando no estado 3 
println("Número médio de passos até absorção, começando no estado 3: ", resultado[:passos_medio][estado_inicial])
# Número médio de passos até absorção a partir do estado inicial 4
estado_inicial = 4  # Começando no estado 4
println("Número médio de passos até absorção, começando no estado 4: ", resultado[:passos_medio][estado_inicial])
# Número médio de passos até absorção a partir do estado inicial 5
estado_inicial = 5  # Começando no estado 5
println("Número médio de passos até absorção, começando no estado 5: ", resultado[:passos_medio][estado_inicial])
# Número médio de passos até absorção a partir do estado inicial 6
estado_inicial = 6  # Começando no estado 6 (absorvente)
println("Número médio de passos até absorção, começando no estado 6: ", resultado[:passos_medio][estado_inicial])
# Número médio de passos até absorção a partir do estado inicial 7
estado_inicial = 7  # Começando no estado 7
println("Número médio de passos até absorção, começando no estado 7: ", resultado[:passos_medio][estado_inicial])
# Número médio de passos até absorção a partir do estado inicial 8
estado_inicial = 8  # Começando no estado 8 (absorvente)
println("Número médio de passos até absorção, começando no estado 8: ", resultado[:passos_medio][estado_inicial])
# Número médio de passos até absorção a partir do estado inicial 9
estado_inicial = 9  # Começando no estado 9
println("Número médio de passos até absorção, começando no estado 9: ", resultado[:passos_medio][estado_inicial])
# Número médio de passos até absorção a partir do estado inicial 1
# Número médio de passos até absorção a partir do estado inicial 2  
# Número médio de passos até absorção a partir do estado inicial 3
# Número médio de passos até absorção a partir do estado inicial 4
# Número médio de passos até absorção a partir do estado inicial 5
# Número médio de passos até absorção a partir do estado inicial 6
# Número médio de passos até absorção a partir do estado inicial 7
# Número médio de passos até absorção a partir do estado inicial 8
# Número médio de passos até absorção a partir do estado inicial 9
 