;;; init --- This configures emacs
;;; Commentary:
;;; See inline comments
;;; Code:
;; Run emacs server
(server-start)

(package-initialize)

;; Keep custom-* out of main config
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Enable melpa
(require 'package)
(add-to-list 'package-archives (cons "melpa"
				     "https://melpa.org/packages/"))

;; Keep backup files out of my main tree
(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.saves"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (setq vc-handled-backends nil))

;; Make things pretty
(use-package solarized-theme
  :ensure t
  :config
  (setq solarized-use-variable-pitch nil)
  (setq solarized-scale-org-headlines nil)
  (set-frame-font "Knack Nerd Font-10")
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (load-theme 'solarized-dark t))

;; Window change undos
(winner-mode 1)

(use-package smex
  :ensure t)

(use-package smartparens
  :ensure t
  :config (smartparens-global-mode 1))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-on))

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-:") 'avy-goto-char)
  (global-set-key (kbd "C-'") 'avy-goto-char-timer))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-p") 'ace-window))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package rbenv
  :ensure t
  :init (global-rbenv-mode))

(use-package puppet-mode
  :ensure t
  :mode ("\\.pp\\'" . puppet-mode)
  :interpreter ("puppet" . puppet-mode))

(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :interpreter ("go" . go-mode))

(use-package csv-mode
  :ensure t
  :mode ("\\.csv\\'" . csv-mode)
  :interpreter ("csv" . csv-mode))

(use-package yaml-mode
  :ensure t
  :mode ("\\.yaml'" . yaml-mode)
  :interpreter ("yaml" . yaml-mode))
  
(provide 'init)
;;; init.el ends here
