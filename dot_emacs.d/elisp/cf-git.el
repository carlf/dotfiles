;;; cf-git.el --- Get git stuff set up

;;; Commentary:
;; This loads magit and related tools

;;; Code:

(require 'use-package)

(use-package magit
  :straight t
  :bind
  ("C-x g" . magit-status))

(use-package git-gutter
  :straight t
  :defer t
  :hook
  ((markdown-mode . git-gutter-mode)
   (prog-mode . git-gutter-mode)
   (conf-mode . git-gutter-mode))
  :custom
  (git-gutter:disabled-modes '(org-mode asm-mode image-mode))
  (git-gutter:update-interval 1)
  (git-gutter:window-width 2)
  (git-gutter:ask-p nil))

(use-package git-gutter-fringe
  :straight t
  :diminish git-gutter-mode
  :after git-gutter
  :demand fringe-helper
  :config
  (setq-default fringes-outside-margins t)
  (define-fringe-bitmap 'git-gutter-fr:added
    [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
    nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:modified
    [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
    nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:deleted
    [0 0 0 0 0 0 0 0 0 0 0 0 0 128 192 224 240 248]
    nil nil 'center))

(provide 'cf-git)
;;; cf-git.el ends here
