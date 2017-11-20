;; my-loadpackages.el
;; loading package
(load "~/.emacs.d/sg-packages.el")
(load "~/.emacs.d/php-beautifier.el")

(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(evil-mode 1)
(add-to-list 'evil-emacs-state-modes 'svn-status-mode)

(projectile-global-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)

(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)

(add-hook 'after-init-hook 'global-company-mode)

(yas-global-mode 1)

;(add-hook 'php-mode-hook
;            '(lambda ()
;               (require 'ac-php)
;               (setq ac-sources  '(ac-source-php ) )
;
;               (ac-php-core-eldoc-setup ) ;; enable eldoc
;               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
;               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
;               ))


(provide 'sg-loadpackages.el)
;;; sg-loadpackages.el ends here
