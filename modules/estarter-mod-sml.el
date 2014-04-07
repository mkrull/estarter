;;; estarter-mod-sml.el


(defun estarter-sml()
  (estarter-install-package 'smart-mode-line)
  (setq sml/theme 'respectful)
  (require 'smart-mode-line)
  (sml/setup))

(estarter-sml)

(provide 'estarter-mod-sml)

;;; estarter-mod-sml.el --- end
