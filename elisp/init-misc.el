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
  (let ((old-dir default-directory))
    (cd lisp-dir)
    (normal-top-level-add-subdirs-to-load-path)
    (cd old-dir)))


;;; misc setting
(require 'gtags)
(require 'htmlize)
(require 'smart-compile)
(require 'unicad)
(require 'xcscope)

(require 'tabbar)
(tabbar-mode t)

(require 'doxymacs)
(add-hook 'c-mode-common-hook
          '(lambda ()
             (doxymacs-mode t)
             (doxymacs-font-lock)))

(require 'yasnippet-bundle)
(let ((this-dir (file-name-directory (or load-file-name (buffer-file-name)))))
  (yas/load-directory (expand-file-name "snippets" this-dir)))
(add-hook 'org-mode-hook
          #'(lambda ()
              (local-set-key [tab] 'yas/expand))) ; let org-mode use yasnippet

(require 'auto-complete)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'objc-mode)

(require 'company)
(global-company-mode t)
(setq company-idle-delay nil)
(define-key company-mode-map (kbd "M-n") 'company-select-next)
(define-key company-mode-map (kbd "M-p") 'company-select-previous)


(provide 'init-misc)
