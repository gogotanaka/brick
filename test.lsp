(load "main.lsp")

(defun asser-equal (x y)
  (format t (if (equal x y) "OK~%" "NG~%")))

(defun print-elements-of-list (list)
  (loop for cons on list
    do (format t "~a" (car cons))
      when (cdr cons) do (format t ", ")))

(asser-equal (match-element "A" "A") T)
(asser-equal (match-element "A" '?) T)
(asser-equal (match-element '? "A") NIL)
(asser-equal (match-element '? '?) T)
(asser-equal (match-triple '(b2 color red) '(b2 color ?)) T)
(asser-equal (match-triple '(b2 color red) '(b2 color blue)) NIL)
(asser-equal (fetch '(? supports b1)) '((b2 supports b1) (b3 supports b1)))
(asser-equal (color-pattern 'b1) '(b1 color ?))
(asser-equal (supporters 'b1) '(b2 b3))
(asser-equal (description 'b2) '(shape brick color red size small supprots b1 left-of b3))
(asser-equal (removalbe_p 'b2) NIL)
(asser-equal (removalbe_p 'b1) T)

(add-brick '(b4 shape brick))
(add-supports 'b4 '(b1))

(asser-equal (removalbe_p 'b1) NIL)

(remove-blk 'b1)
(remove-blk 'b4)

(asser-equal (removalbe_p 'b1) T)
