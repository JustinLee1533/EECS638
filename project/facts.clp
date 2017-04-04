;;templates
(deftemplate requestPlace
  (slot name)
  (slot hasResource)
)

(deftemplate productPlace
 (slot name)
 (slot hasResource1)
)

(deftemplate resourcePlace
 (slot name)
 (slot hasResource 1)
 (slot hasResource 2)
)

;;facts
(deffacts startup
  (requestPlace (name "Product X Request") (hasResource no))
  (requestPlace (name "Product Y Request") (hasResource no))
  (requestPlace (name "Product Z Request") (hasResource no))
  (productPlace (name "p1") (hasResource no))
  (productPlace (name "p2") (hasResource no))
  (productPlace (name "p3") (hasResource no))
  (productPlace (name "p4") (hasResource no))
  (productPlace (name "p5") (hasResource no))
  (productPlace (name "p6") (hasResource no))
  (productPlace (name "p7") (hasResource no))
  (productPlace (name "p8") (hasResource no))
  (productPlace (name "p9") (hasResource no))
  (productPlace (name "p10") (hasResource no))
  (resourcePlace (name "A" (hasResource1 yes) (hasResource2 no)))
  (resourcePlace (name "B" (hasResource1 yes) (hasResource2 yes)))
  (resourcePlace (name "C" (hasResource1 yes) (hasResource2 yes)))
)
