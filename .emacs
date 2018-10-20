(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-unstable")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (solarized-theme evil-commentary evil-paredit paredit evil-args evil-exchange evil-leader evil-surround evil)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ; '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 90 :width normal)))))

;; Get Paredit.
(add-to-list 'load-path "~/.emacs.d/elisp")
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

;; Automatically enable Paredit when editing Lisp and in SLIME.
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
;; Stop SLIME's REPL from grabbing DEL, which is annoying when backspacing over a '('.
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

(require 'evil)
(evil-mode 1)

(require 'evil-surround)
(require 'evil-leader)
(require 'evil-exchange)
(require 'evil-args)
(require 'evil-commentary)

;;; Map "jk" as the general purpose escape key sequence.
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "jk" 'evil-normal-state)

(require 'paredit)
(require 'evil-paredit)

;;; Use the solarized dark theme.
(load-theme 'solarized-dark t)

;;; Pretty lambdas.
(defun my-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          )))

(add-hook 'lisp-mode-hook 'my-pretty-lambda)
(add-hook 'scheme-mode-hook 'my-pretty-lambda)
(global-prettify-symbols-mode 1)

;;; SLIME customization.
(make-directory "/tmp/slime-fasls/" t)
(setq slime-compile-file-options '(:fasl-directory "/tmp/slime-fasls/"))
(setq slime-repl-history-remove-duplicates t)
(setq slime-repl-history-trim-whitespaces t)
