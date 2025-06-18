using Test
include("QuestaoA.jl")

@testset "Testes da QuestaoA.jl" begin
    # Testa se a matriz de transição P é estocástica (linhas somam 1)
    @test all(abs.(sum(P, dims=2) .- 1.0) .< 1e-8)

    # Testa se os estados absorventes são identificados corretamente
    trans, abs = classificar_estados(P)
    @test sort(abs) == [6, 8]

    # Testa se os estados transientes são identificados corretamente
    @test sort(trans) == [1,2,3,4,5,7,9]

    # Testa se a matriz fundamental N tem as dimensões corretas
    resultado = resolver_markov(P)
    Nmat = resultado[:N]
    @test size(Nmat, 1) == length(resultado[:transitorios])
    @test size(Nmat, 2) == length(resultado[:transitorios])

    # Testa se as probabilidades de absorção somam 1 para cada estado transiente
    B = resultado[:prob_absorcao]
    @test all(abs.(sum(B, dims=2) .- 1.0) .< 1e-8)

    # Testa se os estados absorventes têm tempo médio de absorção zero
    for i in resultado[:absorventes]
        @test resultado[:passos_medio][i] ≈ 0.0
    end

    # Testa se os estados transientes têm tempo médio de absorção positivo
    for i in resultado[:transitorios]
        @test resultado[:passos_medio][i] > 0.0
    end

    # Testa se a matriz P está correta para alguns casos específicos
    # Estado 6 e 8 são absorventes
    @test P[6,6] == 1.0 && all(P[6, setdiff(1:9, [6])] .== 0.0)
    @test P[8,8] == 1.0 && all(P[8, setdiff(1:9, [8])] .== 0.0)

    # Testa se as probabilidades de transição do estado 1 estão corretas
    @test P[1,2] ≈ 0.5 && P[1,4] ≈ 0.5 && sum(P[1,:]) ≈ 1.0

    # Testa se a função extrair_Q_R retorna matrizes com as dimensões esperadas
    Q, R = extrair_Q_R(P, trans, abs)
    @test size(Q) == (length(trans), length(trans))
    @test size(R) == (length(trans), length(abs))
end