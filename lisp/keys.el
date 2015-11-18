;;; keys.el --- Personal keybindings

(require 'expand-region)
(require 'multiple-cursors)
(require 'neotree)


(global-unset-key (kbd "M-<down-mouse-1>"))

(global-set-key   (kbd "C-=")         'er/expand-region)
(global-set-key   (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key   (kbd "C-c g")       'magit-status)
(global-set-key   (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key   (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key   (kbd "C-x F")       'my-find-file-as-root)
(global-set-key   (kbd "C-c U")       (lambda () (interactive) (my-untabify-everything)))
(global-set-key   [f8]                'neotree-toggle)
(global-set-key   (kbd "C-c r")       'revert-buffer)
(global-set-key   (kbd "M-x")         'smex)
(global-set-key   (kbd "M-X")         'smex-major-mode-commands)
