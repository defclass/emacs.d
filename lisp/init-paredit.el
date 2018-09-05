;; ;; paredit
(package-install 'paredit)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode 'paredit-mode)

(show-paren-mode 1)

(provide 'init-paredit)
