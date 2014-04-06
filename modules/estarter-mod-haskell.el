;;; estarter-mod-haskell.el


(estarter-install-packages '(haskell-mode))

(eval-after-load 'haskell-mode
  '(progn
     (defun prelude-haskell-mode-defaults ()
       (subword-mode +1)
       (turn-on-haskell-doc-mode)
       (turn-on-haskell-indentation))

     (setq prelude-haskell-mode-hook 'prelude-haskell-mode-defaults)

     (add-hook 'haskell-mode-hook (lambda ()
                                    (run-hooks 'prelude-haskell-mode-hook)))))

(provide 'estarter-mod-haskell)

;;; estarter-mod-haskell.el --- end

