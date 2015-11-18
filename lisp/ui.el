;;; ui.el --- UI/UX related customizations

(require 'column-marker)
(require 'hl-indent)
(require 'linum-relative)


(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

(load-theme 'zenburn t)
  (make-face-italic 'font-lock-comment-face)
  (setq default-frame-alist '((cursor-color . "#FF0000")))

(setq-default show-trailing-whitespace t)

(set-face-attribute 'column-marker-1     nil :background "#000000")
(set-face-attribute 'hl-indent-face      nil :background "#444444")
(set-face-attribute 'region              nil :background "#FFFFFF"
                                             :foreground "#000000")
(set-face-attribute 'trailing-whitespace nil :background "#FFA500")

(global-hl-line-mode    1)
(my-global-rainbow-mode 1)
(nyan-mode              1)
(show-paren-mode        1)

(blink-cursor-mode     -1)
(scroll-bar-mode       -1)
(tool-bar-mode         -1)

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
  (setq auto-mode-list
    (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;(setq emojify-display-style (quote unicode))

(add-hook 'after-init-hook    #'global-emojify-mode)
(add-hook 'emacs-startup-hook (lambda () (toggle-frame-maximized)))
(add-hook 'emacs-startup-hook (lambda () (split-window-right)))
(add-hook 'find-file-hook     (lambda () (interactive) (column-marker-1 81)))
(add-hook 'prog-mode-hook     'hl-indent-mode)

(setq ring-bell-function 'ignore)
