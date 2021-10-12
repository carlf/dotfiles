;;; cf-lsp.el --- Base config for LSP

;;; Commentary:
;; This loads LSP and sets the modes it is enabled on.

;;; Code:
(require 'use-package)

;; Load LSP itself
(use-package lsp-mode
  :straight t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (go-mode . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration))

;; The lsp-ui package adds some nice features
(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode)

(provide 'cf-lsp)
;;; cf-lsp.el ends here
