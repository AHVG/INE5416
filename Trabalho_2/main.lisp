
;; (defvar comparacao (list (list -1 1 1 -1) (list -1 0 0 0) (list -1 -1 0 1) (list -1 1 1 -1) (list -1 0 0 0) (list -1 -1 0 1) (list -1 0 0 -1) (list -1 0 1 1) (list -1 -1 1 1) (list 0 1 1 -1) (list 1 0 1 0) (list 1 -1 0 1) (list 0 0 0 -1) (list 1 1 1 1) (list 1 -1 1 0) (list 1 1 0 -1) (list 0 1 0 0) (list 0 -1 0 0) (list 0 1 -1 -1) (list 0 0 -1 0) (list 1 -1 -1 1) (list 1 1 -1 -1) (list 0 1 -1 0) (list 0 -1 -1 0) (list 1 0 -1 -1) (list 1 1 -1 1) (list 1 -1 -1 0) (list -1 0 1 -1) (list -1 1 0 1) (list -1 -1 0 0) (list -1 1 1 -1) (list -1 1 0 0) (list -1 -1 0 0) (list -1 0 0 -1) (list -1 1 1 1) (list -1 -1 0 0) (list 0 0 0 -1) (list 1 1 1 1) (list 1 -1 1 0) (list 0 0 0 -1) (list 1 1 1 1) (list 1 -1 0 0) (list 1 1 0 -1) (list 0 0 0 0) (list 1 -1 1 1) (list 1 0 -1 -1) (list 0 1 -1 1) (list 0 -1 -1 0) (list 1 0 -1 -1) (list 0 1 -1 1) (list 1 -1 -1 0) (list 1 1 -1 -1) (list 1 1 -1 0) (list 0 -1 -1 0) (list -1 1 0 -1) (list -1 1 0 0) (list -1 -1 0 0) (list -1 0 0 -1) (list -1 0 1 1) (list -1 -1 1 1) (list -1 1 1 -1) (list -1 0 0 0) (list -1 -1 0 1) (list 1 1 1 -1) (list 1 0 1 0) (list 1 -1 1 1) (list 1 1 0 -1) (list 0 0 0 0) (list 0 -1 0 1) (list 0 0 0 -1) (list 1 0 0 1) (list 1 -1 0 1) (list 0 0 -1 -1) (list 0 1 -1 1) (list 0 -1 -1 0) (list 1 1 -1 -1) (list 1 1 -1 0) (list 1 -1 -1 0) (list 1 0 -1 -1) (list 1 0 -1 1) (list 1 -1 -1 1)))
(defvar comparacao
  (list
   (list -1 1 1 -1) (list -1 1 0 0) (list -1 -1 0 0) (list -1 0 1 -1)
   (list -1 1 1 1) (list -1 -1 1 0) (list -1 0 0 -1) (list -1 1 1 1)
   (list -1 -1 0 0) (list 0 0 0 -1) (list 1 0 1 1) (list 1 -1 1 1)
   (list 0 0 0 -1) (list 0 1 0 1) (list 0 -1 0 0) (list 1 1 1 -1)
   (list 0 0 1 0) (list 1 -1 1 1) (list 1 1 -1 -1) (list 0 1 -1 0)
   (list 0 -1 -1 0) (list 1 1 -1 -1) (list 1 0 -1 0) (list 1 -1 -1 1)
   (list 0 1 -1 -1) (list 0 0 -1 0) (list 0 -1 -1 1) (list -1 0 0 -1)
   (list -1 0 0 1) (list -1 -1 0 1) (list -1 1 1 -1) (list -1 0 1 0)
   (list -1 -1 1 1) (list -1 1 1 -1) (list -1 1 0 0) (list -1 -1 1 0)
   (list 1 0 1 -1) (list 1 0 1 1) (list 1 -1 1 1) (list 0 0 1 -1)
   (list 0 0 1 1) (list 0 -1 1 1) (list 0 0 0 -1) (list 1 1 0 1)
   (list 0 -1 0 0) (list 0 0 -1 -1) (list 0 1 -1 1) (list 0 -1 -1 0)
   (list 0 0 -1 -1) (list 0 0 -1 1) (list 0 -1 -1 1) (list 1 0 -1 -1)
   (list 1 1 -1 1) (list 1 -1 -1 0) (list -1 1 1 -1) (list -1 0 1 0)
   (list -1 -1 1 1) (list -1 1 1 -1) (list -1 0 0 0) (list -1 -1 0 1)
   (list -1 1 1 -1) (list -1 1 1 0) (list -1 -1 0 0) (list 0 1 0 -1)
   (list 0 0 0 0) (list 0 -1 0 1) (list 0 0 1 -1) (list 1 0 1 1)
   (list 1 -1 1 1) (list 0 1 1 -1) (list 0 0 1 0) (list 1 -1 0 1)
   (list 1 0 -1 -1) (list 1 1 -1 1) (list 1 -1 -1 0) (list 0 1 -1 -1)
   (list 0 1 -1 0) (list 0 -1 -1 0) (list 0 1 -1 -1) (list 0 0 -1 0)
   (list 1 -1 -1 1)))
(defvar visitados (list ))


(defun limite (posicao comp)
    ;; Função que aplica uma DFS (busca em largura) pelos símbolos de '<' ou '>'.
    ;; Dessa maneira é possível verificar a quantidade de elementos que a célula deve ser menor, ou maior.
    ;; Dada 3 células do sudoku m, n e o. Se m > n > o, m não pode ser 1 nem 2, apenas valores > 3 satisfazem a inequação.
    ;; Assim, verificamos os limites superiores e inferiores de uma célula no sudoku, reduzindo a complexidade do algoritmo.
        
    ;; @param: posição                     Posição em que o elemento será posicionado
    ;; @param: matriz comparação           Matriz de 81 listas de 4 elementos, que representa os sinais de maior e menor
    ;; @param: elementos visitados         Lista que contém todos os elementos já visitados na busca em profundidade
    ;; @param: comparação da busca         Admite apenas duas entrada = 0 ou 1, pois representa qual busca deseja se fazer, pelo símbolo '<' ou '>'
    ;; @return: total                      Quantidade de células do sudokus visitadas a partir do elemento de comparação
    
    (let ((total 1))
        (push posicao visitados)
        
        (if (and (= (elt (elt comparacao posicao) 0) comp) (not (member (- posicao 9) visitados)))
            (setq total (+ total (limite (- posicao 9) comp))))
        
        (if (and (= (elt (elt comparacao posicao) 1) comp) (not (member (+ posicao 1) visitados)))
            (setq total (+ total (limite (+ posicao 1) comp))))
        
        (if (and (= (elt (elt comparacao posicao) 2) comp) (not (member (+ posicao 9) visitados)))
            (setq total (+ total (limite (+ posicao 9) comp))))
        
        (if (and (= (elt (elt comparacao posicao) 3) comp) (not (member (- posicao 1) visitados)))
            (setq total (+ total (limite (- posicao 1) comp))))
        
        total)
)


(defun calcular-possibilidades ()
    ;; Função que calcula a matriz de possibilidades para cada casa dado a matriz de comparação.
    
    ;; @param: matriz comparação           Matriz de 81 listas de 4 elementos, que representa os sinais de maior e menor
    ;; @return: matriz possibilidades      Matriz de 81 listas de 1 até 7 elementos, que representa os valores possíveis de inserção
    
    (let ((resultado '()))
        (loop for i from 0 to 80 do
            (let ((linha '()) (limite-inferior 1) (limite-superior 9))
            ; Visitados está comom global, pois os parâmetros de uma função é uma copia e não referência 
            ; Seta ele como vazio para calcular o limite inferior
            (setq visitados (list ))
            (setq limite-inferior (limite i 1))

            ; Seta ele como vazio para calcular o limite superior
            (setq visitados (list ))
            (setq limite-superior (limite i 0))
            
            (loop for j from limite-inferior to (- 10 limite-superior) do
                (push j linha))
                (push (reverse linha) resultado)))
        (reverse resultado))
)


(defvar solucao (make-array 81 :initial-element 0))
(defvar possibilidades ( calcular-possibilidades ))


(defun repete-linha (elemento posicao)
    ;; Função que verifica se o elemento pode ser inserido em uma posição dado elementos presentes na sua linha.
    ;; Caso o elemento já exista na linha, o resultado é verdadeiro. Caso contrário, falso.
    
    ;; @param: elemento                    Valor do elemento que será inserido no sudoku
    ;; @param: posição                     Posição em que o elemento será posicionado
    ;; @param: matriz                      A matriz de 81 elementos, que simula o sudoku
    ;; @return: condição                   Se é possível inserir o elemento em dada posição

    (loop for i from 0 below 8 do
        (if (= (elt solucao (+ i (* 9 (floor posicao 9)))) elemento) 
            (return-from repete-linha t)))
    nil
)


(defun repete-coluna (elemento posicao)
    ;; Função que verifica se o elemento pode ser inserido em uma posição dado elementos presentes na sua coluna.
    ;; Caso o elemento já exista na coluna, o resultado é verdadeiro. Caso contrário, falso.
    
    ;; @param: elemento                    Valor do elemento que será inserido no sudoku
    ;; @param: posição                     Posição em que o elemento será posicionado
    ;; @param: matriz                      A matriz de 81 elementos, que simula o sudoku
    ;; @return: condição                   Se é possível inserir o elemento em dada posição
    
    (loop for i from 0 to 8 do
        (if (= (elt solucao (+ (* 9 i) (mod posicao 9))) elemento) 
            (return-from repete-coluna t)))
    nil
)


(defun repete-regiao (elemento posicao)
    ;; Função que verifica se o elemento pode ser inserido em uma posição dado elementos presentes na sua região.
    ;; Caso o elemento já exista na região, o resultado é verdadeiro. Caso contrário, falso.
    
    ;; @param: elemento                    Valor do elemento que será inserido no sudoku
    ;; @param: posição                     Posição em que o elemento será posicionado
    ;; @param: matriz                      A matriz de 81 elementos, que simula o sudoku
    ;; @return: condição                   Se é possível inserir o elemento em dada posição
    
    (let ((linha (* 3 (floor (/ posicao 27))))
        (coluna (* 3 (floor (/ (mod posicao 9) 3)))))
    (loop for i from linha below (+ linha 3) do
        (loop for j from coluna below (+ coluna 3) do
            (if (= (elt solucao (+ (* 9 i) j)) elemento)
                (return-from repete-regiao t))))
    nil)
)


(defun compara (elemento posicao)
    ;; Função que verifica se o elemento pode ser inserido em uma posição dado suas comparações de maior e menor.
    ;; Faz a verificação com os elementos acima, à direita, abaixo e à esquerda, nessa ordem.
    ;; Caso qualquer comparação falhe, o resultado é falso. Caso contrário, verdadeiro.
    
    ;; @param: elemento                    Valor do elemento que será inserido no sudoku
    ;; @param: posição                     Posição em que o elemento será posicionado
    ;; @param: matriz                      A matriz de 81 elementos, que simula o sudoku
    ;; @param: matriz comparação           Matriz de 81 listas de 4 elementos, que representa os sinais de maior e menor
    ;; @return: condição                   Se é possível inserir o elemento em dada posição
    
    (cond
        ((= (elt (elt comparacao posicao) 0) 1)
        (if (and (< elemento (elt solucao (- posicao 9)))
                (/= (elt solucao (- posicao 9)) 0))
            (return-from compara nil)))

        ((= (elt (elt comparacao posicao) 0) 0)
        (if (and (> elemento (elt solucao (- posicao 9)))
                (/= (elt solucao (- posicao 9)) 0))
            (return-from compara nil)))
    )
    (cond
        ((= (elt (elt comparacao posicao) 1) 1)
        (if (and (< elemento (elt solucao (+ posicao 1)))
                (/= (elt solucao (+ posicao 1)) 0))
            (return-from compara nil)))

        ((= (elt (elt comparacao posicao) 1) 0)
        (if (and (> elemento (elt solucao (+ posicao 1)))
                (/= (elt solucao (+ posicao 1)) 0))
            (return-from compara nil)))
    )
    (cond
        ((= (elt (elt comparacao posicao) 2) 1)
        (if (and (< elemento (elt solucao (+ posicao 9)))
                (/= (elt solucao (+ posicao 9)) 0))
            (return-from compara nil)))

        ((= (elt (elt comparacao posicao) 2) 0)
        (if (and (> elemento (elt solucao (+ posicao 9)))
                (/= (elt solucao (+ posicao 9)) 0))
            (return-from compara nil)))
    )
    (cond
        ((= (elt (elt comparacao posicao) 3) 1)
        (if (and (< elemento (elt solucao (- posicao 1)))
                (/= (elt solucao (- posicao 1)) 0))
            (return-from compara nil)))

        ((= (elt (elt comparacao posicao) 3) 0)
        (if (and (> elemento (elt solucao (- posicao 1)))
                (/= (elt solucao (- posicao 1)) 0))
            (return-from compara nil)))

    )
    t
)


(defun resolve (elemento posicao)
    ;; Função que aplica backtracking para resolver a matriz.
    
    ;; @param: elemento                    Valor do elemento que será inserido no sudoku
    ;; @param: posição                     Posição em que o elemento será posicionado
    ;; @param: matriz solução              Matriz de 81 elementos que simula o sudoku, representando a tentativa de solução atual
    ;; @param: matriz comparação           Matriz de 81 listas de 4 elementos, que representa os sinais de maior e menor
    ;; @paran: matriz possibilidades       Matriz de 81 listas de 1 até 7 elementos, que representa os valores possíveis de inserção
    ;; @return: término                    Se a solução atual é aceita (chegou ao fim) ou é impossível continuar a partir do valor atual 
    
    (cond
        ((repete-linha elemento posicao) nil)
        ((repete-coluna elemento posicao) nil)
        ((repete-regiao elemento posicao) nil)
        ((not (compara elemento posicao)) nil)
        (t
            (setf (elt solucao posicao) elemento)
            (if (= posicao 80)
                (return-from resolve t)
            (dolist (e (elt possibilidades (+ 1 posicao)))
                (if (resolve e (+ 1 posicao))
                    (return-from resolve t))))
            (setf (elt solucao posicao) 0)
            (return-from resolve nil)
        )
    )
)


(defun mostrar-matriz (matriz)
    ;; Função com o propósito de formatar a saída da matriz como um sudoku = 9 regiões 3x3.\n
    ;; [] [] []\n
    ;; [] [] []\n
    ;; [] [] []
        
    ;; @param: matriz                      A matriz de 81 elementos, que simula o sudoku
    ;; @return: void
    
    (format t "~%")
    (loop for i below (length matriz) do
        (cond ((and (zerop (mod i 27)) (/= i 0)) (format t "~%~%"))
            ((zerop (mod i 9)) (format t "~%"))
            ((zerop (mod i 3)) (format t "   ")))
        (format t "~a " (elt matriz i)))
    (format t "~%")
)


(defun main()
    ;; - Função que integra todas as demais.\n
    ;; - Inicia definindo a matriz que simula o sudoku com 0 em suas 81 posições\n
    ;; - Define-se a matriz de comparação, simulando as comparações do Vergleich\n
    ;; - Cria-se a matriz de possibilidades de inserção nas posições do sudoku\n
    ;; - O sudoku é resolvido, e calcula-se seu tempo de execução\n
    
    (mostrar-matriz possibilidades)
    (mostrar-matriz comparacao)
    (mostrar-matriz solucao)

    (loop for i below (length (elt possibilidades 0))do
        (setf resultado (resolve (elt (elt possibilidades 0) i) 0))
        (if (eq resultado t)
            (progn (mostrar-matriz solucao)
            (return-from main nil)))
    )
)

(main)