;;; cf-code.el --- General tools for code

;;; Commentary:
;; These are packages used for all code.  Packages for specific
;; languages are in files for those languages.

;;; Code:
(require 'use-package)

;; Smartparens to keep my parens nice and tidy
(use-package smartparens
  :straight t
  :config
  (require 'smartparens-config)
  :hook ((prog-mode . smartparens-strict-mode)))

;; Load flycheck
(use-package flycheck
  :straight t
  :custom
  (flycheck-emacs-lisp-load-path 'inherit)
  :hook ((prog-mode . flycheck-mode)))

;; Nice snippet package
(use-package yasnippet
  :straight t
  :hook ((prog-mode . yas-minor-mode)))

;; The snippets for the snippet package above
(use-package yasnippet-snippets
  :straight t
  :after yasnippet
  :config
  (yasnippet-snippets-initialize))

(provide 'cf-code)
;;; cf-code.el ends here

