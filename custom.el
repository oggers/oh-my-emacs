;;; This file contains some temporary code snippets, it will be loaded after
;;; various oh-my-emacs modules. When you just want to test some code snippets
;;; and don't want to bother with the huge ome.*org files, you can put things
;;; here.

;; For example, oh-my-emacs disables menu-bar-mode by default. If you want it
;; back, just put following code here.
(menu-bar-mode t)

;;; You email address
(setq user-mail-address "oggers@gmail.com")

;;; Calendar settings
;; you can use M-x sunrise-sunset to get the sun time
(setq calendar-latitude 43.2)
(setq calendar-longitude 2.4)
(setq calendar-location-name "Barakaldo, Spain")

;;; Time related settings
;; show time in 24hours format
(setq display-time-24hr-format t)
;; show time and date
(setq display-time-and-date t)
;; time change interval
(setq display-time-interval 10)
;; show time
(display-time-mode t)

;;; Some tiny tool functions
(defun replace-all-chinese-quote ()
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (replace-regexp  "”\\|“" "\"")
    (mark-whole-buffer)
    (replace-regexp "’\\|‘" "'")))

;; Comment function for GAS assembly language
(defun gas-comment-region (start end)
  "Comment region for AT&T syntax assembly language The default
comment-char for gas is ';', we need '#' instead"
  (interactive "r")
  (setq end (copy-marker end t))
  (save-excursion
    (goto-char start)
    (while (< (point) end)
      (beginning-of-line)
      (insert "# ")
      (next-line))
    (goto-char end)))

(defun gas-uncomment-region (start end)
  "Uncomment region for AT&T syntax assembly language the
inversion of gas-comment-region"
  (interactive "r")
  (setq end (copy-marker end t))
  (save-excursion
    (goto-char start)
    (while (< (point) end)
      (beginning-of-line)
      (if (equal (char-after) ?#)
          (delete-char 1))
      (next-line))
    (goto-char end)))

(ome-load "core/ome-oggers-gtd.org")
(ome-load "core/ome-oggers-misc.org")
(ome-load "modules/ome-oggers-web.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((eval let ((local-path (dir-locals-find-file "."))) (setq python-shell-interpreter (concat (if (stringp local-path) (file-name-directory local-path) (car local-path)) "../../bin/zopepy"))) (eval let ((local-path (dir-locals-find-file "."))) (setenv "PYTHONPATH" (shell-command-to-string (concat (concat (if (stringp local-path) (file-name-directory local-path) (car local-path)) "../../bin/zopepy") " -c \"import sys; print ':'.join(sys.path)\"")))) (eval let ((local-path (dir-locals-find-file "."))) (setq elpy-rpc-python-command (concat (if (stringp local-path) (file-name-directory local-path) (car local-path)) "../../../Python-2.7/bin/python2.7")))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
