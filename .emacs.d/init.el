(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'tabbar)
(tabbar-mode t)

(require 'cl)
(require 'tabbar-ruler)
(setq tabbar-ruler-global-tabbar t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(load-theme 'spolsky t)

(delete-selection-mode 1) ; text insert replace selection
(show-paren-mode 1) ; highlight matching paren
(column-number-mode 1) ; display col next to linum
(electric-pair-mode 1) ; auto close paren
(global-linum-mode 1)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq vc-follow-symlinks t)
(setq indent-tabs-mode nil)
(setq c-basic-indent 2)
(setq tab-width 4)
(setq show-trailing-whitespace t)
(setq linum-format 'dynamic)

(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))

