;;; estarter-mod-clojure.el

(estarter-install-packages '(clojure-mode clojure-test-mode cider))

(eval-after-load 'clojure-mode
  '(progn
     (defun estarter-clojure-mode-defaults ()
       (subword-mode +1)
       (clojure-test-mode +1)
       (run-hooks 'estarter-lisp-coding-hook))

     (setq estarter-clojure-mode-hook 'estarter-clojure-mode-defaults)

     (add-hook 'clojure-mode-hook (lambda ()
                                    (run-hooks 'estarter-clojure-mode-hook)))))

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(eval-after-load 'cider
  '(progn
     (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

     (defun estarter-cider-repl-mode-defaults ()
       (subword-mode +1)
       (remove-dos-eol))

     (setq estarter-cider-repl-mode-hook 'estarter-cider-repl-mode-defaults)

     (add-hook 'cider-repl-mode-hook (lambda ()
                                       (run-hooks 'estarter-cider-repl-mode-hook)))))

(provide 'estarter-mod-clojure)

;;; estarter-mod-clojure.el --- end
