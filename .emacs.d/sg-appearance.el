;; sg-appearance.el
;; make emacs prettyful

;;turn off ugly menu stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;setup colorful keywords
(set-foreground-color "springgreen1")
(set-background-color "gray10")
(set-cursor-color "cyan1")
;;(add-to-list 'default-frame-alist '(font . "Liberation Mono-11.5"))
;;(set-face-attribute 'default t :font "Liberation Mono-11.5")
(set-face-attribute 'font-lock-builtin-face nil :foreground "turquoise")
(set-face-attribute 'font-lock-comment-face nil :foreground "gray60")
(set-face-attribute 'font-lock-constant-face nil :foreground "mediumpurple1")
(set-face-attribute 'font-lock-doc-face nil :foreground "gray60")
(set-face-attribute 'font-lock-function-name-face nil :foreground "palegreen1")
(set-face-attribute 'font-lock-keyword-face nil :foreground "cyan1")
(set-face-attribute 'font-lock-string-face nil :foreground "mediumpurple1")
(set-face-attribute 'font-lock-type-face nil :foreground "turquoise")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "turquoise")

;; make TODOs and NOTEs stand out
(defvar fixme-modes '(c++-mode c-mode emacs-lisp-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-note-face)
(mapc (lambda (mode)
	(font-lock-add-keywords
	 mode
	 '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
	   ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
      fixme-modes)
(modify-face 'font-lock-fixme-face "firebrick" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "mint cream" nil nil t nil t nil nil)

;;highlight whole line where cursor is and make it colored
(global-hl-line-mode 1)
(set-face-background 'hl-line "gray20")

;;turn on line numbers everywhere
(global-linum-mode 1)

;;no more jarring, jumping scroll. GAH!
(setq scroll-step 3)

;;clock
(display-time)

;; Startup windowing
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(split-window-horizontally)

;; change mode-line color by evil state
     (add-hook 'post-command-hook
       (lambda ()
         (let ((color (cond ((minibufferp) '("grey20" . nil))
                            ((evil-insert-state-p) '("mediumpurple1" . "white"))
                            ((evil-emacs-state-p)  '("grey20" . nil))
                            ((buffer-modified-p)   '("snow2" . "black"))
                            (t '("grey20" . nil)))))
           (set-face-background 'hl-line (car color))
           (set-face-foreground 'hl-line (cdr color))
           (set-face-background 'mode-line (car color))
           (set-face-foreground 'mode-line (cdr color)))))

(provide 'sg-appearance)
;;; sg-appearance.el ends here
