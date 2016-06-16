;; Cider &  nREPL
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'turn-on-eldoc-mode)



;; clj-refactor
(require 'clj-refactor)
(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) 
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(provide 'init-clojure)
