command! -nargs=1 Doc :ConjureEval (do (require '[clojure.repl :refer :all]) (doc <args>))
command! -nargs=1 Javadoc :ConjureEval (do (require '[clojure.java.javadoc :refer :all]) (javadoc <args>))
