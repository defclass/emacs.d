(defvar temp-config-file "~/.emacs.d/lisp/init-temp-el.el")

(defun config ()
  (interactive)
  (find-file temp-config-file))

(defun insert-current-date ()
  (interactive)
  (insert (format-time-string date-format)))

(defun insert-current-datetime ()
  (interactive)
  (insert (format-time-string datetime-format)))


(provide 'init-temp-el)

