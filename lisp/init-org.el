(require 'org-tempo)

(defvar org-note-dir "~/note/org-note")
(defvar org-daily (format  "%s/daily" org-note-dir))
(defvar temp-dir (format  "%s/tmp" org-note-dir))
(defvar page-dir (format  "%s/page" org-note-dir))

(defun page ()
  (interactive)
  (let* ((dir (ensure-dir page-dir)))
    (find-file dir)))

(defun create-page (title)
  "Generate an Org file with the given TITLE."
  (interactive "sEnter the title: ")
  (let* ((raw-file-name (replace-regexp-in-string "\\s-+" "-" title))
	 (filename (-> (format "%s/%s.org" page-dir raw-file-name) downcase))
         (date (format-time-string date-format)))
    (ensure-dir page-dir)
    (if (file-exists-p filename)
	(message "Page already exists: %s" filename)
	(progn 
	  (find-file filename)
	  (insert "#+title: " title "\n")
	  (insert "#+author: Michael Wong \n")
	  (insert "#+date: " date "\n\n")
	  (insert "* ")
	  (save-buffer)
	  (message "Org file created: %s" (buffer-file-name))))))

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

(defun get-tomorrows-date ()
  (let* ((tomorrow (time-add (current-time) (seconds-to-time 86400)))
         (year (string-to-number (format-time-string "%Y" tomorrow)))
         (month (string-to-number (format-time-string "%m" tomorrow)))
         (day (string-to-number (format-time-string "%d" tomorrow))))
    (format "%04d-%02d-%02d" year month day)))

(defun tomorrow ()
  (interactive)
  (let* ((date (get-tomorrows-date))
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


(defun process-new-org-files ()
  (let ((files (directory-files-recursively org-note-dir "\\.org$")))
    (cl-loop for file in files do	     
             (unless (or (seq-contains-p org-agenda-files file)
			 (string-match-p "/\\.\\#.*" file))
 	       (add-to-list 'org-agenda-files file)))))

;; init
(setq-default org-agenda-files nil) ;; clear
(process-new-org-files)


;; 自动监视新增的 org files。
(run-with-timer 0 10 'process-new-org-files)

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

(defun org-insert-list-below ()
  "Insert a list item below the current headline."
  (interactive)
  (end-of-line)
  (newline)
  (newline)
  (org-indent-line)
  (insert "  - "))

(setq org-list-demote-modify-bullet '(("+" . "-") ("-" . "+")))

;; 换行
(defun my-org-mode-setup ()
  "Customize settings for Org Mode."
  (setq-local word-wrap t))

;;(add-hook 'org-mode-hook 'my-org-mode-setup)


(global-set-key (kbd "C-c n") 'create-tmp-file)
(global-set-key (kbd "C-c s") 'org-insert-structure-template)
(global-set-key (kbd "C-c e") 'org-pandoc-export-as-markdown)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "s-<return>") 'org-insert-subheading)


(provide 'init-org)
