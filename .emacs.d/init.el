; Added by Package.el.  This must come before configurations of
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
   '("4eb6fa2ee436e943b168a0cd8eab11afc0752aebb5d974bba2b2ddc8910fca8f" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" "83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" "78c4238956c3000f977300c8a079a3a8a8d4d9fee2e68bad91123b58a4aa8588" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "84890723510d225c45aaff941a7e201606a48b973f0121cb9bcb0b9399be8cba" default))
 '(magit-push-arguments nil)
 '(package-selected-packages
   '(helm-ag helm heml sublimity-scroll sublimity-attractive sublimity diff-hl git-gutter solarized-theme typescript-mode editorconfig geiser gruvbox-theme projectile neotree paredit haskell-mode org-plus-contrib magit htmlize zenburn-theme color-theme which-key racket-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flyspell-duplicate ((t (:underline (:color "#7c6f64" :style wave)))))
 '(flyspell-incorrect ((t (:underline (:color "#9d0006" :style wave)))))
 '(racket-xp-def-face ((t (:inherit match :background "pale goldenrod" :foreground "dark magenta" :underline t))))
 '(racket-xp-use-face ((t (:inherit match :background "pale goldenrod" :foreground "dark magenta")))))


(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq frame-title-format "%b | Always Be Awesome!")
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)

(global-set-key (kbd "C-c t l") 'toggle-truncate-lines)

(save-place-mode 1)
(savehist-mode 1)


;; For terminal non-blinking cursor. See C-h m Emacs RET m Cursor Display RET.
(setq visible-cursor nil)

(setq backup-directory-alist `(("." . "~/Projects/dotfiles/tmp/emacs_stuff")))

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 175
                    :weight 'semibold
                    :width 'normal)
(setq-default line-spacing 0.0)

(set-face-italic 'font-lock-comment-face nil)

(global-visual-line-mode t)

(setq visual-line-fringe-indicators
      '(left-curly-arrow right-curly-arrow))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "epiphany")

(global-display-line-numbers-mode t)
(setq linum-format "%4d \u2502")

(setq show-trailing-whitespace t)
(setq delete-trailing-lines nil)
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
; (add-hook 'before-save-hook 'delete-blank-lines)
;; Use spaces.
(setq-default indent-tabs-mode nil)
(setq tab-width 2)




(blink-cursor-mode -1)
(xterm-mouse-mode)

;; Restore cursor position
(if (version< emacs-version "25.0")
(progn
  (require 'saveplace)
  (setq-default save-place t))
(save-place-mode 1))




;;
; Disable show-trailing-whitespace on Info mode because we sometimes
; see some ugly whitespace markers at the end of lines and we can't
; change that. One such example is when we are viewing the Table Of
; Contents (with the command ‘T’ in an info page).
;
(add-hook 'Info-mode-hook
               (lambda ()
                 (setq show-trailing-whitespace nil)))



(require 'package)

(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)

(add-to-list 'package-archives
           '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq package-enable-at-startup nil)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org
  :mode (("\\.org$" . org-mode))
  :ensure org-plus-contrib
  :config)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package haskell-mode
  :ensure t)

;;;
;;; • https://wiki.haskell.org/Emacs/Inferior_Haskell_processes#Interactive_Haskell_mode
;;; • https://github.com/haskell/haskell-mode/wiki/Haskell-Interactive-Mode-Setup
;;;

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)


(setq
 haskell-process-type 'stack-ghci
 haskell-interactive-popup-errors nil
 haskell-process-path-ghci "stack"
 ;; https://github.com/haskell/haskell-mode/issues/1695
 haskell-interactive-types-for-show-ambiguous nil)

(use-package paredit
  :ensure t
  :config
  (dolist (m '(emacs-lisp-mode-hook
               eval-expression-minibuffer-setup-hook
               ielm-mode-hook
               lisp-mode-hook
               lisp-interaction-mode-hook
               scheme-mode-hook
               racket-mode-hook))
    (add-hook m #'paredit-mode))

  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
  (show-paren-mode 1))


(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (scheme . t)
   (ruby . t)
   (haskell . t)))

;; Ask (t) or don't ask (nil) for confirmation to evaluate?
(setq org-confirm-babel-evaluate nil)

(use-package flyspell
  :ensure t)

;; Somehow started causing racket-mode not to work, even
;; when trying to active racket-mode manually.
;(use-package geiser
;  :ensure t
;  :hook (scheme-mode . geiser-mode)
;  :config
;  (setq geiser-active-implementations '(racket chicken)))

(use-package racket-mode
  :ensure t
  :mode "\\.rkt\\'")

(require 'racket-xp)
(add-hook 'racket-mode-hook #'racket-xp-mode)

(setq racket-documentation-search-location 'local)

(add-hook 'racket-repl-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))

;;
; Geiser and Chicken Scheme
;
(use-package geiser
  :ensure t
  :mode "\\.scm\\'")

(use-package geiser-chicken
  :ensure t
  :mode "\\.scm\\'")

(setq geiser-active-implementations '(chicken))

;(setq auto-mode-alist (append '(("\\.rkt$" . racket-mode))
;                              '(("\\.scm$" . geiser-mode))))

(add-to-list 'auto-mode-alist '("\\.rkt$" . racket-mode))

;;
; For geiser and chicken scheme, we need geiser-mode for the repl
; goodies and scheme-mode so colors and some other thigns work as
; expected.
;
(add-to-list 'auto-mode-alist '("\\.scm$" . scheme-mode))
(add-hook 'scheme-mode-hook #'geiser-mode)

;;
; org-mode
;
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-default-notes-file "~/Sync-pCloud/org-mode/tempnotes.org")
(define-key global-map "\C-cc" 'org-capture)

(setq org-agenda-files (list "~/Sync-pCloud/org-mode/"))

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-src-window-setup 'current-window)
(setq org-edit-src-content-indentation 0)
(setq org-goto-interface 'outline-path-completion)
(setq org-outline-path-complete-in-steps nil)
(setq org-html-htmlize-output-type 'css)

;; Bigger Latex Fragments
(plist-put org-format-latex-options :scale 1.5)

(use-package htmlize
  :ensure t)

(use-package vscode-icon
  :ensure t
  :commands (vscode-icon-for-file))

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'vscode)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))

(global-set-key [f4] 'neotree-toggle)
(setq neo-window-width 32)

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package helm
  :ensure t)

(use-package helm-ag
  :ensure t)

(setq org-todo-keywords
      '((sequence
         "TODO(t)"
         "WORKING(w)"
         "PAUSED(p)"
         "WAIT(W)"
         "VERIFY(v)"
         "|"
         "DELEGATED(D)"
         "CANCELED(c)"
         "DONE(d)")))

(use-package gruvbox-theme
  :ensure t)

(load-theme 'gruvbox-light-hard)

(use-package diff-hl
  :ensure t
  :config (global-diff-hl-mode))

