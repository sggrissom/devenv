;; my-loadpackages.el
;; loading package
(load "~/.emacs.d/sg-packages.el")

(require 'evil)
(evil-mode 1)

(require 'smex)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; not smex M-x
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(evilnc-default-hotkeys)

(global-aggressive-indent-mode 1)
(add-to-list (defvar aggressive-indent-dont-indent-if)
	     '(and (derived-mode-p 'c++-mode)
		   (null (string-match "\\([;;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
				       (thing-at-point 'line)))))

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'after-init-hook (lambda () (defvar flycheck-disabled-checkers '(emacs-lisp-checkdoc))
			     ))

(global-set-key "\eg" 'magit-status)
