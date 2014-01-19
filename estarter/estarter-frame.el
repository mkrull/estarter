;;; estarter-frame.el --- setting visuals and basic behaviour
;;;

;; disable toolbar and menubar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

;; keep calm and don't blink
(blink-cursor-mode -1)

;; disable startup screen
(setq inhibit-startup-screen t)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " Estarter - " (:eval (if (buffer-file-name)
                                            (abbreviate-file-name (buffer-file-name))
                                          "%b"))))

;; solarized
(load-theme 'solarized-dark t)

;; enable line numbers
(global-linum-mode t)
(setq linum-format "%3d\u2502")

;; flymake indicators
;; each integer represents a row of pixels
;; the bits represent the pixel in a row
;;
;; 0 0 0 0 0 0 0 0 0
;; 0 0 0 0 0 0 0 0 0
;; 0 0 0 0 0 0 0 0 0
;; 1 1 1 1 1 1 1 1 1
;; 1 1 1 1 1 1 1 1 1
;; 0 0 0 0 0 0 0 0 0
;; 0 0 0 0 0 0 0 0 0
;; 0 0 0 0 0 0 0 0 0
;;
;; is a horizontal bar
(define-fringe-bitmap 'flycheck-fringe-exclamation-mark
  [192 192 192 192 192 192 192 192] nil nil 'center)
(define-fringe-bitmap 'question-mark
  [0 0 0 192 192 0 0 0] nil nil 'center)

(when (fboundp 'flycheck-mode)
  (custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(flycheck-error ((t (:underline "Red1"))))
  '(flycheck-info ((t (:underline "ForestGreen"))))
  '(flycheck-warning ((t (:underline "DarkOrange"))))))

;; Set Frame width/height
(defun arrange-frame (w h x y)
  "Set the width, height, and x/y position of the current frame"
  (let ((frame (selected-frame)))
    (delete-other-windows)
    (set-frame-position frame x y)
    (set-frame-size frame w h)))

(arrange-frame 165 55 5 5)

;; display time in the modeline for fullscreen convenience
(setq display-time-string-forms
      '((propertize (concat " " 24-hours ":" minutes " ")
                    'face 'bold)))
(display-time-mode 1)

;; set Terminus default font
(set-default-font "Terminus-12")

(provide 'estarter-frame)

;;; estarter-frame.el --- end
