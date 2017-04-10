; Author: Justin Lee
; file: facts.CLP
; date: 2/28/2017
; about: contains definition template and facts for homework 2

(deftemplate factoid
  (slot name)
)

(deffacts factoids
  (factoid (name A))
  (factoid (name B))
  (factoid (name C))
)
