;;; init.el --- Emacs config

;;; Commentary:
;;; Jordon Smith's Emacs config, you probably shouldn't use this

;;; Code:

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)

(require 'tabbar)
(tabbar-mode t)

(require 'cl)
(require 'tabbar-ruler)
(setq tabbar-ruler-global-tabbar t)

(require 'projectile)
(projectile-global-mode)

(require 'elixir-mode)


(add-hook 'after-init-hook #'global-flycheck-mode)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(windmove-default-keybindings)

(load-theme 'monokai t)

(delete-selection-mode 1) ; text insert replace selection
(show-paren-mode 1) ; highlight matching paren
(column-number-mode 1) ; display col next to linum
(electric-pair-mode 1) ; auto close paren
(global-linum-mode 1)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq vc-follow-symlinks t)
(setq show-trailing-whitespace t)
(setq linum-format 'dynamic)
(setq require-final-newline t)
(setq visible-bell t)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq-default indent-tabs-mode nil)

(when (window-system)
  (set-face-attribute 'default nil :font "Source Code Pro")
  (set-frame-font "Source Code Pro" nil t))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; init.el ends here
