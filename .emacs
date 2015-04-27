; my .emacs file -Steven Grissom

(load "~/.emacs.d/sg-loadpackages.el")

(add-hook 'after-init-hook '(lambda ()
			      (load "~/.emacs.d/sg-config.el")
			      (load "~/.emacs.d/sg-functions.el")
			      (load "~/.emacs.d/sg-appearance.el")
			      (load "~/.emacs.d/sg-keybindings.el")
			      (load "~/.emacs.d/sg-cmode.el")
			      ))

(add-hook 'window-setup-hook '(lambda ()
				(interactive)
				(maximize-frame)
				))
