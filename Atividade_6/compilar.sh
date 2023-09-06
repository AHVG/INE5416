
if [ $# -eq 0 ]; then
    echo "Nenhum arquivo Haskell fornecido."
    exit 1
fi

arquivo=$1

if [[ ! $arquivo =~ \.hs$ ]]; then
    echo "O arquivo fornecido não tem a extensão .hs."
    exit 1
fi

# Extrai o nome do arquivo sem a extensão
nome_sem_extensao=$(basename "$arquivo" .hs)

# Compila o arquivo Haskell usando o GHC
ghc -outputdir "exes" -o "exes/$nome_sem_extensao" "$arquivo"

# Verifica se a compilação foi bem-sucedida
if [ $? -eq 0 ]; then
    echo "Compilação concluída com sucesso. O executável é: $nome_sem_extensao"
else
    echo "Erro durante a compilação."
fi

rm -rf exes/Main.hi exes/Main.o