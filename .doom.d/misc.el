;;; misc.el -*- lexical-binding: t; -*-

(load-file "/Users/ashir/.doom.d/utils.el")
(load-file "/Users/ashir/.doom.d/bindings.el")


(defun open-meeting-note ()
  "Opens Gantom meeting note for the next meeting"
  (interactive)
  (find-file
   (shell-command-to-string "/Users/ashir/personal/scripts/others/get_meeting_note_path.sh")))


(defun sortout-doc-open ()
  "Opens '~/Sync/Dump/sortout.org'. Use when you feel lost
and wish to sort things out"
  (interactive)
  (find-file "~/Sync/Dump/sortout.org"))


;; <easier resizing>
(defun grow-horizontally ()
  (interactive)
  (evil-window-increase-width 18))


(defun shrink-horizontally ()
  (interactive)
  (evil-window-decrease-width 18))
;; </easier resizing>


(defun gdscript-jumpto-func ()
  "Select a function to jump to from a list of all functions defined in the active buffer"
  (interactive)
  (setq grep-out (shell-command-to-string (format "grep -E \"^func \" '%s'" (buffer-file-name))))
  (setq func-options (split-string (shell-command-to-string (format "echo -n '%s' | cut -d' ' -f2-" grep-out)) "\n" t))
  (setq selected-func-partial-header (completing-read "Choose the function to jump to: " func-options))
  (or
   (search-forward (format "func %s" selected-func-partial-header) nil t)
   (search-backward (format "func %s" selected-func-partial-header))))


(defun eval-expression-inplace (start end)
  (interactive "r")
  (message "starts at %s and ends at %s" start end))


(defun math-eval-and-replace (start end)
  (interactive "r")
  (let ((math-exp (buffer-substring-no-properties start end)))
    (filter-buffer-substring start end t)
    (insert
     (formatted-shell-command (format "echo '%s' | bc" math-exp)))))
