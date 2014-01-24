;; estarter-mod-go.el --- golang specific config

(estarter-install-package 'go-mode)
(estarter-ensure-and-load-dir load-file-name)

(require 'go-autocomplete)
(require 'auto-complete-config)

(provide 'estarter-mod-go)
;; estarter-mod-go.el --- end
