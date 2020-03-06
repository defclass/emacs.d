(package-install 'markdown-mode)


(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))


(setq markdown-command "/usr/local/bin/pandoc")

(add-hook 'markdown-mode-hook
	  (lambda ()
	    (add-to-list
	     'markdown-code-lang-modes '("puml" . plantuml-mode))))

(provide 'init-markdown)

