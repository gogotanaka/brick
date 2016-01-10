(load "blockdata.lsp")
(load "helper.lsp")

(defun supporters (blk)
  (mapcar #'car
    (fetch (list '? 'supports blk))))

(defun description (blk)
  (flatten
    (mapcar #'cdr
      (fetch (list blk '? '?)))))

(defun removalbe_p (blk)
  (null (fetch (list blk 'supports '?))))

(defun add-supports (blk blks)
  (cond ((null blks) NIL)
        (t (add-support blk (car blks)) (add-supports blk (cdr blks)))))

(defun remove-blk (blk)
  (setq blockdata
    (remove-if
      #'(lambda (x) (or
        (match-triple x (list blk '? '?))
        (match-triple x (list '? '? blk))))
      blockdata)))
