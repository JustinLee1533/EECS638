(clear)

(open "input.txt" input "r")
(open ("output.txt" output "w")

(load facts.clp)
(load rules.clp)
(load functions.clp)

(reset)
(watch facts)
(watch rules)
(agenda)
(facts)
#(run)
#(facts)
#(save "session.txt")
#close files
#(close input)
#(close output)
