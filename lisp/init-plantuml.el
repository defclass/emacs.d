(package-install 'plantuml-mode)

(setq plantuml-jar-path
      "/usr/local/Cellar/plantuml/1.2018.7/libexec/plantuml.jar")

(add-hook 'plantuml-mode-hook
	  (lambda ()
	    (progn
	      (setq plantuml-output-type "usvg")
	      (define-key plantuml-mode-map (kbd "C-c p")
		'plantuml-preview-current-block))))

(provide 'init-plantuml)
