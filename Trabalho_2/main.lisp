
(defvar comparacao (list (list -1 1 1 -1) (list -1 0 0 0) (list -1 -1 0 1) (list -1 1 1 -1) (list -1 0 0 0) (list -1 -1 0 1) (list -1 0 0 -1) (list -1 0 1 1) (list -1 -1 1 1) (list 0 1 1 -1) (list 1 0 1 0) (list 1 -1 0 1) (list 0 0 0 -1) (list 1 1 1 1) (list 1 -1 1 0) (list 1 1 0 -1) (list 0 1 0 0) (list 0 -1 0 0) (list 0 1 -1 -1) (list 0 0 -1 0) (list 1 -1 -1 1) (list 1 1 -1 -1) (list 0 1 -1 0) (list 0 -1 -1 0) (list 1 0 -1 -1) (list 1 1 -1 1) (list 1 -1 -1 0) (list -1 0 1 -1) (list -1 1 0 1) (list -1 -1 0 0) (list -1 1 1 -1) (list -1 1 0 0) (list -1 -1 0 0) (list -1 0 0 -1) (list -1 1 1 1) (list -1 -1 0 0) (list 0 0 0 -1) (list 1 1 1 1) (list 1 -1 1 0) (list 0 0 0 -1) (list 1 1 1 1) (list 1 -1 0 0) (list 1 1 0 -1) (list 0 0 0 0) (list 1 -1 1 1) (list 1 0 -1 -1) (list 0 1 -1 1) (list 0 -1 -1 0) (list 1 0 -1 -1) (list 0 1 -1 1) (list 1 -1 -1 0) (list 1 1 -1 -1) (list 1 1 -1 0) (list 0 -1 -1 0) (list -1 1 0 -1) (list -1 1 0 0) (list -1 -1 0 0) (list -1 0 0 -1) (list -1 0 1 1) (list -1 -1 1 1) (list -1 1 1 -1) (list -1 0 0 0) (list -1 -1 0 1) (list 1 1 1 -1) (list 1 0 1 0) (list 1 -1 1 1) (list 1 1 0 -1) (list 0 0 0 0) (list 0 -1 0 1) (list 0 0 0 -1) (list 1 0 0 1) (list 1 -1 0 1) (list 0 0 -1 -1) (list 0 1 -1 1) (list 0 -1 -1 0) (list 1 1 -1 -1) (list 1 1 -1 0) (list 1 -1 -1 0) (list 1 0 -1 -1) (list 1 0 -1 1) (list 1 -1 -1 1)))
(defvar visitados (list ))


(defun limite (posicao comp)
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
    (loop for i from 0 below 8 do
        (if (= (elt solucao (+ i (* 9 (floor posicao 9)))) elemento) 
            (return-from repete-linha t)))
    nil
)


(defun repete-coluna (elemento posicao)
    (loop for i from 0 to 8 do
        (if (= (elt solucao (+ (* 9 i) (mod posicao 9))) elemento) 
            (return-from repete-coluna t)))
    nil
)


(defun repete-regiao (elemento posicao)
    (let ((linha (* 3 (floor (/ posicao 27))))
        (coluna (* 3 (floor (/ (mod posicao 9) 3)))))
    (loop for i from linha below (+ linha 3) do
        (loop for j from coluna below (+ coluna 3) do
            (if (= (elt solucao (+ (* 9 i) j)) elemento)
                (return-from repete-regiao t))))
    nil)
)


(defun compara (elemento posicao)
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
    (cond
        ((repete-linha elemento posicao) nil)
        ((repete-coluna elemento posicao) nil)
        ((repete-regiao elemento posicao) nil)
        ((not (compara elemento posicao)) nil)
        (t
            (setf (elt solucao posicao) elemento)
            (mostrar-matriz solucao)
            (if (= posicao 80)
                t
            (dolist (e (elt possibilidades (1+ posicao)))
                (if (resolve e (1+ posicao))
                    t)))
            (setf (elt solucao posicao) 0)
            nil
        )
    )
)


(defun mostrar-matriz (matriz)
  (format t "~%")
  (loop for i below (length matriz) do
    (cond ((and (zerop (mod i 27)) (/= i 0)) (format t "~%~%"))
          ((zerop (mod i 9)) (format t "~%"))
          ((zerop (mod i 3)) (format t "   ")))
    (format t "~a " (elt matriz i)))
  (format t "~%"))


(defun main()
    ;; (mostrar-matriz possibilidades)
    ;; (mostrar-matriz comparacao)
    ;; (mostrar-matriz solucao)


    (dolist (e (elt possibilidades 0))
    (if (resolve e 0)
            (mostrar-matriz solucao)
            (return-from main nil)))
)

(main)