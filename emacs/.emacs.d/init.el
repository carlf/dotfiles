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

(straight-use-package 'use-package)

(server-start)

(load "~/.emacs.d/elisp/base.el")
(load "~/.emacs.d/elisp/ui.el")
(load "~/.emacs.d/elisp/projects.el")
(load "~/.emacs.d/elisp/theme.el")
(load "~/.emacs.d/elisp/org.el")
(load "~/.emacs.d/elisp/syntax.el")
(load "~/.emacs.d/elisp/languages.el")
(load "~/.emacs.d/elisp/lsp.el")
