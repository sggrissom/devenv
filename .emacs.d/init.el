; my .emacs file -Steven Grissom

(load "~/devenv/.emacs.d/sg-loadpackages.el")

(add-hook 'after-init-hook '(lambda ()
			      (load "~/devenv/.emacs.d/sg-config.el")
			      (load "~/devenv/.emacs.d/sg-functions.el")
			      (load "~/devenv/.emacs.d/sg-appearance.el")
			      (load "~/devenv/.emacs.d/sg-keybindings.el")
			      (load "~/devenv/.emacs.d/sg-cmode.el")
			      ))

(add-hook 'window-setup-hook '(lambda ()
				(interactive)
				(maximize-frame)
				))

(defvar comint-mode-map)
(add-hook 'comint-mode-hook (lambda () (define-key comint-mode-map "\t" 'self-insert-command)))
