
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
animal(mini porco).


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

    %O navio Grego sai às 6 da manhã e carrega Café.
    member(navio(grego, 6, cafe, _, _), ListaSolucao),

    %O navio do meio tem a chaminé Preta.
    Chamine3 = preta,
    
    %O navio Inglês sai às 9 da manhã.
    member(navio(ingles, 9, _, _, _), ListaSolucao),
    
    %O navio Francês, que tem a chaminé Azul, está à esquerda do navio que carrega Café
    aEsquerda(navio(frances, _, _, azul, _), navio(_, _, cafe, _, _), ListaSolucao),
    
    %À direita do navio que carrega Cacau está o navio que vai para Macau.
    aEsquerda(navio(_, _, cacau, _, _), navio(_, _, _, _, macau), ListaSolucao),
    
    %O navio Brasileiro está indo para Manila.
    member(navio(brasileiro, _, _, _, manila), ListaSolucao),
    
    %O navio que carrega Arroz está ancorado ao lado do navio com chaminé Verde.
    aoLado(navio(_, _, arroz, _, _), navio(_, _, _, verde, _), ListaSolucao),
    
    %O navio que vai para Santos sai às 5 da manhã.
    member(navio(_, 5, _, _, santos), ListaSolucao),
    
    %O navio Espanhol sai às 7 da manhã e está à direita do navio que vai para Macau.
    aDireita(navio(espanhol, 7, _, _, _), navio(_, _, _, _, macau), ListaSolucao),
    
    %O navio com a chaminé Vermelha vai para Hamburgo.
    member(navio(_, _, _, vermelha, hamburgo), ListaSolucao),
    
    %O navio que sai às 7 da manhã está ao lado do navio que tem a chaminé Branca.
    aoLado(navio(_, 7, _, _, _), navio(_, _, _, branca, _), ListaSolucao),
    
    %O navio do canto carrega Milho.
    noCanto(navio(_, _, milho, _, _),ListaSolucao),
    
    %O navio com chaminé Preta sai às 8 da manhã
    member(navio(_, 8, _, preta, _), ListaSolucao),
    
    %O navio que que carrega Milho está ancorado ao lado do navio que carrega Arroz.
    aoLado(navio(_, _, milho, _, _), navio(_, _, arroz, _, _), ListaSolucao),
    
    %O navio que vai para Hamburgo sai às 6 da manhã.
    member(navio(_, 6, _, _, hamburgo), ListaSolucao),
    
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
    todosDiferentes([Animal1, Animal2, Animal3, Animal4, Animal5]).

    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]).
    
