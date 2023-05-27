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
     '("d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" "4eb6fa2ee436e943b168a0cd8eab11afc0752aebb5d974bba2b2ddc8910fca8f" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" "83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" "78c4238956c3000f977300c8a079a3a8a8d4d9fee2e68bad91123b58a4aa8588" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "84890723510d225c45aaff941a7e201606a48b973f0121cb9bcb0b9399be8cba" default))
 '(helm-source-names-using-follow '("Org Agenda Files"))
 '(magit-push-arguments nil)
  '(package-selected-packages
     '(slime quelpa emojify helm-org-ql org-ql imenu-list markdown-mode yasnippet helm-rg helm-projectile helm-ag helm heml sublimity-scroll sublimity-attractive sublimity diff-hl git-gutter solarized-theme typescript-mode editorconfig geiser gruvbox-theme projectile neotree paredit haskell-mode org-plus-contrib magit htmlize zenburn-theme color-theme which-key racket-mode use-package))
  '(safe-local-variable-values
     '((org-blank-before-new-entry
         (heading . auto)
         (plain-list-item . auto))
        (org-list-description-max-indent . 5)
        (org-list-two-spaces-after-bullet-regexp)
        (org-confirm-babel-evaluate))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flyspell-duplicate ((t (:underline (:color "#7c6f64" :style wave)))))
 '(flyspell-incorrect ((t (:underline (:color "#9d0006" :style wave)))))
 '(markdown-code-face ((t nil)))
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

;;
;; Custom customizatoins like allowed, trusted themes, setting
;; variables through the UI, etc. can be stored in a separate file.
;;
;; This is local per machine and not committed to my dotfiles.
;;
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Customizations.html
;;
(setq custom-file "~/work/local/emacs.d/emacs-custom.el")
(load "~/work/local/emacs.d/emacs-custom.el")

;; For terminal non-blinking cursor. See C-h m Emacs RET m Cursor Display RET.
(setq visible-cursor nil)

(setq backup-directory-alist `(("." . "~/work/src/dotfiles/tmp/emacs_stuff"))):

(set-face-attribute 'default nil
                    ;:family "Source Code Pro"
                    :family "CaskaydiaCove Nerd Font"
                    :height (cond
                             ((eq system-type 'gnu/linux) 135)
                             ((eq system-type 'darwin) 175)
                             (t 150))
                    :weight 'semibold
                    :width 'normal)

(setq-default line-spacing 0.1)


(set-face-italic 'font-lock-comment-face nil)

(global-visual-line-mode t)

(setq visual-line-fringe-indicators
      '(left-curly-arrow right-curly-arrow))

(setq browse-url-browser-function browse-url-firefox-program)

(if (eq system-type 'darwin)
    (setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "open"
          browse-url-generic-args '("-a" "Firefox Developer Edition"))
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "firefox-dev"))

;;;;
;; I prefer to enable line numbers manually only in certain
;; situations.
;;
(setq global-display-line-numbers nil)
(setq display-line-numbers nil)
(setq linum-format "%4d \u2502")

(setq show-trailing-whitespace t)
(setq delete-trailing-lines nil)
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
; (add-hook 'before-save-hook 'delete-blank-lines)
;; Use spaces.
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;;
;; Many text-related modes like markdown-mode and rst-mode also seem
;; to trigger text-mode, so, let's use text-mode-hook to turn on
;; auto-fill-mode by default in these types of buffer.
;;
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

;;
;; The package `whitespace` comes bundled with Emacs.
;;
(require 'whitespace)
(setq whitespace-style '(tabs tab-mark))
(global-whitespace-mode 1)
(setq
 whitespace-display-mappings
 '(
   (space-mark ?\ [?\u00B7])
   (newline-mark ?\n [?$ ?\n])
   ;; Hard tab is ␉ followed by a normal space.
   (tab-mark ?\t [?\u2409 ?\u0020])))


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
             '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq package-enable-at-startup nil)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))

(require 'quelpa-use-package)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))

(global-set-key [f6] 'org-latex-preview)

;;
;; The docs say ‘convert’, but it is clearly only working
;; with ‘imagemagick’.
;;
(setq org-preview-latex-default-process 'imagemagick)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (scheme . t)
   (ruby . t)
   (haskell . t)))

(require 'ox-md)

(use-package org-ql
  :quelpa (org-ql :fetcher github :repo "alphapapa/org-ql"
            :files (:defaults (:exclude "helm-org-ql.el"))))

(use-package helm-org-ql
  :quelpa (helm-org-ql :fetcher github :repo "alphapapa/org-ql"
                       :files ("helm-org-ql.el")))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/Cloud/pCloud/OrgRoamNotes")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  (vertico-buffer-mode))

(use-package deft
  :ensure t
  :after org
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory org-roam-directory))

(use-package org-download
  :ensure t
  :after org
  :config
  (setq-default
   org-download-image-dir "assets"
   ;; Basename setting seems to be simply ignored.
   org-download-screenshot-basename ".org.png"
   org-download-timestamp "org_%Y%m%d-%H%M%S_"
   org-download-heading-lvl nil)
  :custom
  (org-download-screenshot-method
   (cond
    ((eq system-type 'gnu/linux)
     "xclip -selection clipboard -t image/png -o > '%s'")
    ((eq system-type 'darwin)
     "pngpaste %s")))
  :bind
  (:map org-mode-map
        (("C-M-y" . org-download-screenshot)
         ("s-y" . org-download-yank))))

(use-package typescript-mode
  :ensure t
  :config
  (setq-default typescript-indent-level 2))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package imenu-list
  :ensure t
  :bind (("C-'" . imenu-list-smart-toggle))
  :config
  (setq imenu-list-focus-after-activation t
        imenu-list-auto-resize nil))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;;;;
;; With this package, it is possible to run org-roam-node-find in a
;; case insensitive (ignore case) style.
;;
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package yasnippet
  :ensure t
  :config
  ;;;;
  ;; We need to set `yas-snippet-dirs' BEFORE enabling the global mode.
  ;; https://emacs.stackexchange.com/questions/10523/yasnippet-configuration-does-not-persist-across-emacs-runs/10531#10531
  (setq yas-snippet-dirs '("~/work/src/dotfiles/.emacs.d/my-yasnippets"))
  (yas-global-mode 1)
  ;;;;
  ;; For some reason, when snippets are expanded, the indentation is
  ;; messed up, even though it is correct in the snippet file/definition.
  ;; This seems to have solved the problem.
  (setq yas-indent-line nil)
  ;;;;
  ;; Avoid expanded snippets to insert newlines after their expanded text.
  ;;
  (setq-default mode-require-final-newline nil)
  (setq-default require-final-newline nil))


;;;;
;; Simulate global snippets using fudamental-mode snippets.
;;
;; https://github.com/joaotavora/yasnippet/issues/557
;;
(add-hook 'yas-minor-mode-hook
          (lambda ()
            (yas-activate-extra-mode 'fundamental-mode)))


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
 haskell-interactive-types-for-show-ambiguous nil
 haskell-stylish-on-save t)


;;;;
;; Enabling eval-expression-minibuffer-setup-hook causes
;; <CR> on minibuffer eval expressions just to create a
;; newline without actually running the code.
;;
(use-package paredit
  :ensure t
  :config
  (dolist (m '(emacs-lisp-mode-hook
               ielm-mode-hook
               lisp-mode-hook
               lisp-interaction-mode-hook
               scheme-mode-hook
               racket-mode-hook))
    (add-hook m #'paredit-mode))

 (autoload
   'enable-paredit-mode
   "paredit"
   "Turn on pseudo-structural editing of Lisp code."
   t)

  (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
  (show-paren-mode 1))

;;;;
;; Open org links on the same window, not on the left
;; or right existing ones.
;;
(setq org-link-frame-setup
      '((file . find-file)
        (vm . vm-visit-folder-other-frame)
        (vm-imap . vm-visit-imap-folder-other-frame)
        (gnus . org-gnus-no-new-news)
        (wl . wl-other-frame)))

;; Ask (t) or don't ask (nil) for confirmation to evaluate?
(setq org-confirm-babel-evaluate nil)

(use-package flyspell
  :ensure t)

;; Somehow started causing racket-mode not to work, even
;; when trying to active racket-mode manually.
;;(use-package geiser
;;  :ensure t
;;  :hook (scheme-mode . geiser-mode)
;;  :config
;;  (setq geiser-active-implementations '(racket chicken)))

(use-package geiser-chicken
  :ensure t)

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

(setq inferior-lisp-program
  (cond
    ((eq system-type 'gnu/linux) "/usr/bin/sbcl")
    ((eq system-type 'darwin) "/usr/local/bin/sbcl")
    (t (message "inferior-lisp-program: Where is SBCL in this system‽"))))

(use-package slime
  :ensure t)

(add-hook 'slime-repl-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)))

;;
; org-mode
;
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-set-key "\C-cc" 'org-content)

(define-key global-map "\C-cc" 'org-capture)

(use-package org-ql
  :ensure t)

(use-package helm-org-ql
  :ensure t
  :config
  (global-set-key (kbd "C-c q") 'helm-org-ql-agenda-files))

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-src-window-setup 'current-window)
(setq org-edit-src-content-indentation 0)
(setq org-goto-interface 'outline-path-completion)
(setq org-outline-path-complete-in-steps nil)
(setq org-html-htmlize-output-type 'css)

;;
;; With this, we can set images the width we want inside org
;; buffer. For example:
;;
;;  #+ATTR_ORG: :width 600
;;  [[./images/gnu.png]]
;;
(setq org-image-actual-width nil)

(setq org-html-html5-fancy t)
(setq org-html-doctype "html5")

;;
;; Hide *bold*, /italic/, ~code~, =verbatim= and +strike-through+ symbols.
;;
(setq org-hide-emphasis-markers t)

;;
;; Hidding the markers and having these colors look OK and readable
;; with gruvbox-light-hard theme.
;;
(setq org-emphasis-alist
      '(("*" bold)
        ("/" italic)
        ("_" underline)
        ("+" (:strike-through t :foreground "gray"))
        ("=" (:foreground "magenta"))
        ("~" (:foreground "maroon"))))

;; Bigger Latex Fragments
(plist-put org-format-latex-options :scale 1.5)


;;
;; Sets org-publish-project-alist, agenda files and a few other
;; related things.
;;
(load "~/work/local/emacs.d/org-mode.el")

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

(use-package neotree
  :ensure t
  :config
  (global-set-key [f4] 'neotree-toggle)
  (setq neo-window-width 32))

(use-package treemacs
  :ensure t
  :defer t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

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
  :ensure t
  :config
  ;;
  ;; `C-x c` is too similar to `C-x C-c` which closes emacs.
  ;;
  ;(global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-c c")))

(use-package helm-rg
  :ensure t
  :config
  (global-set-key (kbd "C-c h r") 'helm-rg)
  ;;
  ;; Looks like helm-rg searches from the pwd of the current
  ;; open file. Until I find a better way to handle this, let's
  ;; make it always search from the root instead.
  ;;
  (setq helm-rg-default-directory 'git-root))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (global-set-key (kbd "C-c h f") 'helm-projectile-find-file))

(setq helm-split-window-default-side 'right)


(setq org-todo-keywords
      '((sequence
         "TODO(t)"
         "WORKING(w)"
         "PAUSED(p)"
         "WAIT(W)"
         "VERIFY(v)"
         "|"
         "DELEGnATED(D)"
         "CANCELED(c)"
         "DONE(d)")))


(use-package gruvbox-theme
  :ensure t)

(load-theme 'gruvbox-light-hard)

(use-package diff-hl
  :ensure t
  :config (global-diff-hl-mode))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JavaScript
;;
(setq js-indent-level 2)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Moving between windows
;;
;; Similar to vim where we use hjkl to move left, down, up, and right.
;;
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some hachish stuff to experiment with hiding and
;; showing src blocks interactively in org files.
;;

(defvar my/bg-block "#fbf2d3")
(defvar my/bg-line "#f9f0cf")
(defvar my/fg-line "#c8b882")

(set-face-attribute 'org-block nil
                    :background my/bg-block)

(defun blkhide ()
  (interactive)
  (set-face-attribute
   'org-block-begin-line nil
   :background my/bg-block
   :foreground my/bg-block)

    (set-face-attribute
   'org-block-end-line nil
   :background my/bg-block
   :foreground my/bg-block))

(defun blkshow ()
  (interactive)
  (set-face-attribute
   'org-block-begin-line nil
   :background my/bg-line
   :foreground my/fg-line)

    (set-face-attribute
   'org-block-end-line nil
   :background my/bg-line
   :foreground my/fg-line))

(global-set-key (kbd "C-c c h") #'blkhide)
(global-set-key (kbd "C-c c s") #'blkshow)

(set-face-attribute
 'org-block nil
 :background "#fbf2d3")

