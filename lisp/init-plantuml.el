(package-install 'plantuml-mode)

(setq plantuml-default-exec-mode 'jar)

(setq plantuml-jar-path
      (expand-file-name "/opt/homebrew/Cellar/plantuml/1.2024.6/libexec/plantuml.jar"
			"plantuml-1.2024.6.jar"))

(add-hook 'plantuml-mode-hook
	  (lambda ()
	    (progn
	      (setq plantuml-output-type "usvg")
	      (define-key plantuml-mode-map (kbd "C-c p")
		'plantuml-preview-current-block))))

(provide 'init-plantuml)
