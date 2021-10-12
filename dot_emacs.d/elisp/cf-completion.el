;;; package --- Smart completion packages

;;; Commentary:
;; This is for all the clever completing-read packages that I use and
;; the extensions to them that make life livable.

;;; Code:
(require 'use-package)

;; Vertico for completing read
(use-package vertico
  :straight t
  :init
  (vertico-mode))

;; Orderless for the completion style
(use-package orderless
  :straight t
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch))
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Marginalia to get more context in lists
(use-package marginalia
  :straight t
  :after vertico
  :bind (("M-a" . marginalia-cycle))
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

;; Embark for more actions on completions
(use-package embark
  :straight t
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

;; Corfu instead of company
(use-package corfu
  :straight t
  :hook ((prog-mode . corfu-mode)))

;; Consult for some nicer embark-enabled commnads
(use-package consult
  :straight t
  :bind
  (("C-c h" . consult-history)
   ("C-c m" . consult-mode-command)
   ("C-c b" . consult-bookmark)
   ("C-x b" . consult-buffer)
   ("C-x 4 b" . consult-buffer-other-window)
   ("C-x 5 b" . consult-buffer-other-frame)
   ("M-#" . consult-register-load)
   ("M-'" . consult-register-store)
   ("C-M-#" . consult-register)
   ("M-g g" . consult-goto-line)
   ("M-s f" . consult-find)
   ("M-s F" . consult-locate)
   ("M-s g" . consult-grep)
   ("M-s G" . consult-git-grep)
   ("M-s r" . consult-ripgrep)
   ("M-s l" . consult-line)
   ("M-s L" . consult-line-multi)
   ("M-s m" . consult-multi-occur)
   ("M-s k" . consult-keep-lines)
   ("M-s u" . consult-focus-lines)
   ("M-s l" . consult-line))
  :config
  (setq consult-project-root-function
        (lambda ()
          (when-let (project (project-current))
            (car (project-roots project))))))

(provide 'cf-completion)
;;; cf-completion.el ends here
