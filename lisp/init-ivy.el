(require-package 'counsel)

(ivy-mode 1)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
(global-set-key (kbd "C-c b") 'counsel-bookmark)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(provide 'init-ivy)

