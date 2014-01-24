;;; estarter-mod-autoinstall.el --- autoinstall packages

(setq-local packages '(
		       nginx-mode
		       ))

(estarter-install-packages packages)

(provide 'estarter-mod-autoinstall)

;;; estarter-mod-autoinstall.el --- end
