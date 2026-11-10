;; -*- lexical-binding: nil -*-
;;
;; https://emacs.stackexchange.com/questions/85745/how-to-totally-and-completely-remove-the-no-lexical-binding-warning
;;

;;
;; Very simple init.el that makes the UI clean and with a very
;; basic, but useful set of configs.
;;

;;;;
;; Make emacs show only the buffer with a very clean interface.
;;
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;;;
;; Emacs window (frame) title.
;;
(setq frame-title-format "%b :: Be Awesome!")

;;;;
;; Non-blinking cursor in the terminal. See:
;;
;;  C-h i m Emacs RET m Cursor Display RET
;;
(setq visible-cursor nil)

;;;;
;; And non-blinking cursor for the Emacs GUI.
;;
(blink-cursor-mode -1)

;;;;
;; Shows the line and column number on the modeline.
;;
(setq column-number-mode t)

;;;;
;; Got to the last point position when you previously visited the
;; same file.
;;
(save-place-mode 1)

;;;;
;; Remember the minibuffer history between sessions.
;;
(savehist-mode 1)

;;;;
;; Custom customizatoins like trusted themes, setting variables through
;; the UI, etc. can be stored in a dedicated file.
;;
;; This is local per machine and not committed to my dotfiles.
;;
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Customizations.html
;;
(setq custom-file "~/source/dotfiles/.emacs.d/emacs-custom.el")

;;;;
;; Where to store temporary files.
;;
(setq backup-directory-alist `(("." . "~/Temp/Emacs")))

;;;;
;; Visually indicate line continuation, especially when toggle-truncate-lines
;; is active.
;;
(setq visual-line-fringe-indicators
      '(left-curly-arrow right-curly-arrow))

;;;;
;; I prefer to enable line numbers manually only in certain
;; situations.
;;
(setq global-display-line-numbers nil)
(setq display-line-numbers nil)
(setq linum-format "%4d \u2502")

;;;;
;; And make identation with two spaces by default.
;;
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;;;;
;; What to do about trailing whitespaces and lines.
;;
;; NOTE: Many other modes, like REPLs and output windows will show
;; uggly trailing whitespace markers. Those can be disabled for specific
;; cases as necessary.
;;
(setq show-trailing-whitespace t)
(setq-default show-trailing-whitespace t)
(setq delete-trailing-lines nil)

;;
; Disable show-trailing-whitespace on Info mode because we sometimes
; see some ugly whitespace markers at the end of lines and we can't
; change that. One such example is when we are viewing the Table Of
; Contents (with the command ‘T’ in an info page).
;
(add-hook 'Info-mode-hook
  (lambda ()
    (setq show-trailing-whitespace nil)))

;;;;
;; The default browser to open URLs.
;;
;; Without the require, it complains the variable is nil when
;; starting Emacs, but works with C-x C-e because after emacs
;; is fully loaded, the variable is set.
;;
;; Could solve with with-eval-after-load as well.
;;
;(require 'browse-url)
(with-eval-after-load 'browse-url
  (setq browse-url-browser-function browse-url-firefox-program))


;;;;
;; Need to handle opening the browser differently on different
;; operating systems.

(if (eq system-type 'darwin)
    (setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "open"
          browse-url-generic-args '("-a" "Firefox Developer Edition"))
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "firefox"))


;;;;
;; General, global keymaps.
;;
(global-set-key (kbd "C-c t l") 'toggle-truncate-lines)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Moving between windows
;;
;; Similar to vim where we use hjkl to move left, down, up, and right.
;; The function says “move”, but it does't move the window, instead,
;; move to the window (jump there).
;;
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)

;;;;
;; When I run something like C-h k or C-h f, and Emacs shows a new help
;; window with the content to read, point is still on the original
;; place. I constantly find myself having to C-x o to go to the new
;; window so that I can press q to close it. With this, it always places
;; point on the new “ephemeral” windows so it can be navigated and
;; quickly closed with q. Point then goes back to the original window.
;;
(setq help-window-select t)

(require 'package)

(add-to-list
  'package-archives
  '("melpa-stable" . "https://stable.melpa.org/packages/")
  t)

(add-to-list
  'package-archives
  '("nongnu" . "https://elpa.nongnu.org/nongnu/")
  t)

(package-initialize)

(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-iddle-delay 0.7))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;;;;
;; https://github.com/Alexander-Miller/treemacs
;;
(use-package treemacs
  :ensure t
  :config
  (setq treemacs-is-never-other-window t)
  :bind
  (:map global-map
    ("<f4>" . treemacs)
    ("M-0" . treemacs-select-window)
    ("C-x t 1" . treemacs-delete-other-windows)))

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
  (global-set-key (kbd "C-x g") 'magit-status)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  ;;;;;
  ;; Display vertico like a regular, large buffer, either on the left,
  ;; right, top or bottom (depending on the current layout and where
  ;; point is).
  ;;
  (vertico-buffer-mode))

(use-package consult
  :ensure t
  ;; Replace bindings. Lazily loaded by `use-package'.
  :bind (;; C-c bindings in `mode-specific-map'
          ("C-c M-x" . consult-mode-command)
          ("C-c h" . consult-history)
          ("C-c k" . consult-kmacro)
          ("C-c m" . consult-man)
          ("C-c i" . consult-info)
          ([remap Info-search] . consult-info)

          ;; C-x bindings in `ctl-x-map'

          ("C-x M-:" . consult-complex-command) ;; orig. repeat-complex-command
          ("C-x b" . consult-buffer) ;; orig. switch-to-buffer
          ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
          ("C-x 5 b" . consult-buffer-other-frame) ;; orig. switch-to-buffer-other-frame
          ("C-x t b" . consult-buffer-other-tab) ;; orig. switch-to-buffer-other-tab
          ("C-x r b" . consult-bookmark)         ;; orig. bookmark-jump
          ("C-x p b" . consult-project-buffer) ;; orig. project-switch-to-buffer

          ;; Custom M-# bindings for fast register access
          ("M-#" . consult-register-load)
          ("M-'" . consult-register-store) ;; orig. abbrev-prefix-mark (unrelated)
          ("C-M-#" . consult-register)

          ;; Other custom bindings
          ("M-y" . consult-yank-pop) ;; orig. yank-pop

          ;; M-g bindings in `goto-map'
          ("M-g e" . consult-compile-error)
          ("M-g r" . consult-grep-match)
          ("M-g f" . consult-flymake)   ;; Alternative: consult-flycheck
          ("M-g g" . consult-goto-line) ;; orig. goto-line
          ("M-g M-g" . consult-goto-line) ;; orig. goto-line
          ("M-g o" . consult-outline) ;; Alternative: consult-org-heading
          ("M-g m" . consult-mark)
          ("M-g k" . consult-global-mark)
          ("M-g i" . consult-imenu)
          ("M-g I" . consult-imenu-multi)
          ;; M-s bindings in `search-map'
          ("M-s d" . consult-find) ;; Alternative: consult-fd
          ("M-s c" . consult-locate)
          ("M-s g" . consult-grep)
          ("M-s G" . consult-git-grep)
          ("M-s r" . consult-ripgrep)
          ("M-s l" . consult-linel)
          ("M-s L" . consult-line-multi)
          ("M-s k" . consult-keep-lines)
          ("M-s u" . consult-focus-lines)
          ;; Isearch integration
          ("M-s e" . consult-isearch-history)
          :map isearch-mode-map
          ("M-e" . consult-isearch-history) ;; orig. isearch-edit-string
          ("M-s e" . consult-isearch-history) ;; orig. isearch-edit-string
          ("M-s l" . consult-line) ;; needed by consult-line to detect isearch
          ("M-s L" . consult-line-multi) ;; needed by consult-line to detect isearch
          ;; Minibuffer history
          :map minibuffer-local-map
          ("M-s" . consult-history) ;; orig. next-matching-history-element
          ("M-r" . consult-history)) ;; orig. previous-matching-history-element

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Tweak the register preview for `consult-register-load',
  ;; `consult-register-store' and the built-in commands.  This improves the
  ;; register formatting, adds thin separator lines, register sorting and hides
  ;; the window mode line.
  (advice-add #'register-preview :override #'consult-register-window)
  (setq register-preview-delay 0.5)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
    xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
    consult-theme :preview-key '(:debounce 0.2 any)
    consult-ripgrep consult-git-grep consult-grep consult-man
    consult-bookmark consult-recent-file consult-xref
    consult-source-bookmark consult-source-file-register
    consult-source-recent-file consult-source-project-recent-file
    :preview-key "M-."
    :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (keymap-set consult-narrow-map (concat consult-narrow-key " ?") #'consult-narrow-help)
  )

;;;;
;; Enabling eval-expression-minibuffer-setup-hook causes <CR> on
;; minibuffer eval expressions just to create a newline without actually
;; running the code.
;;
(use-package paredit
  :ensure t
  :config
  (dolist (m '(emacs-lisp-mode-hook
                ielm-mode-hook
                lisp-mode-hook
                lisp-interaction-mode-hook
                scheme-mode-hook
                racket-mode-hook
                clojusre-ts-mode-hook))
    (add-hook m #'paredit-mode))

  (autoload
    'enable-paredit-mode
    "paredit"
    "Turn on pseudo-structural editing of Lisp code."
    t)

  (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
  (show-paren-mode 1))

;;;;
;; Avoid conflict with consult M-s search/find functions.
;;
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "<M-s>") nil)
     (define-key paredit-mode-map (kbd "<M-S-s>") 'paredit-splice-sexp)))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hoook 'global-company-mode))

;;;;
;; https://devhowto.gitlab.io/editors/emacs/spell-checking.html
;;
(use-package flyspell
  :ensure t)

;;;;
;; https://github.com/bbatsov/adoc-mode
;;
(use-package adoc-mode
  :ensure t
  :init
  :custom-face
  (adoc-title-0-face ((t (:height 1.2 :weight bold))))
  (adoc-title-1-face ((t (:height 1.1 :weight bold))))
  (adoc-title-2-face ((t (:height 1.0 :weight bold))))
  :config
  (customize-set-variable 'adoc-title-scaling nil)
  (set-face-attribute
    'fixed-pitch
    nil
    :family  (face-attribute 'default :family)
    :height 1.0)
  ;;;;
  ;; Face for link::<url>[name of the link].
  ;;
  (set-face-attribute
    'adoc-superscript-face
    nil
    :family  (face-attribute 'default :family)
    :height 1.0)
  ;;;;
  ;; Face for image::<url>[alt text].
  ;;
  (set-face-attribute
    'adoc-secondary-text-face
    nil
    :family (face-attribute 'default :family)
    :height 1.0)
  (set-face-attribute 'adoc-code-face nil :inherit 'default)
  (add-hook 'adoc-mode-hook (lambda ()
                              (turn-off-auto-fill)
                              (visual-line-mode -1)
                              (setq-local compile-command "echo hello "))))


(use-package typescript-mode
  :ensure t
  :config
  (setq-default typescript-indent-level 2))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package org-download
  :ensure t
  :after org
  :config
  (setq-default
   org-download-image-dir "__assets"
   ;; Basename setting seems to be simply ignored.
   org-download-screenshot-basename ".org.png"
   org-download-timestamp "%Y-%m-%d_"
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

;;
; org-mode
;
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-set-key "\C-cc" 'org-content)

(define-key global-map "\C-cc" 'org-capture)

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

;;;;
;; Bigger Latex Fragments.
;;
;(plist-put org-format-latex-options :scale 1.5)

;(require 'treesit)
;(setopt treesit-font-lock-level 4)
;(use-package treesit-auto
;  :ensure t
;  :config
;  (treesit-auto-add-to-auto-mode-alist 'all)
;  (global-treesit-auto-mode t))

;;
;; https://github.com/emacs-tree-sitter/treesit-fold
;;
;; Folding feature based on the build-in tree-sitter support in Emacs 29+.
;;
;(use-package treesit-fold
;  :ensure t
;  :config
;  (global-treesit-fold-mode)
;  (global-treesit-fold-indicators-mode)
;  :bind (:map treesit-fold-mode-map
;          ("C-c f t" . treesit-fold-toggle)
;          ("C-c f o" . treesit-fold-open)
;          ("C-c f r o" . treesit-fold-open-recursively)
;          ("C-c f c" . treesit-fold-close)
;          ("C-c f O" . treesit-fold-open-all)
;          ("C-c f C" . treesit-fold-close-all)
;          ("C-c f n" . treesit-fold-next-fold)
;          ("C-c f p" . treesit-fold-previous-fold)))

;;;;
;; Copied from https://github.com/bbatsov/emacs.d/blob/master/init.el
;;
(defun nuke-loaded-themes ()
  "Nuke all loaded themes."
  (interactive)
  (dolist (theme custom-enabled-themes)
    (disable-theme theme))
  (message "Themes nuked"))

;;(use-package doom-themes
;;  :ensure t
;;  :custom
;;  (doom-themes-enable-italic nil)
;;  :config
;;  ;(load-theme 'doom-solarized-light t)
;;  )

(load-theme 'tsdh-light)

(use-package nerd-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 26))


;;;;
;; Find fonts with fc-list & grep. Examples:
;;
;;   $ fc-list : family | grep -i mono
;;   $ fc-list : family | grep -i nerd
;;   $ fc-list : family | grep -i '\(hurmit\|hermit\|source\|sauce\)'
;;
(cond
  ((eq system-type 'gnu/linux)
    (set-face-attribute
      'default nil
      ;:family "JetBrainsMono Nerd Font"
      :family "UbuntuMono Nerd Font"
      ;family "Hurmit Nerd Font Mono"
      ;:family "BlexMono Nerd Font"
      ;:family "SpaceMono Nerd Font Mono"
      ;:family "Source Code Pro"
      :height 130
      :width 'normal
      :weight 'normal))
  ((eq system-type 'darwin)
    (set-face-attribute
      'default nil
      :family "SauceCodePro Nerd Font Mono"
      :height 145
      :width 'expanded
      ;:weight 'semibold
      )))

(setq-default line-spacing 0.3)
