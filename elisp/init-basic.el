;;;
;; Copyright (C) 2009 Meteor Liu
;;
;; This code has been released into the Public Domain.
;; You may do whatever you like with it.
;;
;; @file
;; @author Meteor Liu <meteor1113@gmail.com>
;; @date 2009-08-08


;;; basic setting
(setq user-full-name "Meteor Liu")
(setq user-mail-address "meteor1113@gmail.com")

(tool-bar-mode t)
(set-scroll-bar-mode 'right)
(cua-mode t)
(ido-mode t)
(icomplete-mode t)
(column-number-mode t)
(show-paren-mode t)
(ffap-bindings)
(global-auto-revert-mode t)
(which-function-mode t)
(savehist-mode t)
(recentf-mode t)
(setq-default save-place t)
(desktop-save-mode t)
;; (global-hl-line-mode t)
;; (linum-mode t)
;; (setq default-tab-width 4)

(setq org-log-done 'time)
(add-hook 'org-mode-hook 'imenu-add-menubar-index)


;;; program setting
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode)
                ("\\.c$" . c++-mode))
              auto-mode-alist))

(defun program-common-function ()
  (setq indent-tabs-mode nil)
  (hs-minor-mode t)
  (imenu-add-menubar-index))

(add-hook 'c-mode-common-hook 'program-common-function)
(add-hook 'c-mode-hook (lambda () (c-set-style "stroustrup")))
(add-hook 'c++-mode-hook (lambda () (c-set-style "stroustrup")))
(add-hook 'java-mode-hook (lambda () (c-set-style "java")))
(add-hook 'objc-mode-hook (lambda () (c-set-style "stroustrup")))
(add-hook 'emacs-lisp-mode-hook 'program-common-function)
(add-hook 'python-mode-hook 'program-common-function)


(provide 'init-basic)