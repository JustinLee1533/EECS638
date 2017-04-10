(clear)

(open "input.txt" input "r")
(open "output.txt" output "w")

(load facts.clp)
(load functions.clp)
(load rules.clp)

(reset)
(watch facts)
(watch rules)
(agenda)
(facts)
(run)
(facts)

(close input)
(close output)
