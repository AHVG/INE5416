
camiseta(amarela).
camiseta(azul).
camiseta(branca).
camiseta(verde).
camiseta(vermelha).

dono(bruno).
dono(caio).
dono(raphael).
dono(sidney).
dono(victor).

profissao(analista).
profissao(designer).
profissao(joalheiro).
profissao(policial).
profissao(sociologo).

companhia(amigo).
companhia(esposa).
companhia(filho).
companhia(irma).
companhia(mae).

animal(cachorro).
animal(furao).
animal(gato).
animal(iguana).
animal(mini_porco).

idade(1).
idade(2).
idade(3).
idade(4).
idade(5).

%X está à ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).
                       
%X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X), 
                        nth0(IndexY,Lista,Y), 
                        IndexX < IndexY.
                        
%X está à direita de Y (em qualquer posição à direita)
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista). 

%X está no canto se ele é o primeiro ou o último da lista
noCanto(X,Lista) :- last(Lista,X).
noCanto(X,[X|_]).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao(ListaSolucao) :- 
    ListaSolucao = [
        homem(Camiseta1, Dono1, Profissao1, Companhia1, Animal1, Idade1),
        homem(Camiseta2, Dono2, Profissao2, Companhia2, Animal2, Idade2),
        homem(Camiseta3, Dono3, Profissao3, Companhia3, Animal3, Idade3),
        homem(Camiseta4, Dono4, Profissao4, Companhia4, Animal4, Idade4),
        homem(Camiseta5, Dono5, Profissao5, Companhia5, Animal5, Idade5)
    ],

    %O animal de 2 anos está na primeira posição
    Idade1 = 2,

    %O dono que está acompanhado da Irmã está ao lado do dono da camiseta Vermelha
    aoLado(homem(_, _, _, irma, _, _), homem(vermelha, _, _, _, _, _), ListaSolucao),

    %O Policial está em algum lugar à direita do rapaz de Azul
    aDireita(homem(_, _, policial, _, _, _), homem(azul, _, _, _, _, _), ListaSolucao),

    %Quem está com um Amigo está ao lado de quem está com a Irmã
    aoLado(homem(_, _, _, amigo, _, _), homem(_, _, _, irma, _, _), ListaSolucao),

    %Victor está ao lado do rapaz que está acompanhado da Mãe
    aoLado(homem(victor, _, _, _, _, _), homem(_, _, _, mae, _, _), ListaSolucao),

    %Sidney está em uma das pontas
    noCanto(homem(sidney, _, _, _, _, _), ListaSolucao),

    %O Mini porco está exatamente à direita do animal mais velho
    aDireita(homem(_, _, _, _, mini_porco, _), homem(_, _, _, _, _, 5), ListaSolucao),
    aoLado(homem(_, _, _, _, mini_porco, _), homem(_, _, _, _, _, 5), ListaSolucao),

    %O dono de camiseta Azul é Joalheiro
    member(homem(azul, _, joalheiro, _, _, _), ListaSolucao),

    %O Sociólogo está ao lado do dono que tem o animal mais novo
    aoLado(homem(_, _, sociologo, _, _, _), homem(_, _, _, _, 1, _), ListaSolucao),

    %Raphael está na quinta posição
    Dono5 = raphael,

    %O Cachorro tem 4 anos
    member(homem(_, _, _, _, cachorro, 4), ListaSolucao),

    %Em uma das pontas está o homem que está acompanhado do Filho
    noCanto(navio(_, _, _, filho, _, _), ListaSolucao),

    %O Sociólogo está ao lado de quem está acompanhado do Filho
    aoLado(homem(_, _, sociologo, _, _, _), homem(_, _, _, filho, _, _), ListaSolucao),

    %Caio tem um Gato
    member(homem(_, caio, _, _, gato, _), ListaSolucao),

    %O rapaz de Azul está em algum lugar à esquerda do dono do animal de 5 anos
    aEsquerda(homem(azul, _, _, _, _, _), homem(_, _, _, _, _, 5), ListaSolucao),

    %O rapaz da camiseta Amarela está ao lado de quem está acompanhado da Mãe
    aoLado(homem(amarela, _, _, _, _, _), homem(_, _, _, mae, _, _), ListaSolucao),

    %O animal de 4 anos está na terceira posição
    Idade3 = 4,

    %A Iguana tem 3 anos
    member(homem(_, _, _, _, iguana, 3), ListaSolucao),

    %O homem de Branco está exatamente à esquerda de Victor
    aEsquerda(homem(branco, _, _, _, _, _), homem(_, victor, _, _, _, 5), ListaSolucao),
    aoLado(homem(branco, _, _, _, _, _), homem(_, victor, _, _, _, 5), ListaSolucao),

    %Na terceira posição está o dono que está acompanhado da Irmã
    Companhia3 = irma,

    %O Designer tem uma Iguana
    member(homem(_, _, designer, _, iguana, _), ListaSolucao),

    %O Joalheiro e o Sociólogo estão lado a lado
    aoLado(homem(_, _, joalheiro, _, _, _), homem(_, _, sociologo, _, _, _), ListaSolucao),

    %O rapaz que está acompanhado da Mãe é dono do animal de 5 anos
    member(homem(_, _, _, mae, _, 5), ListaSolucao),
    
    %Testa todas as possibilidades...
    camiseta(Camiseta1), camiseta(Camiseta2), camiseta(Camiseta3), camiseta(Camiseta4), camiseta(Camiseta5),
    todosDiferentes([Camiseta1, Camiseta2, Camiseta3, Camiseta4, Camiseta5]),
    
    dono(Dono1), dono(Dono2), dono(Dono3), dono(Dono4), dono(Dono5),
    todosDiferentes([Dono1, Dono2, Dono3, Dono4, Dono5]),
    
    profissao(Profissao1), profissao(Profissao2), profissao(Profissao3), profissao(Profissao4), profissao(Profissao5),
    todosDiferentes([Profissao1, Profissao2, Profissao3, Profissao4, Profissao5]),
    
    companhia(Companhia1), companhia(Companhia2), companhia(Companhia3), companhia(Companhia4), companhia(Companhia5),
    todosDiferentes([Companhia1, Companhia2, Companhia3, Companhia4, Companhia5]),
    
    animal(Animal1), animal(Animal2), animal(Animal3), animal(Animal4), animal(Animal5),
    todosDiferentes([Animal1, Animal2, Animal3, Animal4, Animal5]),

    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]).


?- solucao(L), write(L).
