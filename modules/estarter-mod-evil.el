;;; estarter-mod-evil.el --- evil-mode config
;;;
;;; Code:

(defun estarter-mod-evil ()
  ;; change mode-line color by evil state
  (lexical-let ((default-color (cons (face-background 'mode-line)
				     (face-foreground 'mode-line))))
    (add-hook 'post-command-hook
	      (lambda ()
		(let ((color (cond ((minibufferp) default-color)
				   ((evil-insert-state-p) '("#e80000" . "#ffffff"))
				   ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
				   ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
				   (t default-color))))
		  (set-face-background 'mode-line (car color))
		  (set-face-foreground 'mode-line (cdr color))))))
  ;; nerd commenter default key bindings
  (evilnc-default-hotkeys)
  (evil-mode 1))

(eval-after-load "evil"
  '(progn
     ;; Navigation in autocomplete menues gets hijacked by evil
     (define-key ac-completing-map (kbd "C-n") 'ac-next)
     (define-key ac-completing-map (kbd "C-p") 'ac-previous)
     ;; Let me stop autocompleting the emacs/evil way
     (define-key ac-completing-map (kbd "C-g") 'ac-stop)
     (define-key ac-completing-map (kbd "ESC") 'evil-normal-state)
     (evil-make-intercept-map ac-completing-map)))

(estarter-mod-evil)

(provide 'estarter-mod-evil)

;;; estarter-mod-evil.el --- end
