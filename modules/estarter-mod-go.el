;; estarter-mod-go.el --- golang specific config

(defvar estarter-mod-go-dir (file-name-sans-extension load-file-name))
(estarter-ensure-dir estarter-mod-go-dir)
(add-to-list 'load-path estarter-mod-go-dir)

(require 'go-autocomplete)
(require 'auto-complete-config)

(provide 'estarter-mod-go)
;; estarter-mod-go.el --- end
