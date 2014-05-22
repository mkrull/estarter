;;; estarter-mod-haskell.el


(estarter-install-packages '(haskell-mode))

(eval-after-load 'haskell-mode
  '(progn
     (defun estarter-haskell-mode-defaults ()
       (subword-mode +1)
       (turn-on-haskell-doc-mode)
       (turn-on-haskell-indentation)
       (eval-after-load "haskell-mode"
         '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

       (eval-after-load "haskell-cabal"
         '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile)))

     (setq estarter-haskell-mode-hook 'estarter-haskell-mode-defaults)
     (add-hook 'haskell-mode-hook (lambda ()
                                    (run-hooks 'estarter-haskell-mode-hook)))))

(provide 'estarter-mod-haskell)

;;; estarter-mod-haskell.el --- end
