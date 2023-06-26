(setq linum-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)


(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq make-backup-files nil)


(global-set-key (kbd "C-c j") 'join-line)

;; backup
(setq auto-save-default t)

(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/autosaves/") t)))

;; 空闲 1 秒钟后自动保存
(setq auto-save-timeout 1)
;; 启用直接保存自动保存内容到原始文件
(setq auto-save-visited-file-name t)
;; 启用空闲时自动保存
(run-with-idle-timer auto-save-timeout t #'auto-save-visited-mode)


;; 启用全局自动刷新模式
(global-auto-revert-mode t)


;;helm
(require-package 'helm)

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (global-set-key (kbd "C-x b") 'helm-buffers-list))

(desktop-save-mode 1)


;; smex
(require-package 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; 80 column, default on
(toggle-truncate-lines 1)
;; (setq-default auto-fill-function 'do-auto-fill)
;; (setq-default fill-column 80)

;; org
(setq org-hide-leading-stars t)

(require-package 'sr-speedbar)
(setq speedbar-use-images nil)
(setq dframe-update-speed t)
(setq sr-speedbar-right-side nil)
(setq speedbar-show-unknown-files t)
(setq sr-speedbar-max-width 40)
(global-set-key (kbd "C-c l") 'sr-speedbar-toggle)


(require-package 'git-link)
(global-set-key (kbd "C-c g l") 'git-link)


(use-package iedit :ensure t)

(provide 'init-edit-utils)
