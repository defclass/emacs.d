(setq mac-command-modifier 'meta)
(global-linum-mode t)

(global-set-key (kbd "C-c j") 'join-line)

;;backup
(setq backup-by-copying t      
      backup-directory-alist 
      '(("." . "~/.emacs.d/.saves"))    
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)       

(setq auto-save-default nil) 

;;ido
(ido-mode 1)

(desktop-save-mode 1)

;; avy-mode
(require-package 'avy)
(global-set-key (kbd "C-;") 'avy-goto-char)

;;smex
(require-package 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(provide 'init-edit-utils)
