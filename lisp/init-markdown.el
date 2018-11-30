(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(setq markdown-command "/usr/local/bin/pandoc")

(add-hook 'markdown-mode-hook
	  (lambda ()
	    (add-to-list
	     'markdown-code-lang-modes '("puml" . plantuml-mode))))

(provide 'init-markdown)


