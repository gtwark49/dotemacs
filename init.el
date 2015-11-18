;;; init.el --- The first thing GNU Emacs runs

(run-with-idle-timer
 5 nil
 (lambda ()
   (setq     gc-cons-threshold 1000000)
   (message "gc-cons-threshold restored to %S"
             gc-cons-threshold)))

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path (expand-file-name "/usr/local/Cellar/mu/0.9.15/share/emacs/site-lisp/mu4e"))

(defvar my-load-libs
  '(
    "my-packages"
    "big_text"
    "ui"
    "nav"
    "keys"
  ))

(dolist (p my-load-libs)
  (load-library p))

(autoload 'pianobar "pianobar" nil t)

(when (featurep 'ns)
  (defun ns-raise-emacs ()
    "Raise GNU Emacs."
    (ns-do-applescript "tell application \"Emacs\" to activate"))

  (defun ns-raise-emacs-with-frame (frame)
    "Raise GNU Emacs and select the provided frame."
    (with-selected-frame frame
      (when (display-graphic-p)
        (ns-raise-emacs))))

  (add-hook 'after-make-frame-functions 'ns-raise-emacs-with-frame)

  (when (display-graphic-p)
    (ns-raise-emacs)))

;; (require 'unicode-fonts)
;; (setq unicode-fonts-block-font-mapping
;;      '(("Emoticons"
;;         ("Apple Color Emoji")))
;;      unicode-fonts-fontset-names '("fontset-default"))
;; (setq unicode-fonts-setup-done nil)
;; (unicode-fonts-setup)
