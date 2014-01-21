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
(defvar estarter-save (expand-file-name ".save" estarter-root)
  "Estarter save directory")
(defvar estarter-backup (expand-file-name ".backup" estarter-root)
  "Estarter save directory")
(defvar estarter-modules (expand-file-name "modules" estarter-root)
  "Estarter module directory")

(setq custom-file (expand-file-name "custom.el" estarter-root))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'dired-x)
(require 'tramp)

;; load internal config
(add-to-list 'load-path estarter-lib)
(require 'estarter-packages)
(require 'estarter-frame)
(require 'estarter-prog)
(require 'estarter-ido)

(estarter-ensure-dir estarter-save)
(estarter-ensure-dir estarter-backup)

;; load modules
(estarter-ensure-and-load-dir estarter-modules)
(require 'estarter-mod-go)
(require 'estarter-mod-evil)
(require 'estarter-mod-perl)
(require 'estarter-mod-autoinstall)

(setq backup-directory-alist
  `((".*" . ,estarter-backup)))
(setq auto-save-file-name-transforms
  `((".*" ,estarter-save t)))
(setq auto-save-list-file-prefix estarter-save)

(defun estarter-flycheck-emacs-lisp-hook ()
  (setq flycheck-emacs-lisp-load-path load-path))

(add-hook 'emacs-lisp-mode-hook #'estarter-flycheck-emacs-lisp-hook)

;;; init.el --- end
