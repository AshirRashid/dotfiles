;;; bindings.el -*- lexical-binding: t; -*-

(global-set-key (kbd "C-c >") 'grow-horizontally)
(global-set-key (kbd "C-c <") 'shrink-horizontally)
(global-set-key (kbd "C-c .") 'grow-horizontally)
(global-set-key (kbd "C-c ,") 'shrink-horizontally)
(global-set-key (kbd "C-c e") 'math-eval-and-replace)
(global-set-key (kbd "C-c s") 'sortout-doc-open)

(setq initial-major-mode 'org-mode)
