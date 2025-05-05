

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq
       kdoom-big-font-increment 2
       confirm-kill-emacs nil
       doom-localleader-key ",")



;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;(setq doom-theme 'doom-rouge)
;(setq doom-theme 'doom-rouge)
(setq doom-theme 'tsdh-light)
(setq doom-font (font-spec :size 14))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(use-package! cider
  :after clojure-mode
  :config
  (setq cider-ns-refresh-show-log-buffer nil
        cider-show-error-buffer 'only-in-repl
        cider-auto-select-error-buffer nil
        cider-test-show-report-on-success t
        cider-auto-select-test-report-buffer nil
        cider-font-lock-dynamically nil ; use lsp semantic tokens
        cider-eldoc-display-for-symbol-at-point nil ; use lsp
        cider-prompt-for-symbol nil)
  (set-popup-rule! "*cider-test-report*" :side 'right :width 0.3)
  (set-popup-rule! "^\\*cider-repl" :side 'right :width 0.3 :quit nil)
  (set-lookup-handlers! 'cider-mode nil) ; use lsp
  (add-hook 'cider-mode-hook (lambda () (remove-hook 'completion-at-point-functions #'cider-complete-at-point))) ; use lsp
  )

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(add-hook 'clojure-mode-hook #'evil-cleverparens-mode)

;; Enabling auto save mode
(setq auto-save-visited-mode t)
(setq auto-save-visited-interval 0.5)
(custom-set-variables
  '(auto-save-visited-mode t))

(load! "+bindings")

;; Github Copilot
;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))
(defcustom copilot-indent-offset-warning-disable nil
  "Disable indentation warnings.

Warning occurs when the function `copilot--infer-indentation-offset' cannot
find indentation offset."
  :group 'copilot
  :type 'boolean)
(setq copilot-indent-offset-warning-disable t)

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

