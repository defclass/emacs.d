(defvar temp-config-file "~/.emacs.d/lisp/init-temp-el.el")
(defvar org-note-dir "~/note/org-note")
(defvar temp-dir "~/note/tmp")
(defvar date-format "%Y-%m-%d")
(defvar datetime-format "%Y-%m-%dT%H:%M:%S")

(defun config ()
  (interactive)
  (find-file temp-config-file))

(defun ensure-dir (dir)
  (progn
    (unless (file-directory-p dir)
      (make-directory dir t))
    dir))

(defun daily ()
  (interactive)
  (let* ((daily-name (format-time-string "%Y-%m-%d"))
	 (note-dir (ensure-dir org-note-dir))
	 (file-name (format "%s/%s.org" note-dir daily-name))
	 (date (format-time-string date-format)))
    (if (file-exists-p file-name)
	(progn
	  (find-file file-name)
	  (goto-char (point-max)))
      (progn
	(find-file file-name)
	(insert (format "#+title: Journal %s with ♥\n#+author: Michael Wong\n\n* " date date))))))

(defun insert-current-date ()
  (interactive)
  (insert (format-time-string date-format)))

(defun insert-current-datetime ()
  (interactive)
  (insert (format-time-string datetime-format)))


(defun note-dir ()
  (interactive)
  (let ((directory (ensure-dir org-note-dir)))
    (find-file  directory)))

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

(require 'org-tempo)


(global-set-key (kbd "C-c n") 'create-tmp-file)
(global-set-key (kbd "C-c s") 'org-insert-structure-template)
(global-set-key (kbd "C-c e") 'org-pandoc-export-as-markdown)

;; 字体大小
(set-face-attribute 'default nil :height 180)

(provide 'init-temp-el)
