
type Nome = String
type Disciplina = String
type Nota = Float
type Aluno = (Nome, Disciplina, Nota, Nota, Nota)

turma1 :: Int -> Aluno
turma1 x | (x == 1) = ("Augusto", "Paradigmas", 10, 10, 10)
turma1 x | (x == 2) = ("Ninguem", "Redes", 1, 2, 3)
turma1 x | (x == 3) = ("O exemplar", "SO", 2, 3, 4)
turma1 x | (x == 4) = ("O nerd", "TC", 4, 5, 6)
turma1 x | otherwise = ("Ultimo", "", -1, -1, -1)

obterNomeAluno :: Aluno -> String
obterNomeAluno (nome,_,_,_,_) = nome

obterMediaAluno :: Aluno -> Float
obterMediaAluno (_,_,n1,n2,n3) = (n1+n2+n3)/3.0

obterNumeroDeAlunos :: (Int -> Aluno) -> Int -> Int
obterNumeroDeAlunos turma i | (obterNomeAluno (turma i) == "Ultimo") = i - 1
obterNumeroDeAlunos turma i | otherwise = obterNumeroDeAlunos (turma) (i + 1)

obterMediaTurma :: (Int -> Aluno) -> Int -> Float
obterMediaTurma turma i | (obterNomeAluno (turma i) == "Ultimo") = 0.0
obterMediaTurma turma i = obterMediaTurma (turma) (i+1) + (obterMediaAluno (turma i)) / fromIntegral (obterNumeroDeAlunos turma i) :: Float

main = do
    print (obterMediaTurma turma1 1)
