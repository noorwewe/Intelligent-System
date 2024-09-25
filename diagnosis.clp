(deftemplate symptom
   (slot name))
;; If the user has a runny nose and sneezing, it's likely an allergy.
(defrule has-allergies
   (symptom (name "runny-nose"))
   (symptom (name "sneezing"))
   =>
   (printout t "It seems like you might be suffering from allergies." crlf))

;; If the user has a sore throat, runny nose, and mild fever, it's likely a common cold.
(defrule has-common-cold
   (symptom (name "sore-throat"))
   (symptom (name "runny-nose"))
   (symptom (name "mild-fever"))
   =>
   (printout t "It seems like you have a common cold." crlf))

;; If the user has a high fever, muscle aches, and fatigue, it could be the flu.
(defrule has-flu
   (symptom (name "high-fever"))
   (symptom (name "muscle-aches"))
   (symptom (name "fatigue"))
   =>
   (printout t "You might have the flu." crlf))
;; Ask if the user has a runny nose
(defrule ask-runny-nose
   =>
   (printout t "Do you have a runny nose? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (assert (symptom (name "runny-nose")))))

;; Ask if the user is sneezing
(defrule ask-sneezing
   =>
   (printout t "Are you sneezing? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (assert (symptom (name "sneezing")))))

;; Ask if the user has a sore throat
(defrule ask-sore-throat
   =>
   (printout t "Do you have a sore throat? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (assert (symptom (name "sore-throat")))))

;; Ask if the user has a mild fever
(defrule ask-mild-fever
   =>
   (printout t "Do you have a mild fever? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (assert (symptom (name "mild-fever")))))

;; Ask if the user has a high fever
(defrule ask-high-fever
   =>
   (printout t "Do you have a high fever? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (assert (symptom (name "high-fever")))))

;; Ask if the user has muscle aches
(defrule ask-muscle-aches
   =>
   (printout t "Do you have muscle aches? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (assert (symptom (name "muscle-aches")))))

;; Ask if the user is feeling fatigued
(defrule ask-fatigue
   =>
   (printout t "Are you feeling fatigued? (yes/no)" crlf)
   (bind ?answer (read))
   (if (eq ?answer yes) then
      (assert (symptom (name "fatigue")))))
(defrule start-diagnosis
   =>
   (printout t "Welcome to the medical diagnosis expert system." crlf)
   (run 1) ;; Ask runny nose
   (run 1) ;; Ask sneezing
   (run 1) ;; Ask sore throat
   (run 1) ;; Ask mild fever
   (run 1) ;; Ask high fever
   (run 1) ;; Ask muscle aches
   (run 1) ;; Ask fatigue
   (printout t "Diagnosis complete." crlf))
