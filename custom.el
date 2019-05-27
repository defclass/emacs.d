(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (nginx-mode yaml-mode magit plantuml-mode edit-indirect erlang column-marker fill-column-indicator paredit use-package  clj-refactor auto-complete smex avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun daily-md ()
  (interactive)
  (let ((daily-name (format-time-string "%Y-%m-%d")))
    (find-file (format "%s.md" daily-name))))

(defun insert-current-date ()
  (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))

(defun insert-current-datetime ()
  (interactive)
  (insert (shell-command-to-string "echo -n $(date '+%Y-%m-%d %H:%m:%S')")))

(defun note ()
  (interactive)
  (find-file  "~/note"))
