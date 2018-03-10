;; Load the built-in package manager and add a couple of popular Emacs package repositories
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; Auto-install packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
  )

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files))
  :config
  (helm-mode 1)
  )

(use-package org
  :ensure t
  :bind (("\C-ca" . org-agenda)
	 ("\C-cc" . org-capture))
  :init
  :config
  (setq org-todo-keywords
	'((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELLED"))
	)
  (setq org-agenda-files '("~/Dropbox/org/"))
  (setq org-capture-templates
	'(("a" "My TODO task format." entry
	   (file "~/Dropbox/org/tasks.org")
	   "* TODO %?
SCHEDULED: %t"))
	)
  (setq org-log-done (quote time))
  (setq org-log-redeadline (quote time))
  (setq org-log-reschedule (quote time))
  )

;; Fullscreen on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Disable the splash screen (to enable it again, replace the t with 0)
(setq inhibit-startup-screen t)

;; Set line-numbering
(global-linum-mode)
(global-hl-line-mode 1)

;;  Balanced brackets
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)

;; Load the zenburn theme
(load-theme 'zenburn t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (org helm evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
