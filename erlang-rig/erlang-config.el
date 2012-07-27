;;;; Lines to copy into your personalized .emacs file...
;; (if (not (boundp 'erlang-root-dir)) 
;;    (if (or (eq system-type 'windows-nt) 
;;	    (eq system-type 'ms-dos)) 
;;	(setq erlang-root-dir "C:/bin/erlang/erl5.9") ;; Windows
;;      (setq erlang-root-dir "/usr/local/lib/erlang")) ;; Linux
;; )


(if 
    (not (boundp 'erlang-root-dir)) 
    (message "Skipping erlang-mode: erlang-root-dir not defined. To hook up erlang mode, set erlang-root-dir in your .emacs file before the call to 'require my-config'.") 
  (progn 
    (set 'erlang-bin (concat erlang-root-dir "/bin/")) 
    (set 'erlang-lib (concat erlang-root-dir "/lib/")) 
    (if 
	(not (boundp 'erlang-mode-path)) 
	(set 'erlang-mode-path 
	     (concat 
	      erlang-lib 
	      (file-name-completion "tools-" erlang-lib) 
	      "emacs/erlang.el"))) 
    (if 
	(and 
	 (file-readable-p erlang-mode-path) 
	 (file-readable-p erlang-bin)) 
	(progn 
	  (message "Setting up erlang-mode") 
	  (set 'exec-path (cons erlang-bin exec-path)) 
	  (set 'load-path (cons 
			   (concat 
			    erlang-lib 
			    (file-name-completion "tools-" erlang-lib) 
			    "emacs") 
			   load-path)) 
	  (set 'load-path (cons (file-name-directory erlang-mode-path) load-path)) 
	  (require 'erlang-start)
	  (require 'rebar-config)	  
	  (require 'erlang-flymake)
	  (require 'erlang-eunit)
	  

	  (add-hook 'erlang-mode-hook
	  (lambda ()
	    (setq inferior-erlang-machine-options 
		  '(
		    	"-sname" "emacs" 
		    	"-pz" "ebin deps/*/ebin apps/*/ebin" 
			"-boot" "start_sasl"
		    ))
	    (imenu-add-to-menubar "imenu")))
	  ) 
	  (message "Skipping erlang-mode: %s and/or %s not readable" erlang-bin erlang-mode-path)))) 

(provide 'erlang-config)
