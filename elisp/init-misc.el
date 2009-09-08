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
(let* ((dir (file-name-directory (or load-file-name (buffer-file-name))))
       (lisp-dir (expand-file-name "lisp" dir)))
  (add-to-list 'load-path dir)
  (when (file-exists-p lisp-dir)
    (progn (add-to-list 'load-path lisp-dir)
           (let ((old-dir default-directory))
             (cd lisp-dir)
             (normal-top-level-add-subdirs-to-load-path)
             (cd old-dir)))))


;;; misc setting
;; (require 'gtags nil t)
;; (require 'htmlize nil t)
(require 'smart-compile nil t)
(require 'unicad nil t)
(require 'xcscope nil t)

(require 'tabbar)
(tabbar-mode t)

(require 'doxymacs)
(add-hook 'c-mode-common-hook
          '(lambda ()
             (doxymacs-mode t)
             (doxymacs-font-lock)))

(require 'yasnippet-bundle)
(let ((dir (file-name-directory (or load-file-name (buffer-file-name)))))
  (yas/load-directory (expand-file-name "snippets" dir)))
;; use yasnippet in org-mode from joaotavora
(defun yas/advise-indent-function (function-symbol)
  (eval `(defadvice ,function-symbol (around yas/try-expand-first activate)
           ,(format
             "Try to expand a snippet before point, then call `%s' as usual"
             function-symbol)
           (let ((yas/fallback-behavior nil))
             (unless (and (interactive-p)
                          (yas/expand))
               ad-do-it)))))
(yas/advise-indent-function 'org-cycle)

(require 'auto-complete)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'objc-mode)
(require 'auto-complete-cpp)
(ac-c++-init)
(require 'auto-complete-css)
(ac-css-init)
(require 'auto-complete-emacs-lisp)
(ac-emacs-lisp-init)

(require 'company)
(global-company-mode t)
(setq company-idle-delay nil)
(define-key company-mode-map (kbd "M-n") 'company-select-next)
(define-key company-mode-map (kbd "M-p") 'company-select-previous)


(provide 'init-misc)
