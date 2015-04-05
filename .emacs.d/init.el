(require 'package)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; List of used packages
(setq package-list '(linum-relative fill-column-indicator
                          projectile helm helm-projectile yasnippet
                          key-chord neotree elixir-mode alchemist
                          web-mode git-gutter))

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

;; No backup-files, autosave
(setq make-backup-files nil)
(setq auto-save-default nil)

;; NeoTree
(require 'neotree)

;; Helm
(require 'helm-config)
(helm-mode 1)

(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(global-set-key (kbd "M-x") 'helm-M-x)

(unless (boundp 'completion-in-region-function)
  (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
  (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))

;; Projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; Git
(global-git-gutter-mode 1)

;; Snippets
(require 'yasnippet)
(yas-global-mode 1)

;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
