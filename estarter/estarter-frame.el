;;; estarter-frame.el --- setting visuals and basic behaviour
;;;

(require 'estarter-util)

;; disable toolbar and menubar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; keep calm and don't blink
(blink-cursor-mode -1)

;; disable startup screen
(setq inhibit-startup-screen t)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable line numbers
(global-linum-mode t)
(setq linum-format "%3d\u2502")

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
  '(flycheck-error ((t (:underline "Red1"))))
  '(flycheck-info ((t (:underline "ForestGreen"))))
  '(flycheck-warning ((t (:underline "DarkOrange"))))))

;; display time in the modeline for fullscreen convenience
(setq display-time-string-forms
      '((propertize (concat " " 24-hours ":" minutes " ")
                    'face 'bold)))
(display-time-mode 1)

(cond 
 ((find-font (font-spec :name "Source Code Pro"))
  (set-frame-font "Source Code Pro-10"))
 ((find-font (font-spec :name "Terminus"))
  (set-default-font "Terminus-12"))
 ((find-font (font-spec :name "DejaVu Sans Mono"))
  (set-frame-font "DejaVu Sans Mono-12"))
 ((find-font (font-spec :name "inconsolata"))
  (set-frame-font "inconsolata-12"))
 ((find-font (font-spec :name "Lucida Console"))
  (set-frame-font "Lucida Console-12"))
 ((find-font (font-spec :name "courier"))
  (set-frame-font "courier-12")))

;; full screen
(defun switch-full-screen ()
  (interactive)
  (cond
   ((string-equal system-type "windows-nt")
    (w32-send-sys-command 61488))
   ((string-equal system-type "linux")
    (estarter-maybe-shell-command "wmctrl" "-r :ACTIVE: -btoggle,fullscreen"))
   ((string-equal system-type "darwin")
    (message "Not implemented for MacOS at the moment"))
   (t (message "Unknown system type"))))

(global-set-key [f11] 'switch-full-screen)

;; nice scrolling
(setq scroll-margin 10
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(provide 'estarter-frame)

;;; estarter-frame.el --- end
