; my .emacs file -Steven Grissom


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq ad-redefinition-action 'accept)
(package-initialize)

(load "~/devenv/.emacs.d/sg-loadpackages.el")

(add-hook 'after-init-hook '(lambda ()
			      (load "~/devenv/.emacs.d/sg-config.el")
			      (load "~/devenv/.emacs.d/sg-appearance.el")
			      (load "~/devenv/.emacs.d/sg-functions.el")
			      (load "~/devenv/.emacs.d/sg-keybindings.el")
			      ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (projectile web-mode smex powershell php-mode js2-mode go-mode evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
