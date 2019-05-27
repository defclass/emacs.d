(require-package 'go-mode)


(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(setq exec-path (append exec-path (list (substitute-in-file-name "$HOME/go/bin"))))

(provide 'init-go)
