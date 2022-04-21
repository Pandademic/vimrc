;;; package --- summary:
;;; Commentary:
(require 'package)
;;; Code:
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")

                         ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(package-initialize)
;;(package-refresh-contents)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(unless (package-installed-p 'avy)
  (package-install 'avy))
(unless (package-installed-p 'company)
  (package-install 'company))
(unless (package-installed-p 'dashboard)
  (package-install 'dashboard))
(unless (package-installed-p 'evil)
  (package-install 'evil))
(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))
(unless (package-installed-p 'evil-nerd-commenter)
  (package-install 'evil-nerd-commenter))
(unless (package-installed-p 'format-all)
  (package-install 'format-all))
(unless (package-installed-p 'git-gutter)
  (package-install 'git-gutter))
(unless (package-installed-p 'helm)
  (package-install 'helm))
(unless (package-installed-p 'helm-projectile)
  (package-install 'helm-projectile))
(unless (package-installed-p 'lsp-treemacs)
  (package-install 'lsp-treemacs))
(unless (package-installed-p 'lsp-julia)
  (package-install 'lsp-julia))
(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))
(unless (package-installed-p 'rust-mode)
  (package-install 'rust-mode))
(unless (package-installed-p 'julia-mode)
  (package-install 'julia-mode))
(unless (package-installed-p 'lsp-ui)
  (package-install 'lsp-ui))
(unless (package-installed-p 'magit)
  (package-install 'magit))
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))
(unless (package-installed-p 'which-key)
  (package-install 'which-key))
(unless (package-installed-p 'winum)
  (package-install 'winum))
(unless (package-installed-p 'xclip)
  (package-install 'xclip))
(unless (package-installed-p 'helm-themes)
  (package-install 'helm-themes))
(unless (package-installed-p 'helm-rg)
  (package-install 'helm-rg))
(unless (package-installed-p 'helm-ag)
  (package-install 'helm-ag))
(unless (package-installed-p 'undo-fu)
  (package-install 'undo-fu))
(unless (package-installed-p 'centaur-tabs)
  (package-install 'centaur-tabs))
(unless (package-installed-p 'all-the-icons)
  (package-install 'all-the-icons))
(unless (package-installed-p 'tree-sitter)
  (package-install 'tree-sitter))

(use-package tree-sitter
  :ensure t
  :init (global-tree-sitter-mode))

(use-package all-the-icons
  :ensure t)

(use-package rust-mode
  :ensure t)
(use-package julia-mode
  :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-modeline-diagnostics-scope :workspace)
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c++-mode . lsp-deferred)
         (julia-mode . lsp-deferred)
         (rust-mode . lsp-deferred)
         (prog-mode . rainbow-delimiters-mode)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-defered))

;; optionally
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  :config
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-imenu-enable nil)
  (setq lsp-ui-flycheck-enable nil)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-delay 0.5)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-ignore-duplicate t))
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
;;(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;;(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
					;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :config
  (which-key-mode))

(use-package helm
  :ensure t
  :hook (after-init . (lambda() (helm-mode 1))))

(use-package projectile
  :ensure t
  :init
  (projectile-mode 1)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)))

(use-package evil-leader
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "bf" 'format-all-buffer
    "bb" 'helm-buffers-list
    "ci" 'evilnc-comment-or-uncomment-lines
    "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
    "cc" 'evilnc-copy-and-comment-lines
    "cp" 'evilnc-comment-or-uncomment-paragraphs
    "cr" 'comment-or-uncomment-region
    "cv" 'evilnc-toggle-invert-comment-line-by-line
    "ft" 'treemacs
    "sg" 'projectile-grep
    "sr" 'projectile-ripgrep
    "ss" 'projectile-ag
    "0"  'winum-select-window-0-or-10
    "1"  'winum-select-window-1
    "2"  'winum-select-window-2
    "3"  'winum-select-window-3
    "4"  'winum-select-window-4
    "5"  'winum-select-window-5
    "6"  'winum-select-window-6
    "7"  'winum-select-window-7
    "8"  'winum-select-window-8
    "9"  'winum-select-window-9
    "m"  'lsp-mode-map
    "p"  'projectile-command-map)
  :ensure t
  :hook (after-init . (lambda ()
			(global-evil-leader-mode))))

(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 1
	company-idle-delay 0.1) ;; default is 0.2
  :bind (:map company-active-map
              ([tab]     . #'company-complete-common-or-cycle)
              ("TAB"     . #'company-complete-common-or-cycle)
              ("S-TAB"   . #'company-select-previous-or-abort)
              ([backtab] . #'company-select-previous-or-abort)
              ([S-tab]   . #'company-select-previous-or-abort))
  :hook (after-init . (lambda ()
			(global-company-mode))))

;; -------- avy --------
(use-package avy
  :config
  (define-key evil-normal-state-map (kbd "s") 'avy-goto-char-2))

(use-package helm-projectile
  :init
  (setq helm-projectile-fuzzy-match t)
  (helm-projectile-on))


;; -------- evil nerd commenter --------
(evilnc-default-hotkeys t t)

;; -------- git gutter --------
(use-package git-gutter
  :ensure t
  :hook (after-init . (lambda ()
			(global-git-gutter-mode)))
  :config
  (global-set-key (kbd "C-x C-g") 'git-gutter)
  (global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
  ;; Jump to next/previous hunk
  (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
  (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
  ;; Stage current hunk
  (global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)
  ;; Revert current hunk
  (global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)
  ;; Mark current hunk
  (global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk))

;; -------- treemacs config --------
(use-package treemacs
  :ensure t
  :defer t
  :init
  (defvar treemacs-no-load-time-warnings t)
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         35
          treemacs-workspace-switch-cleanup      nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

;;(use-package treemacs-icons-dired
;;  :after treemacs dired
;;  :ensure t
;;  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package treemacs-persp ;;treemacs-persective if you use perspective.el vs. persp-mode
  :after treemacs persp-mode ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package lsp-julia
  :config
  (setq lsp-julia-format-indent 2)
  ;; (setq lsp-julia-default-environment "~/.julia/environments/v1.6")
  )

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-set-navigator t))

(use-package recentf
  :config
  (setq
   recentf-max-saved-items 10000
   recentf-max-menu-items 5000
   )
  (recentf-mode 1)
  (run-at-time nil (* 5 60) 'recentf-save-list)
  )

;; -------- other config --------
;; set scroll style
(setq scroll-conservatively 101)
(electric-pair-mode 1)
(menu-bar-mode -1)
(show-paren-mode 1)
(tool-bar-mode -1)
(winum-mode 1)
(xclip-mode 1)
(load-theme 'tango-dark t)
(set-terminal-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers 'relative)
 '(helm-minibuffer-history-key "M-p")
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(helm-ag helm-rg avy xclip winum which-key use-package rainbow-delimiters projectile magit lsp-ui helm format-all evil-surround evil-nerd-commenter evil-leader evil-collection dashboard company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
