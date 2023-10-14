
(defvar solucao (make-array 81 :initial-element 0))
(defvar compara (list (list -1 1 1 -1) (list -1 0 0 0) (list -1 -1 0 1) (list -1 1 1 -1) (list -1 0 0 0) (list -1 -1 0 1) (list -1 0 0 -1) (list -1 0 1 1) (list -1 -1 1 1) (list 0 1 1 -1) (list 1 0 1 0) (list 1 -1 0 1) (list 0 0 0 -1) (list 1 1 1 1) (list 1 -1 1 0) (list 1 1 0 -1) (list 0 1 0 0) (list 0 -1 0 0) (list 0 1 -1 -1) (list 0 0 -1 0) (list 1 -1 -1 1) (list 1 1 -1 -1) (list 0 1 -1 0) (list 0 -1 -1 0) (list 1 0 -1 -1) (list 1 1 -1 1) (list 1 -1 -1 0) (list -1 0 1 -1) (list -1 1 0 1) (list -1 -1 0 0) (list -1 1 1 -1) (list -1 1 0 0) (list -1 -1 0 0) (list -1 0 0 -1) (list -1 1 1 1) (list -1 -1 0 0) (list 0 0 0 -1) (list 1 1 1 1) (list 1 -1 1 0) (list 0 0 0 -1) (list 1 1 1 1) (list 1 -1 0 0) (list 1 1 0 -1) (list 0 0 0 0) (list 1 -1 1 1) (list 1 0 -1 -1) (list 0 1 -1 1) (list 0 -1 -1 0) (list 1 0 -1 -1) (list 0 1 -1 1) (list 1 -1 -1 0) (list 1 1 -1 -1) (list 1 1 -1 0) (list 0 -1 -1 0) (list -1 1 0 -1) (list -1 1 0 0) (list -1 -1 0 0) (list -1 0 0 -1) (list -1 0 1 1) (list -1 -1 1 1) (list -1 1 1 -1) (list -1 0 0 0) (list -1 -1 0 1) (list 1 1 1 -1) (list 1 0 1 0) (list 1 -1 1 1) (list 1 1 0 -1) (list 0 0 0 0) (list 0 -1 0 1) (list 0 0 0 -1) (list 1 0 0 1) (list 1 -1 0 1) (list 0 0 -1 -1) (list 0 1 -1 1) (list 0 -1 -1 0) (list 1 1 -1 -1) (list 1 1 -1 0) (list 1 -1 -1 0) (list 1 0 -1 -1) (list 1 0 -1 1) (list 1 -1 -1 1)))


(defun main()
    (write-line (write-to-string solucao))
    (write-line (write-to-string compara))
    
)
(main)