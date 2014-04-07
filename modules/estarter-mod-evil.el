;;; estarter-mod-evil.el --- evil-mode config
;;;
;;; Code:


(defun estarter-mod-evil ()
  (estarter-install-packages '(evil evil-nerd-commenter))
  ;; change mode-line color by evil state
  (lexical-let ((default-color (cons (face-background 'mode-line)
  				     (face-foreground 'mode-line))))
    (add-hook 'post-command-hook
              (lambda ()
        	(let ((color (cond ((minibufferp) default-color)
        			   ((evil-insert-state-p) '("#074242" . "#ffffff"))
        			   ((buffer-modified-p) '("#072b42" . "#ffffff"))
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

(defun estarter-evil-omnisharp-hook ()
  (evil-define-key 'insert omnisharp-mode-map
    (kbd "M-.") 'omnisharp-auto-complete)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd "<f12>") 'omnisharp-go-to-definition)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd "g u") 'omnisharp-find-usages)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd "g o") 'omnisharp-go-to-definition)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd "g r") 'omnisharp-run-code-action-refactoring)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd "g R") 'omnisharp-rename)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd ", i") 'omnisharp-current-type-information)
  (evil-define-key 'insert omnisharp-mode-map
    (kbd ".") 'omnisharp-add-dot-and-auto-complete)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd ", n t") 'omnisharp-navigate-to-current-file-member)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd ", n s") 'omnisharp-navigate-to-solution-member)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd ", n f") 'omnisharp-navigate-to-solution-file-then-file-member)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd ", n F") 'omnisharp-navigate-to-solution-file)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd ", n r") 'omnisharp-navigate-to-region)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)
  (evil-define-key 'insert omnisharp-mode-map
    (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)
  (evil-define-key 'normal omnisharp-mode-map
    (kbd ",.") 'omnisharp-show-overloads-at-point)
  ;; Speed up auto-complete on mono drastically. This comes with the
  ;; downside that documentation is impossible to fetch.
  (setq omnisharp-auto-complete-want-documentation nil))

(add-hook 'omnisharp-mode-hook (lambda () (run-hooks 'estarter-evil-omnisharp-hook)) t)

(estarter-mod-evil)

(provide 'estarter-mod-evil)

;;; estarter-mod-evil.el --- end
