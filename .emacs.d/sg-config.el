;; sg-config.el
;; general emacs configuration

;; determine the operating system

(defvar steven-mac (eq system-type 'darwin))
(defvar steven-linux (featurep 'x))
(defvar steven-win32 (not (or steven-mac steven-linux)))

(when steven-win32 
  (defvar steven-makescript "build.bat")
  )

(when steven-mac 
  (cua-mode 0) 
  (defvar mac-command-modifier 'meta)
  (defvar x-select-enable-clipboard t)
  (defvar aquamacs-save-options-on-quit 0)
  (defvar special-display-regexps nil)
  (defvar special-display-buffer-names nil)
  (define-key function-key-map [return] [13])
  (defvar mac-command-key-is-meta t)
  (scroll-bar-mode nil)
  (defvar mac-pass-command-to-system nil)
  (defvar steven-makescript "./build.macosx")
  )

(when steven-linux
  (defvar steven-makescript "./build.linux")
  )

;;turn on super useful IDO mode.
;;it makes changing buffers and finding files and stuff way awesome
(ido-mode 1)
(defvar ido-enable-flex-matching t)
(defvar ido-everywhere t)
(defvar ido-create-new-buffer 'always)

(setq backup-directory-alist `(("." . "~/.saves")))

(load-library "view")
(require 'cc-mode)
(require 'ido)
(require 'compile)

(defvar compilation-directory-locked nil)
(defvar compilation-context-lines 0)
(defvar compilation-error-regexp-alist
  (cons '("^\\([0-9]+>\\)?\\(\\(?:[a-zA-Z]:\\)?[^:(\t\n]+\\)(\\([0-9]+\\)) : \\(?:fatal error\\|warnin\\(g\\)\\) C[0-9]+:" 2 3 nil (4))
	compilation-error-regexp-alist))

(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

;; Handle super-tabbify (TAB completes, shift-TAB actually tabs)
(setq dabbrev-case-replace t)
(setq dabbrev-case-fold-search t)
(setq dabbrev-upcase-means-case-search t)

(abbrev-mode 1)

(setq scroll-conservatively 10)
(setq scroll-margin 7)

(setq visible-bell 1)

(add-hook 'window-setup-hook '(lambda()
				(interactive)
				(toggle-frame-maximized)
				))
