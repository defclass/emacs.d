(defvar date-format "%Y-%m-%d")
(defvar datetime-format "%Y-%m-%dT%H:%M:%S")

(defun ensure-dir (dir)
  (progn
    (unless (file-directory-p dir)
      (make-directory dir t))
    dir))

(provide 'init-common)
