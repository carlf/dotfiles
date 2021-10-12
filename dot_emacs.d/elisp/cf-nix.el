;;; cf-nix.el --- Load nix support

;;; Commentary:
;; Loads nix-mode to support the nix config language

;;; Code:
(require 'use-package)

;; Load nix-mode
(use-package nix-mode
  :straight t
  :mode "\\.nix\\'")

(provide 'cf-nix)
;;; cf-nix.el ends here
