(load "blockdata.lsp")

(defun match-element (x y)
  (or (equal x y) (equal y '?)))

(defun match-triple (x pat)
  (every #'match-element x pat))

(defun fetch (pat)
  (remove-if-not #'(lambda (x) (match-triple x pat)) blockdata))

(defun color-pattern (blk) (list blk 'color '?))

(defun supporters (blk)
  (mapcar #'car
    (fetch (list '? 'supports blk))))

(defun flatten (ls)
  (cond ((null ls) nil)
        ((atom ls) (list ls))
        (t (append (flatten (car ls)) (flatten (cdr ls))))))

(defun description (blk)
  (flatten
    (mapcar #'cdr
      (fetch (list blk '? '?)))))

(defun removalbe_p (blk)
  (null (fetch (list blk 'supports '?))))
