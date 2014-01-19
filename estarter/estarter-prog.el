;;; estarter-prog.el --- prog mode configuration
;;;
;;; Code:

(defun estarter-font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations."
  (font-lock-add-keywords
   nil '(("\\<\\(\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):\\)"
          1 font-lock-warning-face t))))

(defun estarter-prog-mode-config ()
  "Hook for prog mode"
  (require 'guru-mode)
  (guru-mode +1)
  ;; auto complete
  (require 'auto-complete-config)
  (ac-config-default)
  ;; rainbow delimiters
  (require 'rainbow-delimiters)
  (rainbow-delimiters-mode)
  (estarter-font-lock-comment-annotations)
  (require 'yasnippet-bundle)
  (smartparens-mode))

(setq estarter-prog-mode-hook 'estarter-prog-mode-config)
(add-hook 'prog-mode-hook (lambda()
                            (run-hooks 'estarter-prog-mode-hook)))
(add-hook 'prog-mode-hook 'flycheck-mode)

;; remove doc checks on elisp files
(eval-after-load
    'flycheck '(setq flycheck-checkers
                     (delq 'emacs-lisp-checkdoc flycheck-checkers)))

(provide 'estarter-prog)

;;; estarter-prog.el --- end
