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

(with-eval-after-load 'package-archives
  (add-to-list
   'package-archives
   '("melpa-stable" . "https://stable.melpa.org/packages/")
   t))


(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-iddle-delay 0.7))

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  ;(vertico-buffer-mode))
