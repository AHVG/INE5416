
type Nome = String
type Disciplina = String
type Nota = Int
type Aluno = (Nome, Disciplina, Nota, Nota, Nota)

qualquerAluno :: Aluno
qualquerAluno = ("nao sei", "alguma", 12, 12, 12)

main = do
    print (qualquerAluno)
