;;; estarter-mod-org.el

(estarter-install-packages '(org org-ac))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(eval-after-load 'org-mode
  '(progn
     (defun estarter-org-mode-defaults()
       (setq org-directory "~/org")
       (setq org-default-notes-file "~/org/notes/refile.org")
       (global-set-key "\C-cl" 'org-store-link)
       (global-set-key "\C-cc" 'org-capture)
       (global-set-key "\C-ca" 'org-agenda)
       (global-set-key "\C-cb" 'org-iswitchb)
       (setq org-hide-leading-stars t)
       (setq org-log-done 'time)
       (setq org-log-done 'note))

     (setq estarter-org-mode-hook 'estarter-org-mode-defaults)
     (add-hook 'org-mode-hook (lambda ()
                                (run-hooks 'estarter-org-mode-hook)))))

(provide 'estarter-mod-org)

;;; estarter-mod-org.el --- end
