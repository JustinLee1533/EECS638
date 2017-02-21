(defrule r1
  (A)
  (B)
  =>
  (assert (E))
)

(defrule r2
  (A)(C)
  =>
  (assert (F))
)

(defrule r3
  (not(A))(B)
  =>
  (assert(D))
)

(defrule r4
  (not(A))
  (not(B))
  =>
  (assert (E))
)

(defrule r5
  (B) (C)
  =>
  (assert (F))
)

(defrule r6
  (D)
  (not(F))
  =>
  (assert (H))

)

(defrule r7
  (D)(F)
  =>
  (assert (G))
)

(defrule r8
  (E)(F)
  =>
  (assert(H))
)

(defrule r9
  (E)(not(F))
  =>
  (assert(G))
)
