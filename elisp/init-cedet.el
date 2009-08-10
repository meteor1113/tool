;;;
;; Copyright (C) 2009 Meteor Liu
;;
;; This code has been released into the Public Domain.
;; You may do whatever you like with it.
;;
;; @file
;; @author Meteor Liu <meteor1113@gmail.com>
;; @date 2008-08-08


(require 'cedet)
(require 'ecb)


;;; cedet setting
;; (semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
(enable-visual-studio-bookmarks)

(setq semanticdb-default-save-directory "~/.emacs.d/")
;; (setq semanticdb-project-roots (list (expand-file-name "/")))

;; (global-set-key [(control tab)] 'senator-complete-symbol)
;; (global-set-key [(control tab)] 'senator-completion-menu-popup) ; C-c , SPC
;; (global-set-key [(control tab)] 'semantic-ia-complete-symbol)
(global-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)
(global-set-key [f11] 'eassist-switch-h-cpp)
(global-set-key [C-f11] 'eassist-switch-h-cpp)
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [C-f12] 'semantic-ia-fast-jump)


;;; ecb setting
(setq ecb-tip-of-the-day nil)
(setq ecb-auto-compatibility-check nil)
(setq ecb-primary-secondary-mouse-buttons 'mouse-1--C-mouse-1)


(provide 'init-cedet)