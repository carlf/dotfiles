;;; cf-ui.el --- Basic UI settings

;;; Commentary:
;; This configures the basic look of Emacs

;;; Code:
(require 'use-package)

;; Base settings
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(font . "JetBrains Mono-12") default-frame-alist)
(setq menu-bar-mode nil
      tool-bar-mode nil
      scroll-bar-mode nil)

;; Allow full screen to really fill the screen
(setq frame-resize-pixelwise t)

;; Let me just say y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Function to add hook to load theme
(defun cf/load-theme (theme)
  "Function to add hook to load theme"
  (add-hook 'after-make-frame-functions
	    `(lambda (frame)
	       (select-frame frame)
	       (when (display-graphic-p frame)
		 (load-theme ,theme t)))))

;; Load NΛNO theme
(use-package nano-theme
  :straight (nano-theme
	     :type git
	     :host github
	     :repo "rougier/nano-theme")
  :config
  (nano-dark))

;; Handle setting theme on new frames
(if (daemonp)
    (add-hook 'after-make-frame-functions
	      (lambda (frame)
		(select-frame frame)
		(load-theme 'nano-dark t)))
  (load-theme 'nano-dark t))

;; Load NΛNO modeline
(use-package nano-modeline
  :straight (nano-modeline
	     :type git
	     :host github
	     :repo "rougier/nano-modeline")
  :custom
  (nano-modeline-position 'bottom)
  :config
  (nano-modeline-mode))

;; Load which-key
(use-package which-key
  :straight t
  :config
  (which-key-mode))

;; Disable bell on C-g
(setq ring-bell-function 'ignore)

(provide 'cf-ui)
;;; cf-ui.el ends here
