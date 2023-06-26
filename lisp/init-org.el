(require 'org-tempo)

(defvar org-note-dir "~/note/org-note")
(defvar org-daily (format  "%s/daily" org-note-dir))
(defvar temp-dir (format  "%s/tmp" org-note-dir))
(defvar page-dir (format  "%s/page" org-note-dir))

(defun page ()
  (interactive)
  (let* ((dir (ensure-dir page-dir)))
    (find-file dir)))

(defun daily ()
  (interactive)
  (let* ((date (format-time-string date-format))
	 (note-dir (ensure-dir org-daily))
	 (file-name (format "%s/%s.org" note-dir date)))
    (if (file-exists-p file-name)
	(progn
	  (find-file file-name)
	  (goto-char (point-max)))
      (progn
	(find-file file-name)
	(insert (format "#+title: Journal %s with ♥\n#+author: Michael Wong\n\n* " date date))))))

(setq org-hide-leading-stars t)

(setq org-agenda-files (directory-files-recursively org-note-dir "\\.org$"))

(defun process-new-org-files ()
  (let ((files (directory-files-recursively org-note-dir "\\.org$")))
    (cl-loop for file in files
             unless (seq-contains-p org-agenda-files file)
             do (add-to-list 'org-agenda-files file))))

;; 自动监视新增的 org files。
(run-with-timer 0 10 'process-new-org-files)

(global-set-key (kbd "C-c n") 'create-tmp-file)
(global-set-key (kbd "C-c s") 'org-insert-structure-template)
(global-set-key (kbd "C-c e") 'org-pandoc-export-as-markdown)

(defun create-tmp-file ()
  (interactive)  
  (let* ((dir (ensure-dir temp-dir))
	 (time (format-time-string datetime-format))
	 (file-name (format "%s/%s.org" dir time)))
    (find-file file-name)
    (org-mode)
    (with-current-buffer (current-buffer)
      (goto-char (point-max))
      (insert (format "#+title: Happy hacking with ♥\n#+author: Michael Wong\n#+date: %s\n\n* " time)))))

(setq org-pandoc-command "/usr/local/bin/pandoc")

(provide 'init-org)
