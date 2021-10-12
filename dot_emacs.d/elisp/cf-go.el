;;; cf-go.el --- Go language support

;;; Commentary:
;; This loads go-mode and configures LSP to work with it.

;;; Code:
(require 'use-package)

;; Load go-mode
(use-package go-mode
  :straight t
  :mode "\\.go\\'"
  :interpreter "go"
  :hook
  ((before-save . lsp-format-buffer)
   (before-save . lsp-organize-imports)))

(provide 'cf-go)
;;; cf-go.el ends here
