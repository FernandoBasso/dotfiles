;;
;; Fernando Basso
;;


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "84890723510d225c45aaff941a7e201606a48b973f0121cb9bcb0b9399be8cba" default))
 '(magit-push-arguments nil)
 '(package-selected-packages
   '(racket-mode solarized-theme typescript-mode editorconfig geiser gruvbox-theme projectile neotree paredit haskell-mode org-plus-contrib magit htmlize zenburn-theme color-theme which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flyspell-duplicate ((t (:underline (:color "#7c6f64" :style wave)))))
 '(flyspell-incorrect ((t (:underline (:color "#9d0006" :style wave)))))
 '(racket-xp-def-face ((t (:inherit match :background "pale goldenrod" :foreground "dark magenta" :underline t))))
 '(racket-xp-use-face ((t (:inherit match :background "pale goldenrod" :foreground "dark magenta")))))

;;
;; CUSTOM SETTINGS
;;
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

