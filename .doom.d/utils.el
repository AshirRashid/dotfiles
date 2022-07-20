;;; utils.el -*- lexical-binding: t; -*-

(defun formatted-shell-command (command-string)
  (replace-regexp-in-string "\n$" ""
                            (shell-command-to-string command-string)))
