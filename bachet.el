;;; bachet.el --- Solution to the Bachet's Problem  -*- lexical-binding:t -*-

;;; Commentary:
;; see https://www.youtube.com/watch?v=giAQ4EvujnE

;;; Code:

(eval-when-compile (require 'cl))

(defun bachet (max)
    "Main function. Calculate upto MAX."
  (cl-loop
   with elts = '((2))
   for maxsum = (apply '+ (car elts))
   for elt = (+ 2 (* 2  maxsum))
   while (< maxsum max)
   do (setq elts (bachet-build-lst elt elts))
   finally return elts))

(defun bachet-build-lst (elt lst)
  "Builds all possible weights from already known weights in LST plus a new weight ELT."
  (cl-loop
	   for i in (reverse lst)
	   for j in lst
	   collect (cons elt (mapcar '- i)) into first
	   collect (cons elt j) into second
	   finally return (append second (list (list elt)) first lst)))


(defun bachet-print (bachet-list)
  "Pretty prints all possible weight from BACHET-LIST."
  (message "\n%s%s"
	   (mapconcat
	    (lambda (x)
	      (concat (format "%4d" (apply '+ x))
		      " = "
		      (replace-regexp-in-string "\\+ -" "- "
						(mapconcat
						 'number-to-string x " + "))))
	    bachet-list "\n")
	   (format "\nWeights: %s" (car bachet-list))))

(bachet-print (bachet 80))

;; Solution for the original Bachet problem of weight 40
;; (bachet-print (mapcar (lambda (y) (mapcar (lambda (x) (/ x 2)) y)) (bachet 80)))

(provide 'bachet)

;;; bachet.el ends here
