(use-package go-mode
  :straight t
  :mode "\\.go\\'"
  :interpreter "go"
  :hook ((go-mode . lsp-deferred)
	 (before-save . lsp-format-buffer)
	 (before-save . lsp-organize-imports)))

(use-package yaml-mode
  :straight t
  :mode ("\\.yml\\'" "\\.yaml\\'"))
