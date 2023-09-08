

type Nome = String
type Disciplina = String
type Nota = Int
type Aluno = (Nome, Disciplina, Nota, Nota, Nota)

obterAluno :: Int -> Aluno
obterAluno x | (x == 1) = ("Augusto", "Paradigmas", 10, 10, 10)
obterAluno x | (x == 2) = ("Ninguem", "Redes", 1, 2, 3)
obterAluno x | (x == 3) = ("O exemplar", "SO", 2, 3, 4)
obterAluno x | (x == 4) = ("O nerd", "TC", 4, 5, 6)
obterAluno x | otherwise = ("O bagunceiro", "Grafos", 10, 10, 10)

obterNomeAluno :: Aluno -> String
obterNomeAluno (nome,_,_,_,_) = nome

main = do
    print (obterNomeAluno (obterAluno 1))
