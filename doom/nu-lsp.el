;; nu-lsp.el --- Nubank lsp functions -*- lexical-binding: t; -*-

;;; Commentary:

;; Nubank common lsp configuration

;;; Code:

;; You can use the lsp-ignore-dirs variable to ignore additional
;; directories when using lsp.
;;
;; E.g. if you are using Doom Emacs you can place the following in
;; your ~/.doom.d/config.el
;;
;; (after! lsp-mode
;;  (setq lsp-file-watch-ignored-directories (append lsp-file-watch-ignored-directories
;;                                                   nu-lsp-ignore-dirs)))

(setq  '("[/\\\\]\\.circleci\\'"
                           "[/\\\\]\\.clj-kondo\\'"
                           "[/\\\\]\\.github\\'"
                           "[/\\\\]\\.lsp\\'"
                           "[/\\\\]\\.node_modules\\'"
                           "[/\\\\]\\.shadow-cljs\\'"
                           "[/\\\\]\\resources/public/js\\'"
                           "[/\\\\]\\resources/public/css\\'"
                           "[/\\\\]target\\'"
                           "[/\\\\]visual-flow\\'"))

(provide 'nu-lsp)

;;; nu-lsp.el ends here
