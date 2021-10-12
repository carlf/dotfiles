;;; cf-org.el --- org-mode config

;;; Commentary:
;; This loads and configures org-mode and associated packages.

;;; Code:
(require 'use-package)

;; Utility to make a task referencing a jira ticket
(defun cf/jira-get-ticket (url)
  "Generate org-mode link to a Jira ticket"
  (let ((path (url-filename (url-generic-parse-url url)))
        (ticket-rx "\\(?:/[^/]+\\)+/\\([^?]+\\).*\\'"))
    (string-match ticket-rx path)
    (concat "[[" url "][" (match-string 1 path) "]]")))

;; Load latest org
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

(provide 'cf-org)
;;; cf-org.el ends here
