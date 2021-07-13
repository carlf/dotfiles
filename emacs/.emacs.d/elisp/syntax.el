(use-package flycheck
  :straight t
  :init
  (add-hook 'prog-mode-hook #'flycheck-mode)
  (add-hook 'yaml-mode-hook #'flycheck-mode))

(use-package flyspell
  :straight t
  :init
  (add-hook 'text-mode-hook (lambda () (flyspell-mode 1))))
