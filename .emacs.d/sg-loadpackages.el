;; my-loadpackages.el
;; loading package

;;; Code:
(load "~/.emacs.d/sg-packages.el")
(load "~/.emacs.d/php-beautifier.el")

(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(evil-mode 1)
(add-to-list 'evil-emacs-state-modes 'svn-status-mode)

(projectile-global-mode)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq flycheck-phpcs-standard "c:/work/tools/phpcs/ruleset.xml")
(setq flycheck-phpmd-rulesets "c:/work/tools/phpmd/ruleset.xml")

(eval-after-load 'flycheck
  '(setq flycheck-xml-parser 'flycheck-parse-xml-region))

;(flycheck-define-checker phpcs
;  "A"
;  :command ("phpcs" "-s" "" "--report=emacs" source)
;  :error-patterns
;    ((error line-start (file-name) ":" line ":" column ": error - " (message) line-end);
;	 (warning line-start (file-name) ":" line ":" column ": warning - " (message) lin;e-end))
;  :modes php-mode
;  :next-checkers '(php))
  
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

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(dumb-jump-mode)
(setq dumb-jump-force-searcher 'ag)

(provide 'sg-loadpackages.el)
;;; sg-loadpackages.el ends here
