;;; init --- This configures emacs
;;; Commentary: This stub loads the real config in init.org
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(package-initialize)
(add-to-list 'package-archives (cons "melpa"
				     "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'org-install)
(require 'ob-tangle)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(provide 'init)
;;; init.el ends here
