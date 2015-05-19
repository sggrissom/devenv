;; my-loadpackages.el
;; loading package
(load "~/.emacs.d/sg-packages.el")

(require 'evil)
(evil-mode 1)

(require 'smex)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(evilnc-default-hotkeys)

(global-aggressive-indent-mode 1)
(add-to-list (defvar aggressive-indent-dont-indent-if)
	     '(and (derived-mode-p 'c++-mode)
		   (null (string-match "\\([;;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
				       (thing-at-point 'line)))))

(add-hook 'after-init-hook 'global-company-mode)
(defvar company-global-modes '(not eshell-mode))

(yas-global-mode 1)
