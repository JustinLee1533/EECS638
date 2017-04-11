; Author: Justin Lee
; file:   functions.clp
; date:   4/11/2017
; about:  contains function definitions Expert System
;         for Resource Allocation Programming Project

(deffunction printState ()
  ;;(?r1 ?r2 ?r3 ?r4 ?r5 ?r6 ?r7 ?r8 ?r9 ?r10)
  (printout output "Current State: " crlf)
  (printout output ?*p1* "," ?*p2* "," ?*p3* "," ?*p4* "," ?*p5* "," ?*p6* "," ?*p7* "," ?*p8* "," ?*p9* "," ?*p10* crlf)
  (printout output " " crlf)
)

(deffunction printCount()
  (printout output "Resource X count: " ?*countX* ", Resource Y count: " ?*countY* ", Resource Z count: " ?*countZ* crlf)
)
