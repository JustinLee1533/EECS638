; Author: Justin Lee
; file: rules.clp
; date: 4/11/2017
; about: contains rule definitions Expert System for Resource Allocation Programming Project

;;TODO: rules for reading in line and determining which rules to execute
(defrule readLine
  ;;Line is ready to be read, how to determine? resource just granted and system ulocked, and no requests

  =>
  ;;read in line from input file
  ;;determine which resource to grant if any
  (if ;;1XX
    then 
    (assert) ;;grantX
   else
    (if;;01X
      then
      (assert) ;;grantY
     else
       (if ;;XX1
         then
         (assert) ;;grantZ
        else
         (assert) ;;grantNone
       )
    )
  )

  
)


;;Product X transitions;;
;;TODO: allocate X resource function
(defrule grantX
  ;;Product X is requested
  ;;Resource A has 1 resource
  ;;Resource B has 1 resource
  ;;TODO: either put a global lock here or perhaps make more conditions to prevent this rule from continuously firing
  =>
  ;;put resource from Resource A in "Product X Request" 
  ;;put resource 1 from Resource B in p1
  ;;output to file
  ;;output to console
)

;;transition from p1 to p2
(defrule transition1to2
  ;;request for X is active
  ;;p1 has resource
  =>
  ;;remove resource from p1
  ;;put resource in p2
  ;;output to file
  ;;output to console
)

;;transition from p2 to p3
(defrule transition2to3
  ;;request for X is active
  ;;p2 has resource
  =>
  ;;remove resource from p2
  ;;put resource in p3
  ;;output to file
  ;;output to console

)

;;transition from p3 to p4
(defrule transtion3to4
  ;;request for X is active
  ;;p3 has resource
  =>
  ;;remove resource from p3
  ;;put resource in p4
  ;;output to file
  ;;output to console
)


;;Produce product X
(defrule produceX
  ;;request for X is active
  ;;p4 has resource
  =>
  ;;remove resource from p4
  ;;remove resource from Request product X place
  ;;put resource in Resource A place
  ;;put resource in Resource B place 1
  ;;release system lock
  ;;output to file
  ;;output to console
)


;;Product Y transitions
;;Allocate Y resource rule
(defrule grantY
  ;;Product Y is requested
  ;;Resource B has 1 resource
  ;;Resource C has 1 resource
  ;;TODO: either put a global lock here or perhaps make more conditions to prevent this rule from continuously firing
  =>
  ;;remove 1 resource from B and C
  ;;put resource from Resource B in "Product Y Request" 
  ;;put resource 1 from Resource C in p5
  ;;output to file
  ;;output to console
)
;;transition from p5 to p6
(defrule transition5to6
  (declare (salience 4))
  ;;request for Y is active
  ;;p5 has resource
  =>
  ;;remove resource from p5
  ;;put resource in p6
  ;;output to file
  ;;output to console
)

;;transition from p6 to p7
(defrule transition6to7
  ;;request for Y is active
  ;;p6 has resource
  =>
  ;;remove resource from p6
  ;;add resource to p7
  ;;output to file
  ;;output to console
  (assert)
)

;;Produce product Y
(defrule produceY
  ;;request for Y is active
  ;;p7 has resource
  =>
  ;;remove resource from p7
  ;;remove resource from Request Y Place
  ;;put resource in Resource B place 1
  ;;put resource in Resource B place 2
  ;;release system lock
  ;;output to file
  ;;output to console
)
;;Product Z transitions
;;allocate Z resource rule
(defrule grantZ
  ;;Product Z is requested
  ;;Resource C has 2 resources
  ;;TODO: either put a global lock here or perhaps make more conditions to prevent this rule from continuously firing
  =>
  ;;remove 2 resources from C
  ;;put resource 1 from Resource C in "Product C Request" 
  ;;put resource 2 from Resource C in p8
  ;;output to file
  ;;output to console
)

;;transition from p8 to p9
(defrule transition8to9
  ;;request for Z is active
  ;;p8 has resource
  =>
  ;;remove resource from p8
  ;;add resource to p9
  ;;output to file
  ;;output to console
  (assert)
)

;;transition from p9 to p10
(defrule transition9to10
  ;;request for Z is active
  ;;p9 has resource
  =>
  ;;remove resource from p10
  ;;add resource to p10
  ;;output to file
  ;;output to console
  (assert)
)


;;Produce product Z
(defrule produceZ
  ;;request for Z is active
  ;;p10 has resource
  =>
  ;;remove resource from p8
  ;;remove resource from Request Z Place
  ;;put resource in Resource C place 1
  ;;put resource in Resource C place 2
  ;;release system lock
  ;;output to file
  ;;output to console
)
