(defun cf/jira-get-ticket (url)
  (let ((path (url-filename (url-generic-parse-url url)))
        (ticket-rx "\\(?:/[^/]+\\)+/\\([^?]+\\).*\\'"))
    (string-match ticket-rx path)
    (concat "[[" url "][" (match-string 1 path) "]]")))

(use-package org
  :straight t
  :init
  (setq org-agenda-files '("~/Nextcloud/Documents/org")
	org-todo-keywords '((sequence "TODO(t!)" "PROGRESS(p!)" "VERIFY(v@)" "BLOCKED(b@)" "|" "CANCELLED(c@)" "DONE(d@)" "DELEGATED(e@)"))
	org-refile-targets '((org-agenda-files :maxlevel . 2))
	org-directory "~/Nextcloud/Documents/org"
	org-log-into-drawer t
	org-startup-indented t
	org-capture-templates
	'(("t" "Todo" entry (file+headline "~/Nextcloud/Documents/org/inbox.org" "Inbox")
           "* TODO %?\nCREATED: %U")
          ("j" "Jira" entry (file+headline "~/Nextcloud/Documents/org/inbox.org" "Inbox")
           "* TODO %? %(cf/jira-get-ticket \"%c\")\nCREATED: %U")))
  :bind (("C-c a" . org-agenda)
	 ("C-c c" . org-capture)))

(use-package org-roam
  :straight t
  :init
  (setq org-roam-directory "~/Nextcloud/Documents/org-roam"
	org-roam-db-location "~/Nextcloud/Documents/org-roam/org-roam.db"
	org-roam-capture-templates
	'(("d" "default" plain #'org-roam-capture--get-point
	   "%?"
	   :file-name "%<%Y%m%d%H%M%S>-${slug}"
	   :head "#+title: ${title}\n#+roam_tags: "
	   :unnarrowed t))
	org-roam-dailies-capture-templates
	'(("d" "default" plain #'org-roam-capture--get-point
	   "%?"
	   :file-name "%<%Y-%m-%d>"
	   :head "#+title: %<%d %B %Y>\n#+startup: indent\n#+roam_tags: dailies\n"
	   :unnarrowed t)))
  :bind (("C-c n r" . org-roam-buffer-toggle-display)
	 ("C-c n i" . org-roam-insert)
	 ("C-c n /" . org-roam-find-file)
	 ("C-c n b" . org-roam-switch-to-buffer)
	 ("C-c n d" . org-roam-find-directory)
	 ("C-c n n" . org-roam-dailies-find-today))
  :hook (after-init-hook . org-roam-mode))
