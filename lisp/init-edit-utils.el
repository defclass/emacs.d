(setq mac-command-modifier 'meta)

(global-set-key (kbd "C-c j") 'join-line)

;;backup
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
   '(("." . "~/.emacs.d/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;;ido
(ido-mode 1)

(desktop-save-mode 1)

(provide 'init-edit-utils)
