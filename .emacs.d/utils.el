;; -*- lexical-binding: nil -*-

(defun my/insert-line-below ()
  "Creates a new line below the current line and moves point to the correct
identation on that line. Point can be anywhere in the starting line,
which is not modified in any way."
  (interactive)
  ;; Move point to the end of the current line.
  (end-of-line)
  ;; Creates the line.
  (open-line 1)
  ;; Move point to the beginning of the newly created line.
  (beginning-of-line 2)
  ;; Move point to the appropriate indentation level.
  (indent-for-tab-command))

(defun my/insert-line-above ()
  "Creates a new line below the current line and moves point to the correct
identation on that line. Point can be anywhere in the starting line,
which is not modified in any way."
  (interactive)
  ;; Move point to the end of the previous line, so open-line actually
  ;; creates a new line above the line point originally was.
  (end-of-line 0)
  ;; Open the line above. Point does not move to the new line.
  (open-line 1)
  ;; Move to the beginning of the new inserted line.
  (beginning-of-line 2)
  ;; Move point to the appropriate indentation level.
  (indent-for-tab-command))
