
(defvar solucao (make-array 81 :initial-element 0))
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


(defun matriz-possibilidades ()
  (let ((matriz '()))
    (loop for i from 0 to 80 do
      (let ((linha '()) (limite-inferior 1) (limite-superior 9))
        (setq visitados (list ))
        (setq limite-inferior (limite i 1))

        (setq visitados (list ))
        (setq limite-superior (limite i 0))
        
        (loop for j from limite-inferior to (- 10 limite-superior) do
          (push j linha))
        (push (reverse linha) matriz)))
    (reverse matriz))
)


(defun main()
    (write-line (write-to-string solucao))
    (write-line (write-to-string comparacao))
    (write-line (write-to-string ( matriz-possibilidades )))
)

(main)