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
(defvar estarter-modules (expand-file-name "modules" estarter-root)
  "Estarter module directory")
(defvar estarter-save (expand-file-name ".save" estarter-root)
  "Estarter save directory")

(setq custom-file (expand-file-name "custom.el" estarter-root))
(when (file-exists-p custom-file)
  (load custom-file))

;; load internal config
(add-to-list 'load-path estarter-lib)
(require 'estarter-packages)
(require 'estarter-frame)
(require 'estarter-prog)
(require 'estarter-ido)
(require 'estarter-editor)

(estarter-ensure-dir estarter-save)

;; load modules
(estarter-ensure-and-load-dir estarter-modules)
(require 'estarter-mod-autoinstall)
(require 'estarter-mod-go)
(require 'estarter-mod-evil)
(require 'estarter-mod-perl)
(require 'estarter-mod-csharp)
(require 'estarter-mod-haskell)
(require 'estarter-mod-sml)

(defun estarter-flycheck-emacs-lisp-hook ()
  (setq flycheck-emacs-lisp-load-path load-path))

(require 'diminish)
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "guru-mode" '(diminish 'guru-mode))
(eval-after-load "flycheck-mode" '(diminish 'flycheck-mode-mode))

(add-hook 'emacs-lisp-mode-hook #'estarter-flycheck-emacs-lisp-hook)

;;; init.el --- end
