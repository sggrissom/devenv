;; sg-functions.el
;; define custom functions

(defun find-project-directory-recursive ()
  "Recursively search for a makefile."
  (interactive)
  (if (file-exists-p steven-makescript) t
    (cd "../")
    (find-project-directory-recursive)))

(defun lock-compilation-directory ()
  "The compilation process should NOT hunt for a makefile"
  (interactive)
  (setq compilation-directory-locked t)
  (message "Compilation directory is locked."))

(defun unlock-compilation-directory ()
  "The compilation process SHOULD hunt for a makefile"
  (interactive)
  (setq compilation-directory-locked nil)
  (message "Compilation directory is roaming."))

(defun find-project-directory ()
  "Find the project directory."
  (interactive)
  (setq find-project-from-directory default-directory)
  (switch-to-buffer-other-window "*compilation*")
  (if compilation-directory-locked (cd last-compilation-directory)
    (cd find-project-from-directory)
    (find-project-directory-recursive)
    (setq last-compilation-directory default-directory)))

(defun make-without-asking ()
  "Make the current build."
  (interactive)
  (if (find-project-directory) (compile steven-makescript)))

(defun buf-swap ()
  (interactive)
  (let* ((right-win (windmove-find-other-window 'right))
	 (left-win (windmove-find-other-window 'left))
	 (buf-this-buf (window-buffer (selected-window))))
    (if (null right-win)
	(if (null left-win)
	    (error "only one verticle window")
	  (swap buf-this-buf left-win))
      (swap buf-this-buf right-win))))

(defun swap (curBuf otherBuf)
  (set-window-buffer (selected-window) (window-buffer otherBuf))
  (set-window-buffer otherBuf curBuf))

(defun find-corresponding-file ()
  "Find the file that corresponds to this one."
  (interactive)
  (setq CorrespondingFileName nil)
  (setq BaseFileName (file-name-sans-extension buffer-file-name))
  (if (string-match "\\.c" buffer-file-name)
      (setq CorrespondingFileName (concat BaseFileName ".h")))
  (if (string-match "\\.h" buffer-file-name)
      (if (file-exists-p (concat BaseFileName ".c")) (setq CorrespondingFileName (concat BaseFileName ".c"))
	(setq CorrespondingFileName (concat BaseFileName ".cpp"))))
  (if (string-match "\\.cpp" buffer-file-name)
      (setq CorrespondingFileName (concat BaseFileName ".h")))
  (if CorrespondingFileName (find-file CorrespondingFileName)
    (error "Unable to find a corresponding file")))
(defun find-corresponding-file-other-window ()
  "Find the file that corresponds to this one."
  (interactive)
  (find-file-other-window buffer-file-name)
  (find-corresponding-file)
  (other-window -1))

(defun vi-open-line-above ()
  "Insert a newline above the current line and put point at beginning."
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

(defun vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(defun kill-current-line (&optional n)
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (let ((kill-whole-line t))
      (kill-line n))))



(defun steven-header-format ()								 
  "Format the given file as a header file."							 
  (interactive)										 
  (setq BaseFileName (file-name-sans-extension (file-name-nondirectory buffer-file-name)))	 
  (insert "#if !defined(")									 
  (push-mark)										 
  (insert BaseFileName)									 
  (upcase-region (mark) (point))								
  (pop-mark)											
  (insert "_H)\n")										
  (insert "/* ========================================================================\n")	
  (insert "   $File: $\n")									
  (insert "   $Date: $\n")								     
  (insert "   $Revision: $\n")								
  (insert "   $Creator: Steven Grissom $\n")							
  (insert "   ======================================================================== */\n")
  (insert "\n")										
  (insert "#define ")									
  (push-mark)										
  (insert BaseFileName)									 
  (upcase-region (mark) (point))								
  (pop-mark)											 
  (insert "_H\n")										
  (insert "#endif")										
  )											      
												
(defun steven-source-format ()								
  "Format the given file as a source file."							
  (interactive)										 
  (setq BaseFileName (file-name-sans-extension (file-name-nondirectory buffer-file-name)))	 
  (insert "/* ========================================================================\n")	
  (insert "   $File: $\n")									
  (insert "   $Date: $\n")									
  (insert "   $Revision: $\n")								
  (insert "   $Creator: Steven Grissom $\n")							 
  (insert "   ======================================================================== */\n") 
  )
