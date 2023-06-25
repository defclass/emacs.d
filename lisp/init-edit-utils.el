;;(setq mac-command-modifier 'meta)
(global-linum-mode t)
(setq column-number-mode t)


(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq make-backup-files nil)


(global-set-key (kbd "C-c j") 'join-line)

;; backup
;; 不要 # 号开头的文件。
(setq auto-save-default nil)
;; 空闲 5 秒钟后自动保存
(setq auto-save-timeout 1)
;; 启用直接保存自动保存内容到原始文件
(setq auto-save-visited-file-name t)
;; 启用空闲时自动保存
(run-with-idle-timer auto-save-timeout t #'auto-save-visited-mode)


;; 启用全局自动刷新模式
(global-auto-revert-mode t)


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
