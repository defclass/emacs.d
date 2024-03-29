(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(defalias 'yes-or-no-p 'y-or-n-p)


(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(global-set-key (kbd "C-c j") 'join-line)

;; 设置新文件的默认编码格式为 UTF-8
(setq-default buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; backup
;; 设置备份文件目录
(setq backup-directory-alist `((".*" . ,(expand-file-name "~/.emacs.d/auto-saves/"))))


;; 空闲 1 秒钟后自动保存
(setq auto-save-default t)
(setq auto-save-timeout 1)
;; 启用直接保存自动保存内容到原始文件
(setq auto-save-visited-file-name t)
;; 启用空闲时自动保存
(run-with-idle-timer auto-save-timeout t #'auto-save-visited-mode)

(defun save-all-buffers ()
  "保存所有未保存的缓冲区"
  (interactive)
  (save-some-buffers t (lambda () (buffer-modified-p))))

;; 当 Emacs 失去焦点时保存所有未保存的缓冲区
(add-hook 'focus-out-hook 'save-all-buffers) 

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

;; 字体大小
(set-face-attribute 'default nil :height 180)

(require-package 'sr-speedbar)
(setq speedbar-use-images nil)
(setq dframe-update-speed t)
(setq sr-speedbar-right-side nil)
(setq speedbar-show-unknown-files t)
(setq sr-speedbar-max-width 40)

(global-set-key (kbd "C-c l") 'sr-speedbar-toggle)

;; 当前 buffer 中删除当前文件

(defun delete-current-file ()
  "Delete the current file associated with the current buffer."
  (interactive)
  (when buffer-file-name
    (let ((filename buffer-file-name))
      (when (yes-or-no-p (format "Move file %s to trash? " filename))
        (move-file-to-trash filename)
        (kill-buffer)))))

(require-package 'git-link)
(global-set-key (kbd "C-c g l") 'git-link)

(use-package iedit :ensure t)

(provide 'init-edit-utils)
