(require 'package)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; List of used packages
(setq package-list '(evil evil-leader linum-relative fill-column-indicator
                          key-chord neotree elixir-mode alchemist))

;; Update package archive
(unless package-archive-contents
  (package-refresh-contents))

;; Install any missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Relative line number
(require `linum-relative)
(setq linum-relative-format "%2s ")
(setq linum-relative-current-symbol "") ; Current number
(global-linum-mode 1)

;; No tabs
(setq-default indent-tabs-mode nil)

;; Remove file menu
(menu-bar-mode -1)

;; 80-char rule
(require 'fill-column-indicator)
(setq-default fill-column 80)
(fci-mode 1)

;; No #backup-files#
(setq make-backup-files nil)

;; NeoTree
(require 'neotree)

;; ---------------------------------
;; EVIL
;; ---------------------------------
(require 'evil)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-mode t)

;; Escape jk
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

(evil-leader/set-key "d" 'neotree-toggle)
