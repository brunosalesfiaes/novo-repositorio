# 🧀🐭 Labirinto Inteligente com Álgebra Linear em Julia

## 📌 Descrição do Projeto

Este projeto tem como objetivo utilizar **exclusivamente a linguagem Julia** e conceitos de **Álgebra Linear** para resolver automaticamente dois problemas matemáticos baseados em um **labirinto composto por 9 posições (3x3)**, no qual:

* Existe um **rato**, inicialmente posicionado em uma célula do labirinto;
* Existe um **queijo**, localizado em outra célula distinta;
* O rato deve encontrar o caminho até o queijo de forma automática, respeitando as conexões possíveis entre as posições.

A modelagem do problema é feita por meio de **matrizes**, **vetores**, **sistemas lineares** e **operações matriciais**, sem o uso de estruturas tradicionais de busca (como BFS ou DFS), reforçando o uso matemático da Álgebra Linear.

---

## 🎯 Objetivos

* Aplicar conceitos de Álgebra Linear na resolução de problemas computacionais;
* Utilizar a linguagem **Julia** como única ferramenta de desenvolvimento;
* Representar o labirinto através de matrizes de adjacência;
* Automatizar a identificação do caminho entre o rato e o queijo;
* Resolver **duas questões-problema** distintas propostas no contexto do labirinto.

---

## 🧠 Fundamentação Matemática

O labirinto é modelado como um **grafo**, onde:

* Cada posição do labirinto corresponde a um **nó**;
* As conexões possíveis entre posições são representadas por uma **matriz de adjacência**;
* O estado do rato é representado por um **vetor de estado inicial**;
* A movimentação do rato é simulada por **multiplicações matriciais sucessivas**;
* A chegada ao queijo é verificada quando o vetor de estado coincide com a posição do queijo.

Conceitos utilizados:

* Matrizes de adjacência
* Vetores coluna
* Potência de matrizes
* Sistemas lineares
* Álgebra Linear aplicada a grafos

---

## 🧩 Estrutura do Labirinto

O labirinto possui **9 posições**, organizadas da seguinte forma:

```
1 | 2 | 3
---------
4 | 5 | 6
---------
7 | 8 | 9
```

As conexões entre as posições podem variar conforme o problema proposto, permitindo a criação de diferentes cenários (questões).

---

## ❓ Questões-Problema

### 🔹 Questão 1

Determinar se o rato consegue alcançar o queijo a partir de uma posição inicial, considerando as conexões definidas no labirinto.

### 🔹 Questão 2

Calcular o número mínimo de iterações matriciais necessárias para que o vetor de estado do rato alcance a posição do queijo.

Ambas as questões são resolvidas automaticamente através de operações matemáticas.

---

## ⚙️ Tecnologias Utilizadas

* **Linguagem:** Julia
* **Paradigma:** Matemático / Computacional
* **Bibliotecas:**

  * `LinearAlgebra` (biblioteca padrão do Julia)

---

## 📁 Estrutura do Projeto

```
📦 labirinto-julia
 ┣ 📜 main.jl
 ┣ 📜 QuestaoTest.jl
 ┣ 📜 QuestaoA.jl
 ┣ 📜 QuestaoB.jl
 ┗ 📜 README.md
```

---

## ▶️ Como Executar o Projeto

1. Instale a linguagem Julia:
   👉 [https://julialang.org/downloads/](https://julialang.org/downloads/)

2. Clone este repositório:

```bash
git clone https://github.com/seu-usuario/labirinto-julia.git
```

3. Acesse o diretório do projeto:

```bash
cd labirinto-julia
```

4. Execute o programa principal:

```bash
julia main.jl
```

---

## ✅ Resultados Esperados

* Identificação automática da possibilidade de o rato alcançar o queijo;
* Demonstração clara da aplicação da Álgebra Linear;
* Saída no terminal indicando os passos ou iterações necessárias;
* Código simples, matematicamente fundamentado e eficiente.

---

## 📚 Aplicações Acadêmicas

Este projeto é indicado para disciplinas como:

* Álgebra Linear
* Matemática Computacional
* Métodos Numéricos
* Introdução à Computação Científica

---

## 👨‍🎓 Autor

**Bruno Sales**
Graduando em Ciência da Computação
Projeto desenvolvido para fins acadêmicos

---

## 📄 Licença

Este projeto é de uso acadêmico e educacional.
Sinta-se à vontade para estudar, adaptar e reutilizar o código.
