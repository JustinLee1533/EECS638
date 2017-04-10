; Author: Justin Lee
; file:   rules.clp
; date:   4/11/2017
; about:  contains rule definitions Expert System
;         for Resource Allocation Programming Project


;;reads in line and determines which request to grant
(defrule readLine

  ?fact0 <- (requestResource (name "X") (request no))
  ?fact1 <- (requestResource (name "Y") (request no))
  ?fact2 <- (requestResource (name "Z") (request no))
  ?fact3 <- (requestResource (name "None") (request no))

  ?fact4 <- (systemHalt (halt no))

  =>
  ;;read in the request
  (bind ?x (read input))
  (bind ?y (read input))
  (bind ?z (read input))

  (printout output " " crlf)

  (printout output "Line inputs: " ?x ?y ?z crlf)
  ;;read in line from input file and determine which resource to grant if any
  (if (= ?x 1);;1XX
    then
    (modify ?fact0 (request yes)) ;;request X
   else
    (if (= ?y 1);;01X
      then
      (modify ?fact1 (request yes)) ;;request Y
     else
       (if  (= ?z 1);;XX1
         then
         (modify ?fact2  (request yes)) ;;request Z
        else
        ;;grantNone, no requests
        (modify ?fact3 (request yes))
       )
    )
  )

  (if;;-1-1-1
    (and (= ?x -1)
         (= ?y -1)
         (= ?z -1)
    )
    then
    (modify ?fact4 (halt yes)) ;;done
    (printout output "End of file reached, halting" crlf)
  )

)

;;grant no requests
(defrule grantNone
  ?fact0 <- (requestResource (name "None") (request yes))
  =>
  (modify ?fact0 (request no))
  (printout output "No resource requested and none granted" crlf)
  (printState)


  ;;TODO: call print function here and in all rules except readline

)

;;Product X transitions;;
;; allocate X resource function
(defrule grantX
  ;;Product X is requested
  ?fact0 <- (requestPlace (name "Product X Request") (hasResource no))

  ;;Resource A and  B have 1 resource
  ?fact1 <- (resourcePlace (name "A") (hasResource1 yes))
  ?fact2 <- (resourcePlace (name "B") (hasResource1 yes))

  ;;p2 does not have resource
  ?fact3 <- (productPlace (name "p1") (hasResource no))

  ;; global request for product X
  ?fact4 <- (requestResource (name "X") (request yes))

  ;;no other other grants occuring globally
  ?fact5 <- (grantRequest (name "X") (grant no))
  (grantRequest (name "Y") (grant no))
  (grantRequest (name "Z") (grant no))

  =>
  ;;put resource from Resource A in "Product X Request"
  (modify ?fact1 (hasResource1 no))
  (modify ?fact0 (hasResource yes))

  ;;put resource 1 from Resource B in p1
  (modify ?fact2 (hasResource1 no))
  (modify ?fact3 (hasResource yes))

  (modify ?fact5 (grant yes))

  (bind ?*p1* 1)

  ;;output to file
  (printout output "Removing resource from 'Resource A' and 'Resource B'" crlf)
  (printout output "Moving resource to 'Request for product X' and 'p1'" crlf)
  (printState)

)

;;transition from p1 to p2
(defrule transition1to2
  ;;request for X is active
  ?fact1 <- (requestPlace (name "Product X Request") (hasResource yes))

  ;;p1 has resource
  ?fact2 <- (productPlace (name "p1") (hasResource yes))

  ?fact3 <- (productPlace (name "p2") (hasResource no))
  =>
  ;;remove resource from p1, put resource in p2
  (modify ?fact2 (hasResource no))
  (modify ?fact3 (hasResource yes))

  (bind ?*p1* 0)
  (bind ?*p2* 1)
  ;;output to file
  ;;output to console
  (printState)

)

;;transition from p2 to p3
(defrule transition2to3
  ;;request for X is active and p2 has resource
  ?fact1 <- (requestPlace (name "Product X Request") (hasResource yes))
  ?fact2 <- (productPlace (name "p2") (hasResource yes))

  ;;p3 does not have  resource
  ?fact3 <- (productPlace (name "p3") (hasResource no))

  =>
  ;;remove resource from p2, put in p3
  (modify ?fact2 (hasResource no))
  (modify ?fact3 (hasResource yes))

  (bind ?*p2* 0)
  (bind ?*p3* 1)
  ;;output to file
  ;;output to console
  (printState)

)

;;transition from p3 to p4
(defrule transtion3to4
  ;;request for X is active
  (requestPlace (name "Product X Request") (hasResource yes))

  ;;p3 has resource, p4 does not
  ?fact1 <- (productPlace (name "p3") (hasResource yes))
  ?fact2 <- (productPlace (name "p4") (hasResource no))

  =>
  ;;remove resource from p3, put resource in p4
  (modify ?fact1 (hasResource no))
  (modify ?fact2 (hasResource yes))

  (bind ?*p3* 0)
  (bind ?*p4* 1)
  ;;output to file
  ;;output to console
  (printState)

)


;;Produce product X
(defrule produceX
  ;;request for X is active
  ?fact1 <- (requestPlace (name "Product X Request") (hasResource yes))

  ;;p4 has resource
  ?fact2 <- (productPlace (name "p4") (hasResource yes))

  ;;reources places A and B do not have resources
  ?fact3 <- (resourcePlace (name "A") (hasResource1 no))
  ?fact4 <- (resourcePlace (name "B") (hasResource1 no))

  ;; global request for product X, and grant
  ?fact5 <- (requestResource (name "X") (request yes))
  ?fact6 <- (grantRequest (name "X") (grant yes))

  =>
  ;;remove resource from p4 and from Request product X place
  (modify ?fact2 (hasResource no))
  (modify ?fact1 (hasResource no))

  ;;put resource in Resource A place and in Resource B place 1
  (modify ?fact3 (hasResource1 yes))
  (modify ?fact4 (hasResource1 yes))

  ;; remove global request and grant for product X
  (modify ?fact5  (request no))
  (modify ?fact6  (grant no))

  (bind ?*p4*  0)
  ;;output to file
  ;;output to console
  (printState)

)


;;Product Y transitions
;;Allocate Y resource rule
(defrule grantY
  ;; global request for product Y
  ?fact0 <- (requestResource (name "Y") (request yes))

  ?fact1 <- (requestPlace (name "Product Y Request") (hasResource no))

  ;;Resource B has 1 resource
  ?fact2 <- (resourcePlace (name "B") (hasResource1 yes))

  ;;Resource C has 1 resource
  ?fact3 <- (resourcePlace (name "C") (hasResource1 yes))

  ;;p4 does not have resource
  ?fact4 <- (productPlace (name "p5") (hasResource no))

  ;;no other other grants occuring globally
  (grantRequest (name "X") (grant no))
  ?fact5 <- (grantRequest (name "Y") (grant no))
  (grantRequest (name "Z") (grant no))

  =>
  ;;remove 1 resource from B and C
  (modify ?fact2 (hasResource1 no))
  (modify ?fact3 (hasResource1 no))

  ;;put resource in "Product Y Request" and in p5
  (modify ?fact1 (hasResource yes))
  (modify ?fact4 (hasResource yes))
  (modify ?fact5 (grant yes))

  (bind ?*p5* 1)
  ;;output to file
  ;;output to console
  (printState)

)

;;transition from p5 to p6
(defrule transition5to6
  ;;request for Y is active
 (requestPlace (name "Product Y Request") (hasResource yes))

  ;;p5 has resource, p6 does not
  ?fact1 <- (productPlace (name "p5") (hasResource yes))
  ?fact2 <- (productPlace (name "p6") (hasResource no))

  =>
  ;;remove resource from p5, put resource in p6
  (modify ?fact1 (hasResource no))
  (modify ?fact2 (hasResource yes))

  (bind ?*p5* 0)
  (bind ?*p6* 1)
  ;;output to file
  ;;output to console
  (printState)

)

;;transition from p6 to p7
(defrule transition6to7
  ;;request for Y is active
 (requestPlace (name "Product Y Request") (hasResource yes))

  ;;p6 has resource, p7 does not

  ?fact1 <- (productPlace (name "p6") (hasResource yes))
  ?fact2 <- (productPlace (name "p7") (hasResource no))
  =>
  ;;remove resource from p6, add resource to p7
  (modify ?fact1 (hasResource no))
  (modify ?fact2 (hasResource yes))

  (bind ?*p6* 0)
  (bind ?*p7* 1)
  ;;output to file
  ;;output to console
  (printState)

)

;;Produce product Y
(defrule produceY
  ;;request for Y is active
  ?fact1 <- (requestPlace (name "Product Y Request") (hasResource yes))

  ;;p7 has resource
  ?fact2 <- (productPlace (name "p7") (hasResource yes))

  ;; Resource B place 1 and C place  1 do not have resource
  ?fact3 <- (resourcePlace (name "B") (hasResource1 no) )
  ?fact4 <- (resourcePlace (name "C") (hasResource1 no))

  ;;global grant and request for Y
  ?fact5 <- (requestResource (name "Y") (request yes))
  ?fact6 <- (grantRequest (name "Y") (grant yes))
  =>
  ;;remove resource from p7 and from Request Y Place
  (modify ?fact1 (hasResource no))
  (modify ?fact2 (hasResource no))

  ;;put resource in Resource B place 1 and C place 1
  (modify ?fact3 (hasResource1 yes))
  (modify ?fact4 (hasResource1 yes))

  ;; remove global request and grant for product Y
  (modify ?fact5  (request no))
  (modify ?fact6  (grant no))

  (bind ?*p7* 0)
  ;;output to file
  ;;output to console
  (printState)

)

;;Product Z transitions
;;allocate Z resource rule
(defrule grantZ
  ;; global request for product Y
  ?fact0 <- (requestResource (name "Z") (request yes))

  ;;Grant Product Z request, and p8 does not have resource
  ?fact1 <-  (requestPlace (name "Product Z Request") (hasResource no))
  ?fact2 <- (productPlace (name "p8") (hasResource no))

  ;;Resource C has 2 resources
  ?fact3 <- (resourcePlace (name "C")(hasResource1 yes)(hasResource2 yes))

  ;;no other other grants occuring globally
  (grantRequest (name "X") (grant no))
  (grantRequest (name "Y") (grant no))
  ?fact4 <- (grantRequest (name "Z") (grant no))

    =>
  ;;remove 2 resources from C
  (modify ?fact3 (hasResource1 no)(hasResource2 no))

  ;;put resource 1 from Resource C in "Product C Request" and in p8
  (modify ?fact1 (hasResource yes))
  (modify ?fact2 (hasResource yes))
  (modify ?fact4 (grant yes))

  (bind ?*p8* 1)

  ;;output to file
  (printState)
  ;;output to console
)

;;transition from p8 to p9
(defrule transition8to9
  ;;request for Z is active
  (requestPlace (name "Product Z Request") (hasResource yes))

  ;;p8 has resource, p9 does not
  ?fact1 <- (productPlace (name "p8") (hasResource yes))
  ?fact2 <- (productPlace (name "p9") (hasResource no))

  =>

  ;;remove resource from p8, add resource to p9
  (modify ?fact1 (hasResource no))
  (modify ?fact2 (hasResource yes))

  (bind ?*p8* 0)
  (bind ?*p9* 1)

  ;;output to file
  ;;output to console
  (printState)

)

;;transition from p9 to p10
(defrule transition9to10
  ;;request for Z is active
  (requestPlace (name "Product Z Request") (hasResource yes))


  ;;p9 has resource, p10 doesn't
  ?fact1 <- (productPlace (name "p9") (hasResource yes))
  ?fact2 <- (productPlace (name "p10") (hasResource no))

  =>
  ;;remove resource from p9 and add resource to p10
  (modify ?fact1 (hasResource no))
  (modify ?fact2 (hasResource yes))

  (bind ?*p9* 0)
  (bind ?*p10* 1)
  ;;output to file
  ;;output to console
  (printState)

)

;;Produce product Z
(defrule produceZ
  ;;request for Z and p10 have resource
  ?fact1 <- (requestPlace (name "Product Z Request") (hasResource yes))
  ?fact2 <- (productPlace (name "p10") (hasResource yes))

  ;; C does not have either resource
  ?fact3 <- (resourcePlace (name "C")(hasResource1 no)(hasResource2 no))

  ;;global grant and request for Z
  ?fact5 <- (requestResource (name "Z") (request yes))
  ?fact6 <- (grantRequest (name "Z") (grant yes))

  =>
  ;;remove resource from p8 and from Request Z Place
  (modify ?fact1 (hasResource no))
  (modify ?fact2 (hasResource no))

  ;;put resource in Resource C place 1 & 2
  (modify ?fact3 (hasResource1 yes)(hasResource2 yes))

  ;; remove global request and grant for product Y
  (modify ?fact5  (request no))
  (modify ?fact6  (grant no))

  (bind ?*p10* 0)

  ;;output to file
  ;;output to console
  (printState)

)
