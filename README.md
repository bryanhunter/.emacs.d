.emacs.d
========

Emacs configuration

About
-----
This is my Emacs configuarion. It has been cobbled and borrowed from people who know more about Emacs and Emacs Lisp than I do. Here are some of my sources:
	http://www.emacswiki.org/emacs/
	http://www.emacswiki.org/emacs/ESSWindowsAdvice
	https://github.com/boorad/emacs
	https://github.com/overtone/live-coding-emacs.git

Audience
--------
You are more likely to find my configurations useful if:
* you come from a Windows + Visual Studio background
* you want to use Emacs primarily for Erlang development
* you want to use Emacs on both Windows and Linux

If you think I've butchered things please let me know.

How to use these files
----------------------
If you don't already have Emacs install it. I'm using Emacs 23.3.1.
Clone (or download and extract) this repository into your your home directory (Linux "~/" Windows "%HOME%").
Once you have a "~/.emacs.d" directory edit your "~/.emacs" file to require emacs-config by adding these two lines:

<pre>
(add-to-list 'load-path "~/.emacs.d")
(require 'my-config)
</pre>

.. to hook up Erlang mode, edit your "~/.emacs" so that it sets the *erlang-root-dir* variable. 

My "~/.emacs" file looks like this (on both Windows and on Linux):

<pre>
;; Where is Erlang on this machine?
(if (not (boundp 'erlang-root-dir))
    (if (or (eq system-type 'windows-nt)
	    (eq system-type 'ms-dos))
	(setq erlang-root-dir "C:/bin/erlang/erl5.9") ;; Windows
      (setq erlang-root-dir "/usr/local/lib/erlang")) ;; Linux
  )

(add-to-list 'load-path "~/.emacs.d")
(require 'my-config)

(if (or (eq system-type 'windows-nt)
	    (eq system-type 'ms-dos))
	(setq default-directory "C:/code") ;; Windows
      (setq default-directory "~/code")) ;; Linux

</pre>