;;; estarter-mod-autoinstall.el --- autoinstall packages

(setq-local packages '(
		       yasnippet-bundle
		       evil-nerd-commenter
		       nginx-mode
		       ))

(estarter-install-packages packages)

(provide 'estarter-mod-autoinstall)

;;; estarter-mod-autoinstall.el --- end
