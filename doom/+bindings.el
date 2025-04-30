;;; bindings.el -*- lexical-binding: t; -*-
;;; s is super
;;; S is shift

(map!
      :desc "slurp forward"
      "<s-right>" #'lsp-clojure-forward-slurp

      :desc "barf forward"
      "<s-left>" #'lsp-clojure-forward-barf

      :desc "Expand region"
      "M-=" #'er/expand-region

      :desc "Reverse expand region"
      "M--" (lambda () (interactive) (er/expand-region -1))

      :leader
      "c f" #'lsp-format-buffer

      :desc "navigate tabs easier-ly"
      :leader
      "<right>" #'tab-next
      :leader
      "<left>" #'tab-previous

      :desc "navigate buffers faster"
      :leader
      "]" #'next-buffer
      :leader
      "[" #'previous-buffer

      :leader
      :desc "Search project +vertico/project-search"
      "s p" #'+vertico/project-search)

(map! "s-=" nil)
(map! "s--" nil)
