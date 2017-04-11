(defglobal
  ;;global variables for state, used for printing
    ?*p1* = 0
    ?*p2* = 0
    ?*p3* = 0
    ?*p4* = 0
    ?*p5* = 0
    ?*p6* = 0
    ?*p7* = 0
    ?*p8* = 0
    ?*p9* = 0
    ?*p10* = 0

    ;;counts for keeping track of resources produced
    ?*countX* = 0
    ?*countY* = 0
    ?*countZ* = 0
)



;;templates
(deftemplate requestPlace
  (slot name)
  (slot hasResource)
)

(deftemplate productPlace
 (slot name)
 (slot hasResource)
)

(deftemplate resourcePlace
 (slot name)
 (slot hasResource1)
 (slot hasResource2)
)

;;For determining which request, based on input file and priority
(deftemplate requestResource
  (slot name)
  (slot request)
)

;;for determining which resource should be granted
(deftemplate grantRequest
 (slot name)
 (slot grant )
)

;;for locking and preventing other resource grants while one is already in place
(deftemplate systemLock
  (slot locked)
)

;;for stopping the sytem at end of file
(deftemplate systemHalt
  (slot halt)
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
  (resourcePlace (name "A") (hasResource1 yes) (hasResource2 no))
  (resourcePlace (name "B") (hasResource1 yes) (hasResource2 yes))
  (resourcePlace (name "C") (hasResource1 yes) (hasResource2 yes))
  (requestResource (name "X") (request no))
  (requestResource (name "Y") (request no))
  (requestResource (name "Z") (request no))
  (requestResource (name "None") (request no))
  (grantRequest (name "X") (grant no))
  (grantRequest (name "Y") (grant no))
  (grantRequest (name "Z") (grant no))
  (systemHalt (halt no))

)
