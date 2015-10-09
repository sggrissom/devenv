;; sg-keybindings.el
;; customize key commands

(defvar steven-keys-minor-mode-map (make-keymap) "steven-keys-minor-mode keymap.")

;; view function current keybining or vice versa
(define-key steven-keys-minor-mode-map (kbd "C-?") 'describe-key)
(define-key steven-keys-minor-mode-map (kbd "M-?") 'describe-function)

(define-key steven-keys-minor-mode-map (kbd "C-h") 'backward-char)
(define-key steven-keys-minor-mode-map (kbd "C-l") 'forward-char)
(define-key steven-keys-minor-mode-map (kbd "M-h") 'backward-word)
(define-key steven-keys-minor-mode-map (kbd "M-l") 'forward-word)

(define-key steven-keys-minor-mode-map (kbd "C-j") 'next-line)
(define-key steven-keys-minor-mode-map (kbd "C-k") 'previous-line)
(define-key steven-keys-minor-mode-map (kbd "M-j") 'forward-paragraph)
(define-key steven-keys-minor-mode-map (kbd "M-k") 'backward-paragraph)

(define-key steven-keys-minor-mode-map (kbd "C-n") 'move-beginning-of-line)
(define-key steven-keys-minor-mode-map (kbd "C-p") 'move-end-of-line)
(global-unset-key (kbd "M-n"))
(global-unset-key (kbd "M-p"))

(define-key steven-keys-minor-mode-map (kbd "C-o") 'vi-open-line-below)
(define-key steven-keys-minor-mode-map (kbd "M-d") 'kill-current-line)

(define-key steven-keys-minor-mode-map (kbd "M-m") 'make-without-asking)
(define-key steven-keys-minor-mode-map (kbd "M-M") 'run-without-asking)

(define-key steven-keys-minor-mode-map (kbd "M-f") 'find-file)
(define-key steven-keys-minor-mode-map (kbd "M-F") 'find-file-other-window)

(define-key steven-keys-minor-mode-map (kbd "M-b")  'ido-switch-buffer)
(define-key steven-keys-minor-mode-map (kbd "M-B")  'ido-switch-buffer-other-window)

(define-key steven-keys-minor-mode-map (kbd "M-w") 'other-window)
(define-key steven-keys-minor-mode-map (kbd "M-W") 'transpose-windows)

(define-key steven-keys-minor-mode-map (kbd "M-s") 'save-buffer)

(define-key steven-keys-minor-mode-map (kbd "M-c") 'find-corresponding-file)
(define-key steven-keys-minor-mode-map (kbd "M-C") 'find-corresponding-file-other-window)


(define-key steven-keys-minor-mode-map "\t" 'dabbrev-expand)
(define-key steven-keys-minor-mode-map [S-tab] 'indent-for-tab-command)
(define-key steven-keys-minor-mode-map [C-tab] 'indent-region)

(define-key steven-keys-minor-mode-map "\eq" 'append-as-kill)
(define-key steven-keys-minor-mode-map "\ea" 'yank)


(define-minor-mode steven-keys-minor-mode
  "A minor mode that contains my keybindings."
  t " steven-keys" 'steven-keys-minor-mode-map)

(steven-keys-minor-mode 1)
