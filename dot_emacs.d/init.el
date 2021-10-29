;;; init.el --- Stub to load org based config -*- lexical-binding: t -*-

;; Author: Carl Flippin
;; Maintainer: Carl Flippin
;; Version: 0.1.0
;; Homepage: https://carlf.io

;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:

;; This is a simple stub that checks if the tangled version of my
;; config is out of date and regenerates if it is.

;;; Code:


(defvar config-org-file (concat user-emacs-directory "lisp/config.org"))
(defvar config-el-file (concat user-emacs-directory "lisp/config.el"))

(defun cf/tangle-emacs-config ()
  "Function to generate the elisp config from the literate config."
  (progn
    (require 'org)
    (org-babel-tangle-file config-org-file)))

(when (file-newer-than-file-p config-org-file config-el-file)
  (cf/tangle-emacs-config))

(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(require 'config)

(provide 'init)
;;; init.el ends here
