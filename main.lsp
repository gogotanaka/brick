(load "blockdata.lsp")

(defun match-element (x y)
  (or (equal x y) (equal y '?)))

(defun match-triple (x pat)
  (every #'match-element x pat))

(defun fetch (pat)
  (remove-if-not #'(lambda (x) (match-triple x pat)) blockdata))

(defun color-pattern (blk) (list blk 'color '?))

(defun asser_equal (x y)
  (format t (if (equal x y) "OK~%" "NG~%")))
