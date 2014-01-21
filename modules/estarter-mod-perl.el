;;; estarter-mod-perl.el

(estarter-install-package 'flymake-perlcritic)
(require 'flymake-perlcritic)

(defalias 'perl-mode 'cperl-mode)

(defun estarter-cperl-mode ()
  (setq cperl-indent-level 4)
  (setq cperl-continued-statement-offset 8)
  ;; cperl-hairy affects all those variables, but I prefer
  ;; a more fine-grained approach as far as they are concerned
  (setq cperl-font-lock t)
  (setq cperl-electric-lbrace-space t)
  (setq cperl-electric-parens nil)
  (setq cperl-electric-linefeed nil)
  (setq cperl-electric-keywords nil)
  (setq cperl-info-on-command-no-prompt t)
  (setq cperl-clobber-lisp-bindings t)
  (setq cperl-lazy-help-time 3)
  
  (setq cperl-hairy)
  (set-face-background 'cperl-array-face nil)
  (set-face-background 'cperl-hash-face nil)
  (setq cperl-invalid-face nil))

(setq estarter-cperl-mode-hook 'estarter-cperl-mode)

(add-hook 'cperl-mode-hook (lambda ()
                             (run-hooks 'prelude-cperl-mode-hook)) t)

(provide 'estarter-mod-perl)

;;; eststarter-mod-perl.el --- end
