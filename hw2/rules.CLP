(defrule r1
  (declare (salience 1))
  (factoid (name A))
  (factoid (name B))
  =>
  (assert(factoid (name E)))
)

(defrule r2
  (declare (salience 2))
  (factoid (name A))
  (factoid (name C))
  =>
  (assert(factoid (name F)))
)

(defrule r3
  (declare (salience 3))
  (not(factoid (name A)))
  (factoid (name B))
  =>
  (assert(factoid (name D)))
)

(defrule r4
  (declare (salience 4))
  (not(factoid (name A)))
  (not(factoid (name B)))
  =>
  (assert(factoid (name E)))
)

(defrule r5
  (declare (salience 5))
  (factoid (name B))
  (factoid (name C))
  =>
  (assert(factoid (name F)))
)

(defrule r6
  (declare (salience 6))
  (factoid (name D))
  (not(factoid (name F)))
  =>
  (assert(factoid (name H)))
)

(defrule r7
  (declare (salience 7))
  (factoid (name D))
  (factoid (name F))
  =>
  (assert(factoid (name G)))
)

(defrule r8
  (declare (salience 8))
  (factoid (name E))
  (factoid (name F))
  =>
  (assert(factoid (name H)))
)

(defrule r9
  (declare (salience 9))
  (factoid (name E))
  (not(factoid (name F)))
  =>
  (assert(factoid (name G)))
)
