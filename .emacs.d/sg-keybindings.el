;; sg-keybindings.el
;; customize key commands

;; view function current keybining
;; C-h f function-name

;; keybinding current function
;; C-h k key-sequence

;;prevent the dumb C-x C-b buffer list opening in a new window and
;;instead open it in the same window
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;;unset C-x f because why would I care to set the width of whatever?
(global-unset-key (kbd "C-x f"))
(global-unset-key (kbd "C-c C-b"))

;; run compilation file
;; meta m
(global-set-key (kbd "M-m") 'make-without-asking)

;; open/create file 
;; meta f, meta shift f
(global-set-key (kbd "M-f") 'find-file)
(global-set-key (kbd "M-F") 'find-file-other-window)

;; switch to file
;; meta b, meta shift b
(global-set-key (kbd "M-b")  'ido-switch-buffer)
(global-set-key (kbd "M-B")  'ido-switch-buffer-other-window)

;; switch to other window
;; meta w
(global-set-key (kbd "M-w") 'other-window)

(global-set-key (kbd "M-W") 'buf-swap)

;; save
;; meta s
(global-set-key (kbd "M-s") 'save-buffer)

;;movement
(global-set-key (kbd "C-j") 'next-blank-line)
(global-set-key (kbd "C-k") 'previous-blank-line)
