(use-package projectile
  :straight t
  :bind
  (("s-p" . projectile-command-map)
   ("C-c p" . projectile-command-map))
  :init
  (projectile-mode +1))

(use-package magit
  :straight t
  :bind ("C-x g" . magit-status))
