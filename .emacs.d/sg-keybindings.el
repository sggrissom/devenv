;; sg-keybindings.el
;; customize key commands

;;prevent the dumb C-x C-b buffer list opening in a new window and
;;instead open it in the same window
(global-set-key "\C-x\C-b" 'buffer-menu)

;;unset C-x f because why would I care to set the width of whatever?
(global-unset-key "\C-xf")
(global-unset-key "\C-c\C-b")

;; run compilation file
;; meta m
(define-key global-map "\em" 'make-without-asking)

;; open/create file 
;; meta f, meta shift f
(define-key global-map "\ef" 'find-file)
(define-key global-map "\eF" 'find-file-other-window)

;; switch to file
;; meta b, meta shift b
(global-set-key (read-kbd-macro "\eb")  'ido-switch-buffer)
(global-set-key (read-kbd-macro "\eB")  'ido-switch-buffer-other-window)

;; switch to other window
;; meta w
(define-key global-map "\ew" 'other-window)

(define-key global-map "\eW" 'buf-swap)

;; save
;; meta s
(define-key global-map "\es" 'save-buffer)
