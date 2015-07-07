;;; estarter-packages.el
;;;
;;; Code:

(require 'cl)
(require 'package)

;; add marmalade and melpa repositories
(add-to-list 'package-archives 
             '("marmalade" .
               "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives 
               '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defvar estarter-package-list
  '( rainbow-delimiters
     flycheck
     guru-mode
     elisp-cache
     solarized-theme
     auto-complete
     magit
     gitignore-mode
     gitconfig
     flx-ido
     ido-ubiquitous
     smex
     ido-vertical-mode
     diminish
     yasnippet
     yasnippet-bundle
     smartparens
     )
  "List of automatically installed packages")

(defun estarter-check-installed-packages ()
  "Check if all packages are installed"
  (every #'package-installed-p estarter-package-list))

(defun estarter-install-package (package)
  "Install PACKAGE if not already installed"
  (unless (memq package estarter-package-list)
    (add-to-list 'estarter-package-list package))
  (unless (package-installed-p package)
    (package-install package)))

(defun estarter-install-packages (packages)
  "Install PACKAGES if not already installed"
  (mapc #'estarter-install-package packages))

(defun estarter-run-package-installer ()
  "Install all packages in `estarter-package-list'"
  (unless (estarter-check-installed-packages)
    (message "%s" "Estarter is refreshing the package database")
    (package-refresh-contents)
    (message "%s" "done.")
    
    (estarter-install-packages estarter-package-list)))

;; run package installation
(estarter-run-package-installer)

(provide 'estarter-packages)

;;; estarter-packages.el --- end
