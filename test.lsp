(load "main.lsp")

(defun asser_equal (x y)
  (format t (if (equal x y) "OK~%" "NG~%")))

(asser_equal (match-element "A" "A") T)
(asser_equal (match-element "A" '?) T)
(asser_equal (match-element '? "A") NIL)
(asser_equal (match-element '? '?) T)

(asser_equal (match-triple '(b2 color red) '(b2 color ?)) T)
(asser_equal (match-triple '(b2 color red) '(b2 color blue)) NIL)

(asser_equal (fetch '(? supports b1)) '((b2 supports b1) (b3 supports b1)))

(asser_equal (color-pattern 'b1) '(b1 color ?))

(asser_equal (supporters 'b1) '(b2 b3))
