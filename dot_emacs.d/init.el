;;; init.el --- My central Emacs config

;;; Commentary:
;; This is the init.el used to configure my Emacs

;;; Code:
;; Load straight.el and use-package
(defvar bootstrap-version)
(defvar straight-check-for-modifications '(check-on-save))
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(require 'straight)
(straight-use-package 'use-package)

;; This is so flycheck can understand the use-package macro
(require 'use-package)

;; A nice hack for faster garbage collection
(use-package gcmh
  :straight t
  :init
  (gcmh-mode 1))

;; Emacs Start Up Profiler
(use-package esup
  :straight t
  :ensure t)

;; Stash custom variables in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Configure backups
(let ((cf-backup-dir (concat user-emacs-directory "backups")))
  (setq backup-directory-alist `(("." . ,cf-backup-dir))
	backup-by-copying t
	version-control t
	delete-old-versions t
	kept-new-versions 5
	kept-old-versions 2)
  (if (not (file-exists-p cf-backup-dir))
      (make-directory cf-backup-dir)))

;; Follow links be default
(setq vc-follow-symlinks t)

;; Load the rest of the config
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'cf-env)
(require 'cf-ui)
(require 'cf-git)
(require 'cf-project)
(require 'cf-completion)
(require 'cf-org)
(require 'cf-code)
(require 'cf-lsp)
(require 'cf-lang)

(provide 'init)
;;; init.el ends here
