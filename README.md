# Brick
![brick](https://github.com/gogotanaka/brick/blob/master/brick.png "brick")

```lisp
(removalbe_p 'b2)
; => NIL

(removalbe_p 'b1)
; => T

(add-brick '(b4 shape brick))
(add-supports 'b4 '(b1))

(removalbe_p 'b1)
; => NIL

(remove-blk 'b4)

(removalbe_p 'b1)
; => T
```
