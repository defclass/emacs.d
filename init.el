(require 'package)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(dolist (source '(("melpa" . "https://melpa.org/packages/")
		  ("melpa-stable" . "https://stable.melpa.org/packages/")))
  (add-to-list 'package-archives source t))


;; Initialize all the ELPA packages (what is installed using the packages commands)

(package-initialize)
(require 'init-env)
(require 'init-epla)
(require 'init-edit-utils)
(require 'init-plantuml)
(require 'init-markdown)
(require 'init-emacs-lisp)
(require 'init-auto-complete)
(require 'init-clojure)
(require 'init-paredit)
(require 'init-go)
(require 'init-nginx)
(require 'init-ivy)
(require 'init-pyim)
