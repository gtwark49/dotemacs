;;; nav.el --- Navigation and file formatting

(require 'company-emoji)
  (add-to-list 'company-backends 'company-emoji)
(require 'ido-vertical-mode)
(require 'rbenv)
(require 'smartparens-config)
(require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (setq web-mode-enable-auto-pairing -1)


(exec-path-from-shell-initialize)
(winner-mode 1)

(setq rbenv-modeline-function 'rbenv--modeline-plain)
  (global-rbenv-mode)

(add-hook 'after-init-hook  'global-company-mode)
;(add-hook 'before-save-hook 'delete-trailing-whitespace)

(ido-mode 1)
  (ido-vertical-mode 1)
    (setq ido-vertical-define-keys 'C-n-and-C-p-only)
(smex-initialize)
  (defadvice smex (around space-inserts-hyphen activate compile)
    (let ((ido-cannot-complete-command
           `(lambda ()
              (interactive)
              (if (string= " " (this-command-keys))
                  (insert ?-)
                (funcall ,ido-cannot-complete-command)))))
      ad-do-it))

(global-page-break-lines-mode)
(projectile-global-mode)
(smartparens-global-mode 1)

(setq-default indent-tab-mode             nil)
(setq-default indent-tabs-mode             -1)
(setq-default tab-width                     2)
(setq         c-basic-offset                4)
(setq         css-indent-offset             2)
(setq         web-mode-markup-indent-offset 2)

(setq mouse-wheel-scroll-amount (quote (0.01)))

(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)

(defun my-find-file-as-root ()
  "Like `ido-find-file, but automatically edits the file with root privileges if the file is not writable by the user."
  (interactive)
  (let ((file (ido-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file)))

(defun my-untabify-everything ()
  (untabify (point-min) (point-max))
  (message "All tabs are now spaces."))

(defun eshell-clear-buffer ()
  "Clear terminal."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))
(add-hook 'eshell-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-l") 'eshell-clear-buffer)))

;; Save all tempfiles in $TMPDIR/emacs$UID/
(defconst emacs-tmp-dir (format "%s%s%s/" temporary-file-directory "emacs" (user-uid)))
  (setq backup-directory-alist
        `((".*" . ,emacs-tmp-dir)))
  (setq auto-save-file-name-transforms
        `((".*" ,emacs-tmp-dir t)))
  (setq auto-save-list-file-prefix
        emacs-tmp-dir)
