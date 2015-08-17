;; my-loadpackages.el
;; loading package
(load "~/.emacs.d/sg-packages.el")

(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
