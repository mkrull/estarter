;;; init.el --- main configuration entry point
;;;
;;; Code:

(message "Emacstarter booting..")

(when (version< emacs-version "24.1")
  (error "Emacstarter requires GNU Emacs 24.1 or greater"))

(defvar estarter-root (file-name-directory load-file-name)
  "Estarter root directory")
(defvar estarter-lib (expand-file-name "estarter" estarter-root)
  "Estarter lib directory")
(defvar estarter-save (expand-file-name "save" estarter-root)
  "Estarter save directory")
(defvar estarter-backup (expand-file-name "backup" estarter-root)
  "Estarter save directory")
(defvar estarter-personal (expand-file-name "personal" estarter-root)
  "Estarter personal directory")

(unless (file-exists-p estarter-save)
  (make-directory estarter-save))
(unless (file-exists-p estarter-backup)
  (make-directory estarter-backup))
(unless (file-exists-p estarter-personal)
  (make-directory estarter-personal))

(setq backup-directory-alist
  `((".*" . ,estarter-backup)))
(setq auto-save-file-name-transforms
  `((".*" ,estarter-backup t)))
(setq auto-save-list-file-prefix estarter-backup)

(add-to-list 'load-path estarter-lib)
(add-to-list 'load-path estarter-personal)

(require 'estarter-packages)
(require 'estarter-frame)
(require 'estarter-prog)
(require 'estarter-evil)
(require 'estarter-ido)

;; TODO refactor in module
(require 'go-autocomplete)
(require 'auto-complete-config)

;;; init.el --- end
