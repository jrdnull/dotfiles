(require 'package)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; List of used packages
(setq package-list '(evil evil-leader linum-relative fill-column-indicator
                          key-chord neotree elixir-mode alchemist powerline
                          powerline-evil flx-ido js2-mode jsx-mode))

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
(column-number-mode t)

;; No tabs
(setq-default indent-tabs-mode nil)

;; Remove file menu
(menu-bar-mode -1)

;; 80-char rule
(require 'fill-column-indicator)
(setq-default fill-column 80)
(add-hook 'after-change-major-mode-hook 'fci-mode)

;; No #backup-files#
(setq make-backup-files nil)

;; NeoTree
(require 'neotree)

;; ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t) ; Disable ido faces to see flx highlights.
(setq ido-use-faces nil)

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

;; Powerline
(require 'powerline)
(require 'powerline-evil)
(powerline-evil-vim-color-theme)

;; JavaScript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)
