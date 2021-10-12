;;; cf-project.el --- Project management

;;; Commentary:
;; This just loads the project.el package and defers.

;;; Code:
(require 'use-package)

;; Load project
(use-package project
  :straight t
  :bind-keymap ("C-x p" . project-prefix-map))

(provide 'cf-project)
;;; cf-project.el ends here
