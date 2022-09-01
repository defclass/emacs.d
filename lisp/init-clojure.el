;; Cider &  nREPL
(package-install 'clojure-mode)
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'turn-on-eldoc-mode)

;; clj-refactor
(defun clojure-refactor-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) 
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(setq cljr-warn-on-eval nil)

(add-hook 'clojure-mode-hook #'clojure-refactor-hook)

(provide 'init-clojure)
