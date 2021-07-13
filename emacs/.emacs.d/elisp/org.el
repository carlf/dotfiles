(use-package org
  :straight t
  :init
  (setq org-agenda-files '("~/Nextcloud/Documents/org")
	org-todo-keywords '((sequence "TODO(t!)" "PROGRESS(p!)" "VERIFY(v@)" "BLOCKED(b@)" "|" "CANCELLED(c@)" "DONE(d@)" "DELEGATED(e@)"))
	org-refile-targets '((org-agenda-files :maxlevel . 2))
	org-directory "~/Nextcloud/Documents/org"
	org-log-into-drawer t
	org-startup-indented t)
  :bind (("C-c a" . org-agenda)
	 ("C-c c" . org-capture)))
