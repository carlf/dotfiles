;;; init --- My init file

;;; Commentary:
;;; No commentary

;;; Code:
;; Turn up gc threshold
(setq gc-cons-threshold (* 50 1000 1000))

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
(setq dracula-enlarge-headings nil)
(load-theme 'dracula t)

;; all-the-icons
(straight-use-package 'all-the-icons)

;; Clean up the style of emacs
(set-frame-font "CascadiaCode-12")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable ligatures
(straight-use-package
 '(ligature :type git :host github :repo "mickeynp/ligature.el"))
(ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                     ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                     "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                     "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                     "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                     "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                     "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                     "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                     ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                     "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                     "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                     "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"))
(global-ligature-mode)

;; Use a fancy dashboard
(straight-use-package 'dashboard)
(defvar dashboard-startup-banner)
(setq dashboard-startup-banner 2)
(setq dashboard-set-heading-icons t)
(setq dashboard-items '((recents . 5)
			(bookmarks . 5)
			(projects . 5)
			(agenda . 10)))
(dashboard-setup-startup-hook)

;; powerline
(straight-use-package 'powerline)
(powerline-default-theme)

;; minimap
(straight-use-package 'minimap)

;; Show whitespace
(straight-use-package 'whitespace)

;; Turn on autofill for text modes
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Origami
(straight-use-package 'origami)

;; Never let the scratch buffer get killed
(straight-use-package 'unkillable-scratch)
(unkillable-scratch t)

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

(straight-use-package 'forge)
(with-eval-after-load 'magit
  (require 'forge))

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

;; Configure dired
(setq dired-listing-switches "-aBhl --group-directories-first")
(add-hook 'dired-load-hook
	  (function (lambda () (load "dired-x"))))
(straight-use-package 'dired+)

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
(straight-use-package 'counsel-projectile)
(projectile-mode +1)
(counsel-projectile-mode t)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; pdf-tools
(straight-use-package 'pdf-tools)
(pdf-tools-install)

;; Org Mode
(straight-use-package 'org)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(require 'org)
(require 'org-install)
(setq org-refile-targets
	  '((org-agenda-files :maxlevel . 2))
	  org-export-with-sub-superscripts nil
	  org-directory "~/Documents/org"
	  org-default-notes-file "~/Documents/org/inbox.org"
	  org-agenda-files '("~/Documents/org")
	  org-log-done 'time
	  org-todo-keywords '((sequence "TODO(t)" "PROGRESS(p!)" "|" "CANCELLED(c@)" "DELEGATED(d@)" "FINISHED(f@)"))
	  org-log-into-drawer t
	  org-capture-templates '(("t" "Todo" entry (file "")
				   "* TODO %?"))
	  org-src-fontify-natively t
	  org-latex-listings 'minted
	  org-latex-packages-alist '(("" "minted"))
	  org-latex-pdf-process '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f" "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(add-to-list 'org-modules 'org-habit)

(org-babel-do-load-languages
 'org-babel-load-languages
 (append org-babel-load-languages
		 '((shell . t)
		   (python . t))))

;; Org Roam
(straight-use-package 'org-roam)
(setq org-roam-directory "~/Documents/org-roam"
      org-roam-db-location "~/Documents/org-roam/org-roam.db")
(org-roam-mode)
(setq org-roam-capture-templates
      '(("d" "default" plain #'org-roam-capture--get-point
	 "%?"
	 :file-name "%<%Y%m%d%H%M%S>-${slug}"
	 :head "#+title: ${title}\n#+startup: indent\n#+roam_tags: "
	 :unnarrowed t)))
(setq org-roam-dailies-capture-templates
      '(("d" "default" plain #'org-roam-capture--get-point
	 "%?"
	 :file-name "%<%Y-%m-%d>"
	 :head "#+title: %<%d %B %Y>\n#+startup: indent\n#+roam_tags: dailies\n"
	 :unnarrowed t)))
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

;; Scheme
(straight-use-package 'geiser)
(setq geiser-active-implementations '(racket))

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

;; Turn the gc threshold back down
(setq gc-cons-threshold (* 2 1000 1000))

;; Password manager integration
(straight-use-package 'pass)

(straight-use-package 'dockerfile-mode)
;;; Init.el ends here
