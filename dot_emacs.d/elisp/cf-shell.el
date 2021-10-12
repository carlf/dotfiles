;;; cf-shell.el --- Shell support

;;; Commentary:
;; This loads a package for shell support and configures flycheck to
;; run shellcheck automatically and company completion.

;;; Code:
(require 'use-package)

;; Set company backend to company-shell if in shell mode
(defun cf/sh-company-hook ()
  "Hook function to set company backend for sh-mode"
  (make-local-variable 'company-backends)
  (setq company-backends '(company-shell company-files)))

;; Load shell-script-mode
(use-package sh-script
  :straight t
  :mode ("\\.sh\\'" "\\.zsh\\'")
  :hook
  (sh-mode . cf/sh-company-hook))

;; Plugin for company to support shell
(use-package company-shell
  :straight t
  :commands company-shell)

(provide 'cf-shell)
;;; cf-shell.el ends here
