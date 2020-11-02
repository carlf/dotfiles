;;; init --- My init file

;;; Commentary:
;;; No commentary

;;; Code:
;; Load the server
(server-start)

;; Load straight.el
(defvar bootstrap-version)
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

;; Stash custom variables
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Load dracula theme
(straight-use-package 'dracula-theme)
(load-theme 'dracula t)

;; Clean up the style of emacs
(set-frame-font "FantasqueSansMono-11")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)

;; Use a fancy dashboard
(straight-use-package 'dashboard)
(defvar dashboard-startup-banner)
(setq dashboard-startup-banner 'logo)
(dashboard-setup-startup-hook)

;; Powerline modeline
(straight-use-package 'powerline)
(powerline-default-theme)

;; minimap
(straight-use-package 'minimap)

;; Show whitespace
(straight-use-package 'whitespace)

;; Keep backup files nice and neat
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.saves"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Load magit
(straight-use-package 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; Set up my SSH key
(defun cf/string-trim-final-newline (string)
  "Strip a trailing newline from the passed in STRING."
  (let ((len (length string)))
    (cond
     ((and (> len 0) (eql (aref string (- len 1)) ?\n))
      (substring string 0 (- len 1)))
     (t string))))
(setenv "SSH_AUTH_SOCK" (cf/string-trim-final-newline
                         (shell-command-to-string "/usr/bin/gpgconf --list-dirs agent-ssh-socket")))

;; Use xdg-open
(defun cf/xdg-open-shim (url &optional new-window)
  "Open URL in xdg-open.  The argument NEW-WINDOW is ignored."
  (start-process (concat "xdg-open " url) nil "xdg-open" url))

(setq browse-url-browser-function 'cf/xdg-open-shim)

;; Load smartparens
(straight-use-package 'smartparens)
(require 'smartparens-config)
(show-smartparens-global-mode t)
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smart-parens-strict-mode)

;; Load which-key
(straight-use-package 'which-key)
(which-key-mode)

;; Load undo-tree
(straight-use-package 'undo-tree)
(global-undo-tree-mode)

;; Load avy
(straight-use-package 'avy)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)

;; Load ace-window
(straight-use-package 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-dispatch-always t
	  aw-keys '(?a ?s ?d ?f ?g ?h))

;; Load ivy
(straight-use-package 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; Load swiper
(straight-use-package 'swiper)
(global-set-key (kbd "C-s") 'swiper)

;; Load counsel
(straight-use-package 'counsel)
(counsel-mode 1)

;; Load company-mode
(straight-use-package 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Load projectile
(straight-use-package 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(straight-use-package 'counsel-projectile)
(counsel-projectile-mode)

;; Org Mode
(straight-use-package 'org)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-refile-targets
	  '((org-agenda-files :maxlevel . 2))
	  org-export-with-sub-superscripts nil
	  org-directory "~/Documents/org"
	  org-default-notes-file "~/Documents/org/inbox.org"
	  org-agenda-files '("~/Documents/org")
	  org-log-done 'time
	  org-capture-templates '(("t" "Todo" entry (file "")
							   "* TODO %?\n  CREATED: %T"))
	  org-src-fontify-natively t)
(org-babel-do-load-languages
 'org-babel-load-languages
 (append org-babel-load-languages
		 '((shell . t)
		   (python . t))))

;; Org Roam
(straight-use-package 'org-roam)
(setq org-roam-directory "~/Documents/org-roam"
	  org-roam-db-location "~/Documents/org-roam/org-roam.db")
(global-set-key (kbd "C-c n r") 'org-roam-buffer-toggle-display)
(global-set-key (kbd "C-c n i") 'org-roam-insert)
(global-set-key (kbd "C-c n /") 'org-roam-find-file)
(global-set-key (kbd "C-c n b") 'org-roam-switch-to-buffer)
(global-set-key (kbd "C-c n d") 'org-roam-find-directory)
(global-set-key (kbd "C-c n n") 'org-roam-dailies-today)

;; Flycheck
(straight-use-package 'flycheck)
(global-flycheck-mode)
(provide 'init)

;; Flyspell
(straight-use-package 'flyspell)
(add-hook 'text-mode-hook (lambda () (flyspell-mode 1)))

;; yasnippet
(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)
(yas-global-mode)

;; Python
(straight-use-package 'pipenv)
(add-hook 'python-mode-hook 'pipenv-mode)
(setq pipenv-projectile-after-switch-function
      #'pipenv-projectile-after-switch-default)

;; Go
(straight-use-package 'go-mode)
(defun my/lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'my/lsp-go-install-save-hooks)

;; LSP
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(straight-use-package 'company-lsp)
(defvar company-backends '())
(push 'company-capf company-backends)
(add-hook 'go-mode-hook #'lsp)
(add-hook 'python-mode-hook #'lsp)

;; YAML mode
(straight-use-package 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
;;; init.el ends here
