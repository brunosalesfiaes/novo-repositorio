using LinearAlgebra

# Matriz de transição de probabilidade
P = [
    0.0  0.5  0.0  0.5  0.0  0.0  0.0  0.0  0.0;  # Estado 1
    0.25  0.0  0.25  0.0  0.25  0.0  0.0  0.0  0.0;  # Estado 2
    0.0  0.5  0.0  0.0  0.0  0.0  0.0  0.0  0.0;  # Estado 3
    0.25  0.0  0.0  0.0  0.25  0.0  0.25  0.0  0.0;  # Estado 4
    0.0  0.25  0.0  0.25  0.0  0.25  0.0  0.0  0.0;  # Estado 5
    0.0  0.0  0.0  0.0  0.0  1.0  0.0  0.0  0.0;  # Estado 6 (absorvente - comida)
    0.0  0.0  0.0  0.25  0.0  0.0  0.0  0.25  0.0;  # Estado 7
    0.0  0.0  0.0  0.0  0.0  0.0  0.0  1.0  0.0;  # Estado 8 (absorvente - choque)
    0.0  0.0  0.0  0.0  0.0  0.25  0.0  0.25  0.0   # Estado 9
]

# Separando a matriz Q (estados transientes) e R (absorventes)
Q = P[1:7, 1:7]  # Primeiros 7 estados são transientes
R = P[1:7, 8:9]  # Transições para os estados absorventes (8 e 9)

# Calculando a matriz fundamental N = (I - Q)^(-1)
I = Matrix{Float64}(I, size(Q,1), size(Q,2))
N = inv(I - Q)

# Calculando o número médio de passos até absorção
# É a soma das linhas da matriz fundamental
t = sum(N, dims=2)

# Número médio de passos a partir do estado inicial 1
estado_inicial = 1  # Começando no estado 1
println("Número médio de passos até absorção, começando no estado 1: ", t[estado_inicial])