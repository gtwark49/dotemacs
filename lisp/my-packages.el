;;; my-packages.el --- Checks for/installs desired packages

(require 'cl)
(require 'package)
  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
                           ("gnu"   . "https://elpa.gnu.org/packages/")))
  (package-initialize)


(defvar required-packages
  '(
    bongo
    column-marker
    company
    company-emoji
    csharp-mode
    edit-server
    emojify
    exec-path-from-shell
    expand-region
    fringe-helper
    git-gutter-fringe
    google-maps
    hl-indent
    ido-vertical-mode
    linum-relative
    magit
    matlab-mode
    multiple-cursors
    neotree
    nyan-mode
    pacmacs
    page-break-lines
    projectile
    rainbow-mode
    rbenv
    ruby-guard
    scss-mode
    smartparens
    smex
    unicode-fonts
    w3m
    web-mode
    yasnippet
    zenburn-theme
  ))

(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  (message "%s" "GNU Emacs is now refreshing its package databases...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))
