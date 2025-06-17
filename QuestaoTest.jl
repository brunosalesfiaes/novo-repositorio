using LinearAlgebra

"""
Classifica os estados da cadeia.
Retorna tuplas (transitorios, absorventes)
"""
function classificar_estados(P)
    n = size(P, 1)
    absorventes = [i for i in 1:n if P[i,i] == 1.0 && sum(P[i,:]) == 1.0]
    transitorios = setdiff(1:n, absorventes)
    return transitorios, absorventes
end

"""
Extrai submatrizes Q e R a partir de P, estados transitorios e absorventes.
Q: transição entre transitorios
R: transição de transitorios para absorventes
"""
function extrair_Q_R(P, trans, absorv)
    Q = P[trans, trans]
    R = P[trans, absorv]
    return Q, R
end

"""
Resolve a cadeia de Markov:
- Matriz fundamental N
- Vetor de passos médios até absorção
- Matriz de visitas esperadas
- Probabilidades de absorção
"""
function resolver_markov(P)
    trans, absorv = classificar_estados(P)
    Q, R = extrair_Q_R(P, trans, absorv)

    I = I(size(Q,1))
    N = inv(I - Q)
    t = N * ones(size(N,1))
    B = N * R

    return Dict(
        :transitorios => trans,
        :absorventes => absorv,
        :N => N,
        :passos_medio => t,
        :visitas_medio => N,
        :prob_absorcao => B
    )
end

# Exemplo de uso:
P = [
    0.5 0.5 0.0 0.0;
    0.2 0.3 0.5 0.0;
    0.0 0.0 1.0 0.0;
    0.0 0.0 0.0 1.0
]

resultado = resolver_markov(P)

println("Estados transitorios: ", resultado[:transitorios])
println("Estados absorventes: ", resultado[:absorventes])
println("Matriz fundamental N:\n", resultado[:N])
println("Passos médios até absorção:\n", resultado[:passos_medio])
println("Matriz de visitas esperadas:\n", resultado[:visitas_medio])
println("Probabilidades de absorção:\n", resultado[:prob_absorcao])
