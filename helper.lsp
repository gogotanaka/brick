(defun match-element (x y)
  (or (equal x y) (equal y '?)))

(defun match-triple (x pat)
  (every #'match-element x pat))

(defun fetch (pat)
  (remove-if-not #'(lambda (x) (match-triple x pat)) blockdata))

(defun color-pattern (blk) (list blk 'color '?))

(defun flatten (ls)
  (cond ((null ls) nil)
        ((atom ls) (list ls))
        (t (append (flatten (car ls)) (flatten (cdr ls))))))

(defun add-brick (lst)
  (setq blockdata
    (cons lst blockdata)))

(defun add-support (x y)
  (list (add-brick (list x 'supported-by y)) (add-brick (list y 'supports x))))
