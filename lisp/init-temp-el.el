
(defvar org-note-dir "~/note/org-note")
(defvar temp-dir "~/note/tmp")

(defun ensure-dir (dir)
  (progn
    (unless (file-exists-p dir)
      (make-directory dir))
    dir))

(defun daily ()
  (interactive)
  (let ((daily-name (format-time-string "%Y-%m-%d"))
	(note-dir (ensure-dir org-note-dir)))
    (find-file (format "%s/%s.org" note-dir daily-name))))

(defun insert-current-date ()
  (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))

(defun insert-current-datetime ()
  (interactive)
  (insert (shell-command-to-string "echo -n $(date '+%Y-%m-%d %H:%m:%S')")))

(defun note-dir ()
  (interactive)
  (let ((directory (ensure-dir org-note-dir)))
    (find-file  directory)))

(defun create-tmp-file ()
  (interactive)  
  (let* ((dir (ensure-dir temp-dir))
	 (time (format-time-string "%Y-%m-%dT%H:%M:%S"))
	 (file-name (format "%s/%s.org" dir time)))
    (find-file file-name)
    (org-mode)))

(defun -is-buffer-name-special (buffer-name)
  (string-match-p "^\\*.*\\*$" buffer-name))


(defun confirm-kill-unsaved-buffer ()
  (if (and (buffer-modified-p)
           (not (buffer-file-name))
	   (not (-is-buffer-name-special (buffer-name (current-buffer)))))
      (yes-or-no-p (format "Buffer %s modified and unsaved. Kill anyway? " (buffer-name)))
    t))

(add-hook 'kill-buffer-query-functions 'confirm-kill-unsaved-buffer)

(provide 'init-temp-el)
