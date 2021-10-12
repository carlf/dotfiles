;;; cf-env.el --- Setting my environment up correctly

;;; Commentary:
;; This configures my base environment.  Specifically the settings needed for external tools.

;;; Code:
;; Set my path correctly
(let ((my-path '("/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/"
                "~/bin/"
		"~/go/bin/"
                "/usr/local/bin/"
		"/usr/bin/"
		"/bin/"
		"/usr/sbin/"
		"/sbin/"
		"/Library/TeX/texbin/"
		"/opt/X11/bin/"
		"/Library/Apple/usr/bin/"
		"/usr/local/Cellar/emacs-plus@28/28.0.50/libexec/emacs/28.0.60/x86_64-apple-darwin20.6.0/")))
  (setenv "PATH"
	  (mapconcat #'identity my-path ":"))
  (setq exec-path my-path))

(provide 'cf-env)
;;; cf-env.el ends here
