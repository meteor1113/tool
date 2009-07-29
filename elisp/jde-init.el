;;;
;; Copyright (C) 2008 Meteor Liu
;;
;; This code has been released into the Public Domain.
;; You may do whatever you like with it.
;;
;; @file
;; @author Meteor Liu <meteor1113@gmail.com>
;; @date 2009-02-17


;;; all features need to load
(require 'emacs-init)
(require 'jde)
(require 'decompile)
;; (require 'jmaker)


;;; auto open auto-complete-mode in jde-mode
(add-to-list 'ac-modes 'jde-mode)


;;; jde common setting
(setq jde-enable-abbrev-mode t)


(provide 'jde-init)
