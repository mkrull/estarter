;;; estarter-util.el --- utility functions

;; run a command or inform that it is missing
(defun estarter-maybe-shell-command (command parameters)
  "run a command or inform that it is missing"
  (if (executable-find command)
      (shell-command (concat command " " parameters))
    (message (concat "please install " command))))

(provide 'estarter-util)

;;; estarter-util.el --- end
