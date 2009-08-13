;;;
;; Copyright (C) 2009 Meteor Liu
;;
;; This code has been released into the Public Domain.
;; You may do whatever you like with it.
;;
;; @file
;; @author Meteor Liu <meteor1113@gmail.com>
;; @date 2008-08-08


;;; load-path setting
(let* ((this-dir (file-name-directory (or load-file-name (buffer-file-name))))
       (lisp-dir (expand-file-name "lisp" this-dir)))
  (add-to-list 'load-path this-dir)
  (add-to-list 'load-path lisp-dir)
  (add-to-list 'load-path (expand-file-name "auto-complete" lisp-dir))
  (add-to-list 'load-path (expand-file-name "company" lisp-dir))
  (add-to-list 'load-path (expand-file-name "doxymacs" lisp-dir)))


(require 'auto-complete)
(require 'company)
(require 'doxymacs)
(require 'gtags)
(require 'htmlize)
(require 'smart-compile)
(require 'tabbar)
(require 'unicad)
(require 'xcscope)
(require 'yasnippet-bundle)


;;; misc setting
(tabbar-mode t)

(add-hook 'c-mode-common-hook 'doxymacs-mode)

(let ((this-dir (file-name-directory (or load-file-name (buffer-file-name)))))
  (yas/load-directory (expand-file-name "snippets" this-dir)))
(add-hook 'org-mode-hook
          #'(lambda ()
              (local-set-key [tab] 'yas/expand))) ; let org-mode use yasnippet

(global-auto-complete-mode t)
(add-to-list 'ac-modes 'objc-mode)

(global-company-mode t)
(setq company-idle-delay nil)
(define-key company-mode-map (kbd "M-n") 'company-select-next)
(define-key company-mode-map (kbd "M-p") 'company-select-previous)


(provide 'init-misc)
