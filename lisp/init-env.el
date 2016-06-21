(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) 
  (load custom-file))

(setenv "PATH" (concat (getenv "PATH") (concat ":" (substitute-in-file-name "$HOME/bin"))))
(setq exec-path (append exec-path (list (substitute-in-file-name "$HOME/bin"))))

(provide 'init-env)
