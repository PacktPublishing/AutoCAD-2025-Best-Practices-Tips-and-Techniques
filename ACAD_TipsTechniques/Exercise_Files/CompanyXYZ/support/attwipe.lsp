;; ------------------------------------------------------------------------------
;; AttWipe - © 2005 by Chuck Chauvin
;; Posted at: http://www.theswamp.org/index.php?topic=4934.0;all
;; Clears (wipes) the value of a selected attribute
;; ------------------------------------------------------------------------------
(defun C:AttWipe (/ AttSel AttLoc)
  
  (defun *error* (msg)
    (princ "\nInvalid selection.")
    (princ)
  );_ end defun *error*

  (defun SelectIt (msg)
  (setq AttLoc (cadr (setq AttSel (entsel (strcat "\nPick " msg " to wipe: ")))))
    );_ end defun SelectIt

  (defun WipeIt (/)
    (command "-attedit" "y" "" "" "" AttLoc "" "v" "r" "" "n")
    );_ end defun WipeIt

  (setvar "cmdecho" 0)
  
  (SelectIt "attribute")
  (WipeIt)
  (while AttSel
    (SelectIt "next attribute")
    (if	(= (type AttSel) 'list)
      (WipeIt)
      (setq AttSel nil)
      ) ;_ end if
    ) ;_ end while
  (princ)
  );_ end defun AttWipe
;; ------------------------------------------------------------------------------
