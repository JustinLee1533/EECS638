(defrule r1
  (factoid (name A))
  (factoid (name B))
  =>
  (assert(factoid (name E)))
)

(defrule r2
  (factoid (name A))
  (factoid (name C))
  =>
  (assert(factoid (name F)))
)

(defrule r3
  (not(factoid (name A)))
  (factoid (name B))
  =>
  (assert(factoid (name D)))
)

(defrule r4
  (not(factoid (name A)))
  (not(factoid (name B)))
  =>
  (assert(factoid (name E)))
)

(defrule r5
  (factoid (name B))
  (factoid (name C))
  =>
  (assert(factoid (name F)))
)

(defrule r6
  (factoid (name D))
  (not(factoid (name F)))
  =>
  (assert(factoid (name H)))
)

(defrule r7
  (factoid (name D))
  (factoid (name F))
  =>
  (assert(factoid (name G)))
)

(defrule r8
  (factoid (name E))
  (factoid (name F))
  =>
  (assert(factoid (name H)))
)

(defrule r9
  (factoid (name E))
  (not(factoid (name F)))
  =>
  (assert(factoid (name G)))
)
