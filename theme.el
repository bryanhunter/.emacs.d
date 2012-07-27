;; color-theme (http://www.emacswiki.org/emacs/ColorTheme)
(add-to-list 'load-path (concat (file-name-directory load-file-name) "color-theme/"))
(require 'color-theme)
(color-theme-initialize)

;; Turn off the annoying bell	
(setq visible-bell 1)

(setq my-color-themes (list 'color-theme-clarity
			    'color-theme-calm-forest 
			    'color-theme-goldenrod 
			    'color-theme-robin-hood	
			    'color-theme-gnome2
			    'color-theme-ld-dark
			    'color-theme-xemacs 
			    ))


(defun my-theme-set-default () ; Set the first row
  (interactive)
  (setq theme-current my-color-themes)
  (funcall (car theme-current)))

(defun my-describe-theme () ; Show the current theme
  (interactive)
  (message "%s" (car theme-current)))

(defun my-theme-cycle ()		
  (interactive)
  (setq theme-current (cdr theme-current))
  (if (null theme-current)
      (setq theme-current my-color-themes))
  (funcall (car theme-current))
  (message "%S" (car theme-current)))

(setq theme-current my-color-themes)
(setq color-theme-is-global nil) ; Initialization
(my-theme-set-default)
(global-set-key [f12] 'my-theme-cycle)	


;; 	The value is in 1/10pt, so 100 will give you 10pt, etc.
(custom-set-faces
 '(default ((t (
		:inherit nil 
			 :stipple nil 
			 :background "black" 
			 :foreground "white" 
			 :inverse-video nil 
			 :box nil 
			 :strike-through nil 
			 :overline nil 
			 :underline nil 
			 :slant normal 
			 :weight normal
			 :height 140 	;; The value is in 1/10pt, so 100 will give you 10pt, etc.
			 :width normal
			 :foundry "unknown" 
			 ;;:family "Proggy Square"
			 ;;:family "Neep"
			 ;;:family "Proggy Clean"
			 ;;:family "Lucida Console"
			 ;;:family "DejaVu Sans" ;; You can download this lovely font here: http://dejavu-fonts.org/wiki/Download
			 ;;:family "Inconsolata" ;;http://www.levien.com/type/myfonts/inconsolata.html
			 ;;:family "Monospace"
			 ;;:family "Consolas"
			 ;;:family "Ubuntu Mono"
			 )))))

(if (or (eq system-type 'windows-nt)
	    (eq system-type 'ms-dos))
	(set-face-attribute 'default nil :font "Consolas") ;; Windows
      (set-face-attribute 'default nil :font "Ubuntu Mono")) ;; Linux

(provide 'theme)
