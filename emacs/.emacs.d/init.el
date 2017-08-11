;;; init --- This configures emacs
;;; Commentary: This stub loads the real config in init.org
;;; Code:
(require 'package)
(add-to-list 'package-archives (cons "melpa"
				     "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/init.org"))
(provide 'init)
;;; init.el ends here
