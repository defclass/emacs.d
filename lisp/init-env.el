(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) 
  (load custom-file))

(setenv "PATH" (concat (getenv "PATH") (expand-file-name ":~/bin")))
(setq exec-path (append exec-path (expand-file-name ":~/bin")))

(provide 'init-env)
