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

(use-package terraform-mode
  :straight t
  :mode ("\\.tf\\'"))

(use-package geiser-racket
  :straight t
  :mode "\\.scm'")

(use-package lsp-haskell
  :straight t
  :mode "\\.hs'")

(use-package haskell-mode
  :straight t
  :mode "\\.hs'")
