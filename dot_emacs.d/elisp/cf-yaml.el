;;; cf-yaml.el --- YAML support

;;; Commentary:
;; Load yaml-mode for support of YAML files.

;;; Code:
(require 'use-package)

;; Load yaml-mode
(use-package yaml-mode
  :straight t
  :mode ("\\.yml\\'" "\\.yaml\\'"))

(provide 'cf-yaml)
;;; cf-yaml.el ends here
