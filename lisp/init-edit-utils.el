(setq mac-command-modifier 'meta)
(global-linum-mode t)
(setq column-number-mode t)


(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq make-backup-files nil)


(global-set-key (kbd "C-c j") 'join-line)

;; backup
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

;; smex
(require-package 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; 80 column, default on
(toggle-truncate-lines 1)
;; (setq-default auto-fill-function 'do-auto-fill)
;; (setq-default fill-column 80)


;;  by drawing a thin line
;; (require-package 'fill-column-indicator)

;; (define-globalized-minor-mode global-fci-mode
;;   fci-mode (lambda () (fci-mode 1)))

;; (global-fci-mode 1)
;; (setq fci-rule-column 81) ;; should be 80, have some bug? 
;; (setq fci-style 'shading)

(require-package 'sr-speedbar)
(setq speedbar-use-images nil)
(setq dframe-update-speed t)
(setq sr-speedbar-right-side nil)
(setq speedbar-show-unknown-files t)
(setq sr-speedbar-max-width 40)
(global-set-key (kbd "C-c l") 'sr-speedbar-toggle)


(require-package 'git-link)
(global-set-key (kbd "C-c g l") 'git-link)



(provide 'init-edit-utils)
