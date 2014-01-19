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

(unless (file-exists-p estarter-save)
  (make-directory estarter-save))
(unless (file-exists-p estarter-backup)
  (make-directory estarter-backup))

(setq backup-directory-alist
  `((".*" . ,estarter-backup)))

(add-to-list 'load-path estarter-lib)

(require 'estarter-packages)
(require 'estarter-frame)
(require 'estarter-prog)
(require 'estarter-evil)
(require 'estarter-ido)

;;; init.el --- end
