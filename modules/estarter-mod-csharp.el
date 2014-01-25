;;; estarter-mod-csharp.el

(estarter-install-packages '(omnisharp))

(add-hook 'csharp-mode-hook 'omnisharp-mode)

(provide 'estarter-mod-csharp)

;; estarter-mod-csharp.el --- end
