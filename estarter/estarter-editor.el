;;; estarter-editor.el

(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; automatically save buffers associated with files on buffer switch
;; and on windows switch
(defun estarter-auto-save-command ()
  "Save the current buffer if it is a writable file."
  (when (and buffer-file-name
             (buffer-modified-p (current-buffer))
             (file-writable-p buffer-file-name))
    (save-buffer)))

(defmacro advise-commands (advice-name commands &rest body)
  "Apply advice named ADVICE-NAME to multiple COMMANDS.

The body of the advice is in BODY."
  `(progn
     ,@(mapcar (lambda (command)
                 `(defadvice ,command (before ,(intern (concat (symbol-name command) "-" advice-name)) activate)
                    ,@body))
               commands)))

;; advise all window switching functions
(advise-commands "auto-save"
                 (switch-to-buffer other-window windmove-up windmove-down windmove-left windmove-right)
                 (estarter-auto-save-command))

(add-hook 'mouse-leave-buffer-hook 'estarter-auto-save-command)

;; highlight the current line
(global-hl-line-mode +1)

;; dired - reuse current buffer by pressing 'a'
(put 'dired-find-alternate-file 'disabled nil)

;; always delete and copy recursively
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; if there is a dired buffer displayed in the next window, use its
;; current subdir, instead of the current subdir of this dired buffer
(setq dired-dwim-target t)

(require 'dired-x)
(require 'tramp)
(setq tramp-default-method "ssh")

(provide 'estarter-editor)

;;; estarter-editor.el --- end
