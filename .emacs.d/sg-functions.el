;; sg-functions.el
;; define custom functions

;;leave me alone, compiler
(require 'windmove)
(defvar steven-makescript)
(defvar compilation-directory-locked)
(defvar last-compilation-directory)
(defvar find-project-from-directory)

;; Navigation
(defun previous-blank-line ()
  "Moves to the previous line containing nothing but whitespace."
  (interactive)
  (search-backward-regexp "^[ \t]*\n")
  )

(defun next-blank-line ()
  "Moves to the next line containing nothing but whitespace."
  (interactive)
  (forward-line)
  (search-forward-regexp "^[ \t]*\n")
  (forward-line -1)
  )

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
