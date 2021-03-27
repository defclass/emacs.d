(require 'package)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; (add-to-list 'package-archives
;; 	     '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

(dolist (source '(("marmalade" . "http://elpa.emacs-china.org/marmalade/")
                  ("melpa" . "http://elpa.emacs-china.org/melpa/")
                  ("org" . "http://elpa.emacs-china.org/org/")))
  (add-to-list 'package-archives source t))

;; (add-to-list 'package-archives
;;   '("melpa" . "http://melpa.milkbox.net/packages/"))

;; (add-to-list 'package-archives
;; 	     '("marmalade" . "http://marmalade-repo.org/packages/"))

;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/"))


;; Initialize all the ELPA packages (what is installed using the packages commands)
(package-initialize)
(require 'init-env)
(require 'init-epla)
(require 'init-edit-utils)
(require 'init-plantuml)
(require 'init-emacs-lisp)
(require 'init-auto-complete)
(require 'init-clojure)
(require 'init-paredit)
(require 'init-go)
(require 'init-nginx)
(require 'init-ivy)
(require 'init-pyim)
