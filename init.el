(setq package-archives '(("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;; load path
(add-to-list 'load-path "/home/shifeng/.emacs.d/lisp/")
;; set c mode indent
;;(add-hook 'c-mode-common-hook (lambda ()
;;      (local-set-key (kbd "RET") 'newline-and-indent)))

(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; turn on company mode
(global-company-mode t)

;; turn on global linum-mode
(global-linum-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   '("d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" default))
 '(package-selected-packages
   '(yaml ggtags helm-gtags helm-projectile ace-window company-ansible company-anaconda flycheck highlight-indentation anaconda-mode yaml-mode smex smartparens popwin popup monokai-theme hungry-delete counsel company-math company-c-headers)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; no backup
(setq-default make-backup-files nil)

;; load theme monokai
(load-theme 'monokai t)

(electric-indent-mode t)

;; turn on recentf mode
(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; set key <f4> to func open-my-init-file
(global-set-key (kbd "<f4>") 'open-my-init-file)

;; turn on delete-selection-mode
(delete-selection-mode t)

;; turn on hungry-delete-mode
(global-hungry-delete-mode t)

;; turn on show paren-mode
(show-paren-mode t)

;; change cursor type
(setq-default cursor-type 'bar)

;; turn on recentf mode
(recentf-mode t)
(setq recentf-max-menu-items 25)

;; set key to recentf-mode
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


;; turn on auto revert mode to auto load init.el when changed
(global-auto-revert-mode t)

;; turn on smartparens
(smartparens-global-mode t)

;; turn on smex
(global-set-key (kbd "M-x") 'smex)

(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want swiper to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h C-f") 'counsel-describe-function)
(global-set-key (kbd "C-h C-v") 'counsel-describe-variable)

(add-hook 'Python 'python-mode)

;; turn on hight light line
(global-hl-line-mode t)

;; turn off scroll bar
(scroll-bar-mode -1)
(popwin-mode t)


;; 缩进
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; 补全
(global-set-key (kbd "s-/") 'hippie-expand)

;; alias
(fset 'yes-or-no-p 'y-or-n-p)

;; dired
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)
;;(require 'dired)
;;(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

(with-eval-after-load 'dired
		      (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


;; 将company的M-n M-p 修改为C-n C-p
(with-eval-after-load 'company
		      (define-key company-active-map (kbd "M-n") nil)
		      (define-key company-active-map (kbd "M-p") nil)
		      (define-key company-active-map (kbd "C-n") #'company-select-next)
		      (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; delete word backward
(global-set-key (kbd "C-w") 'backward-kill-word)

(smartparens-global-mode t)
;; disable pair "'" for emacs-lisp-mode
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;; disable pair "`" for emacs-lisp-mode
(sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)

(sp-local-pair 'org-mode "`" nil :actions nil)

(add-to-list 'company-backends 'company-c-headers)

;; for anaconda-mode
(add-hook 'python-mode 'anaconda-mode)

(add-hook 'python-mode 'anaconda-eldoc-mode)


;; for highlight-indentation
(highlight-indentation-mode t)
(highlight-indentation-current-column-mode t)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

;; set for flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; add company anaconda to company backends
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

(add-hook 'python-mode-hook 'anaconda-mode)

;; add company-ansible to company ends
(add-to-list 'company-backends 'company-ansible)

;; add ace-window configuration
(global-set-key (kbd "M-o") 'ace-window)

;; load helm-projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-enable-caching t)
;; set ggtags on
(ggtags-mode 1)
;; hide tool-bar
(tool-bar-mode 0)
;; hide menu bar
(menu-bar-mode 0)
;; inhibit splash screen
(setq inhibit-splash-screen t)

;; maximize window
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; enable ggtags
(add-hook 'c-mode-common-hook
	  (lambda()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	      (ggtags-mode 1))))


;; enable projectile
(projectile-mode t)

;; set projectile-project-search-path
(setq projectile-project-search-path '("/home/shifeng/"))

;; set key map for projectile
(with-eval-after-load 'projectile
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

