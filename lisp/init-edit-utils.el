(global-set-key (kbd "C-c j") 'join-line)

(setq mac-command-modifier 'meta)

;;backup
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
   '(("." . "~/.emacs.d/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups


(provide 'init-edit-utils)
