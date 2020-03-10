(package-install 'pyim)
(package-install 'pyim-wbdict)
(package-install 'posframe)

(require 'pyim)
(setq pyim-default-scheme 'wubi)
(setq default-input-method "pyim")

(require 'pyim-wbdict)
(pyim-wbdict-v98-enable)

(require 'posframe)
(setq pyim-page-tooltip 'posframe)

(global-set-key (kbd "C-,") 'toggle-input-method)
(global-set-key (kbd "C-.") 'pyim-punctuation-toggle)

(provide 'init-pyim)

