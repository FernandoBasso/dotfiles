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

;;; https://mbork.pl/2019-02-17_Inserting_the_current_file_name_at_point
;;; https://lists.gnu.org/archive/html/emacs-devel/2019-02/msg00289.html
(defun my/insert-file-name-at-point (&optional full-path)
  "Insert the current filename at point.
With prefix argument, use full path."
  (interactive "P")
  (let* ((buffer
	   (if (minibufferp)
	     (window-buffer
	       (minibuffer-selected-window))
	     (current-buffer)))
	  (filename (buffer-file-name buffer)))
    (if filename
      (insert (if full-path filename (file-name-nondirectory filename)))
      (error (format "Buffer %s is not visiting a file" (buffer-name buffer))))))
