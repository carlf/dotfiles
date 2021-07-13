(use-package mode-line-bell
  :straight t
  :ensure t
  :config
  (mode-line-bell-mode))

(use-package counsel
  :straight t
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :straight t
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
	 ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

(use-package ivy-rich
  :straight t
  :after ivy
  :config
  (ivy-rich-mode 1))

(use-package swiper
  :straight t
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))
  
(use-package which-key
  :straight t
  :config
  (which-key-mode))

(use-package ace-window
  :straight t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
	aw-dispatch-always t)
  :bind ("M-o" . ace-window))

(use-package company
  :straight t
  :hook (prog-mode . company-mode))
