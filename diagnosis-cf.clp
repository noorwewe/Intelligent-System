(deftemplate symptom
   (slot name)
   (slot certainty))

(defrule flu
   (symptom (name "high-fever") (certainty ?cf1))
   (symptom (name "muscle-aches") (certainty ?cf2))
   (symptom (name "fatigue") (certainty ?cf3))
   =>
   (bind ?cf (min ?cf1 ?cf2 ?cf3))
   (printout t "You might have the flu. Certainty factor: " ?cf crlf))

(defrule common-cold
   (symptom (name "sore-throat") (certainty ?cf1))
   (symptom (name "runny-nose") (certainty ?cf2))
   (symptom (name "mild-fever") (certainty ?cf3))
   =>
   (bind ?cf (min ?cf1 ?cf2 ?cf3))
   (printout t "It seems like you have a common cold. Certainty factor: " ?cf crlf))

(defrule allergies
   (symptom (name "runny-nose") (certainty ?cf1))
   (symptom (name "sneezing") (certainty ?cf2))
   =>
   (bind ?cf (min ?cf1 ?cf2))
   (printout t "It seems like you might be suffering from allergies. Certainty factor: " ?cf crlf))

(defrule ask-runny-nose
   =>
   (printout t "Do you have a runny nose? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (printout t "How certain are you (0 to 1)? " crlf)
      (bind ?cf (read))
      (assert (symptom (name "runny-nose") (certainty ?cf)))))

(defrule ask-sneezing
   =>
   (printout t "Are you sneezing? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (printout t "How certain are you (0 to 1)? " crlf)
      (bind ?cf (read))
      (assert (symptom (name "sneezing") (certainty ?cf)))))
      
(defrule ask-sore-throat
   =>
   (printout t "Do you have a sore throat? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (printout t "How certain are you (0 to 1)? " crlf)
      (bind ?cf (read))
      (assert (symptom (name "sore-throat") (certainty ?cf)))))

(defrule ask-mild-fever
   =>
   (printout t "Do you have a mild fever? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (printout t "How certain are you (0 to 1)? " crlf)
      (bind ?cf (read))
      (assert (symptom (name "mild-fever") (certainty ?cf)))))
      
(defrule ask-high-fever
   =>
   (printout t "Do you have a high fever? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (printout t "How certain are you (0 to 1)? " crlf)
      (bind ?cf (read))
      (assert (symptom (name "high-fever") (certainty ?cf)))))

(defrule ask-muscle-aches
   =>
   (printout t "Do you have muscle aches? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (printout t "How certain are you (0 to 1)? " crlf)
      (bind ?cf (read))
      (assert (symptom (name "muscle-aches") (certainty ?cf)))))

(defrule ask-fatigue
   =>
   (printout t "Are you feeling fatigued? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (printout t "How certain are you (0 to 1)? " crlf)
      (bind ?cf (read))
      (assert (symptom (name "fatigue") (certainty ?cf)))))

(defrule start-diagnosis
   =>
   (printout t "Welcome to the medical diagnosis expert system with certainty factors." crlf)
   (run 1) ;; Ask runny nose
   (run 1) ;; Ask sneezing
   (run 1) ;; Ask sore throat
   (run 1) ;; Ask mild fever
   (run 1) ;; Ask high fever
   (run 1) ;; Ask muscle aches
   (run 1) ;; Ask fatigue
   (printout t "Diagnosis complete." crlf))
