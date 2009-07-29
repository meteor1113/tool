;;;
;; Copyright (C) 2008 Meteor Liu
;;
;; This code has been released into the Public Domain.
;; You may do whatever you like with it.
;;
;; @file
;; @author Meteor Liu <meteor1113@gmail.com>
;; @date 2008-10-27


;;; get this file's directory
(defvar current-file-dir nil
  "current file's directory.")
(make-variable-buffer-local 'current-file-dir)
(setq current-file-dir
      (file-name-directory (or load-file-name (buffer-file-name))))


;;; add this dir and subdirs to load-path.
(add-to-list 'load-path current-file-dir)
(let ((lisp-dir (expand-file-name "lisp" current-file-dir)))
  (and (add-to-list 'load-path lisp-dir)
       (add-to-list 'load-path (expand-file-name "auto-complete" lisp-dir))
       (add-to-list 'load-path (expand-file-name "company" lisp-dir))
       (add-to-list 'load-path (expand-file-name "doxymacs" lisp-dir))
       (add-to-list 'load-path (expand-file-name "wubi" lisp-dir))))


;;; all features need to load
(require 'saveplace)

(require 'auto-complete)
(require 'company)
(require 'doxymacs)
(require 'gtags)
(require 'htmlize)                      ; org-mode html syntax highlighting
(require 'smart-compile)
(require 'tabbar)
(require 'unicad)
(require 'yasnippet-bundle)

(require 'cedet)
(require 'ecb)
(require 'xcscope)


;;; common setting
(setq user-full-name "Meteor Liu")
(setq user-mail-address "meteor1113@gmail.com")
(tool-bar-mode t)
(set-scroll-bar-mode 'right)
(cua-mode t)
(ido-mode t)
(icomplete-mode t)
(column-number-mode t)
(show-paren-mode t)
(recentf-mode t)
(savehist-mode t)
(desktop-save-mode t)
(global-auto-revert-mode t)
(setq-default save-place t)
(setq org-log-done 'time)
(add-hook 'org-mode-hook 'imenu-add-menubar-index)
;; (global-hl-line-mode t)
;; (linum-mode t)
;; (setq default-tab-width 4)

(tabbar-mode t)
(yas/load-directory (expand-file-name "snippets" current-file-dir))
(add-hook 'org-mode-hook
          #'(lambda ()
              (local-set-key [tab] 'yas/expand))) ; let org-mode use yasnippet


;;; complete setting
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'objc-mode)

(global-company-mode t)
(setq company-idle-delay nil)
(define-key company-mode-map (kbd "M-n") 'company-select-next)
(define-key company-mode-map (kbd "M-p") 'company-select-previous)


;;; progmodes setting
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode)
                ("\\.c$" . c++-mode))
              auto-mode-alist))

(defun progmode-common-function ()
  (setq indent-tabs-mode nil)
  ;; (hs-minor-mode t)
  (imenu-add-menubar-index)
  (cscope:hook))

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq tab-width 4)
            (progmode-common-function)
            ;; (c-set-style "stroustrup")
            (doxymacs-mode)))
(add-hook 'c-mode-hook (lambda () (c-set-style "stroustrup")))
(add-hook 'c++-mode-hook (lambda () (c-set-style "stroustrup")))
(add-hook 'java-mode-hook (lambda () (c-set-style "java")))
(add-hook 'objc-mode-hook (lambda () (c-set-style "stroustrup")))
(add-hook 'emacs-lisp-mode-hook 'progmode-common-function)
(add-hook 'python-mode-hook 'progmode-common-function)


;;; cedet setting
;; (semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)

(setq semanticdb-default-save-directory "~/.emacs.d/")
;; (setq semanticdb-project-roots (list (expand-file-name "/")))

;; (global-set-key [(control tab)] 'senator-complete-symbol);
;; (global-set-key [(control tab)] 'senator-completion-menu-popup) ; C-c , SPC
;; (global-set-key [(control tab)] 'semantic-ia-complete-symbol)
(global-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)
(global-set-key [f11] 'eassist-switch-h-cpp)
(global-set-key [C-f11] 'eassist-switch-h-cpp)
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [C-f12] 'semantic-ia-fast-jump)


;;; ecb setting
(custom-set-variables
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1)))
(setq ecb-tip-of-the-day nil
      ecb-auto-compatibility-check nil)


(provide 'emacs-init)
