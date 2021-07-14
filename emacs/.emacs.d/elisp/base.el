;; Keep backups nice and neat
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.saves"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq vc-follow-symlinks t)

;; Set the path to match my shell
(use-package exec-path-from-shell
  :straight t
  :ensure t
  :init
  (exec-path-from-shell-initialize))

(defun cf/string-trim-final-newline (string)
  "Strip a trailing newline from the passed in STRING."
  (let ((len (length string)))
    (cond
     ((and (> len 0) (eql (aref string (- len 1)) ?\n))
      (substring string 0 (- len 1)))
     (t string))))
(setenv "SSH_AUTH_SOCK" (cf/string-trim-final-newline
                         (shell-command-to-string "gpgconf --list-dirs agent-ssh-socket")))

(setq tramp-ssh-controlmaster-options
      (concat
       "-o ControlPath=~/.ssh/master-%%r@%%h:%%p "
       "-o ControlMaster=auto -o ControlPersist=yes"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(use-package smartparens
  :straight t
  :ensure t
  :config
  (require 'smartparens-config)
  :hook ((prog-mode . smartparens-strict-mode)))
