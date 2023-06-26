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

(provide 'init-org)
