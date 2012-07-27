(require 'flymake)

;; Indentation styles : gnu, k&r, bsd, stroustrup, linux, python, java, whitesmith, ellemtel, and awk
(setq c-default-style
           '((java-mode . "java")
             (awk-mode . "awk")
             (other . "k&r")))


;; Add language configurations
(add-to-list 'load-path (concat (file-name-directory load-file-name) "erlang-rig/"))
(require 'erlang-config)

(add-to-list 'load-path (concat (file-name-directory load-file-name) "csharp-rig/"))
(require 'csharp-config)

(add-to-list 'load-path (concat (file-name-directory load-file-name) "fsharp-rig/"))
(require 'fsharp-config)

(add-to-list 'load-path (concat (file-name-directory load-file-name) "clojure-rig/"))
(require 'clojure-mode)

(add-to-list 'load-path (concat (file-name-directory load-file-name) "haskell-rig/"))
(require 'haskell-mode)
(load "haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)


(dolist (hook (list
               'c-mode-hook
		))
  (add-hook hook 'flymake-find-file-hook))

;; flymake-shell
(add-hook 'sh-mode-hook 'flymake-shell-load)

;; flymake extension
(setq flymake-extension-use-showtip t)  ;use `shotip' display error or warning.


;; Add Git mode
(setq load-path (cons (concat (file-name-directory load-file-name) "magit") load-path))
(require 'magit)

;; Markdown mode
(autoload 'markdown-mode "markdown-mode"
	"Major mode for editing Markdown files" t)
    (setq auto-mode-alist
    	(cons '("\\.markdown" . markdown-mode) auto-mode-alist))


(provide 'emacs-modes)
