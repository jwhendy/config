;; set load paths
;; set load dirs and global config options
(add-to-list 'load-path "~/.elisp/org.git/lisp/")
(add-to-list 'load-path "~/.elisp/org.git/contrib/lisp")
(add-to-list 'load-path "~/.elisp/site-lisp/ess/lisp/")


;; extras
(add-to-list 'load-path "~/.elisp/site-lisp/")
(add-to-list 'load-path "~/.elisp/site-lisp/ox-ravel/")
;;(add-to-list 'load-path "~/.elisp/site-lisp/git-modes/")
;;(add-to-list 'load-path "~/.elisp/site-lisp/magit/")


;; setup babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((latex . t)
   (emacs-lisp . t)
   (org . t)
   (R . t)
   (sh . t)
   (python .t )))

;; load org-based config
(org-babel-load-file "~/org/aux/emacs-config.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(openwith-associations (quote (("\\.pdf\\'" "evince" (file)) ("\\.mp3\\'" "vlc" (file)) ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mov\\)\\'" "vlc" ("-idx" file)) ("\\.\\(?:jp?g\\|png\\)\\'" "geeqie" (file)) ("\\.\\(?:odg\\|odt\\|docx\\|doc\\)\\'" "soffice" (file)) ("\\.\\(?:odp\\|ppt\\|pptx\\)\\'" "soffice" (file)) ("\\.\\(?:xls\\|xlsx\\|ods\\)\\'" "soffice" (file)))))
 '(org-agenda-files (quote ("~/org" "~/org/aux/contacts.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
