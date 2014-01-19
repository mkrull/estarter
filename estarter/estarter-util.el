;;; estarter-util.el --- utility functions

(defun estarter-maybe-shell-command (command parameters)
  "run a command or inform that it is missing"
  (if (executable-find command)
      (shell-command (concat command " " parameters))
    (message (concat "please install " command))))

(defun estarter-ensure-dir (dir)
  "ensure that a directory exists"
  (unless (file-exists-p dir)
    (make-directory dir)))

(defun estarter-ensure-and-load-dir (name)
  (setq-local estarter-basename (file-name-sans-extension name))
  (estarter-ensure-dir estarter-basename)
  (add-to-list 'load-path estarter-basename))

(provide 'estarter-util)

;;; estarter-util.el --- end
