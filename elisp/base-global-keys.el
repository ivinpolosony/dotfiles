;; Add your keys here, as such

;(global-set-key (kbd "[SHORTCUT]") '[FUNCTION])


;; Make shell more convenient, and suspend-frame less
(global-set-key (kbd "C-z") 'eshell)
(global-set-key (kbd "C-x M-z") 'suspend-frame)



;; Zap to char
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "s-z") (lambda (char) (interactive "cZap up to char backwards: ") (zap-up-to-char -1 char)))

(global-set-key (kbd "M-Z") (lambda (char) (interactive "cZap to char: ") (zap-to-char 1 char)))
(global-set-key (kbd "s-Z") (lambda (char) (interactive "cZap to char backwards: ") (zap-to-char -1 char)))

(global-set-key (kbd "M-;") 'smart-comment)

;; iy-go-to-char - like f in Vim
(global-set-key (kbd "M-m") 'jump-char-forward)
(global-set-key (kbd "M-M") 'jump-char-backward)


;; vim's ci and co commands
(global-set-key (kbd "M-I") 'change-inner)
(global-set-key (kbd "M-O") 'change-outer)

(global-set-key (kbd "s-i") 'copy-inner)
(global-set-key (kbd "s-o") 'copy-outer)



;; Jump to a definition in the current file. (This is awesome)
(global-set-key (kbd "C-x C-i") 'ido-imenu)


;; Completion at point
;; (global-set-key (kbd "C-<tab>") 'completion-at-point) ;; NEED TO CHECK

;; Duplicate region
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; Fold the active region
(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)


(windmove-default-keybindings)

;; GROUP: Editing -> Killing
(setq kill-ring-max 5000 ; increase kill-ring capacity
      kill-whole-line t  ; if NIL, kill whole line and move the next line up
      )

(global-set-key (kbd "M-x") 'helm-M-x)
(use-package counsel
  :bind
  (; ("M-x" . counsel-M-x)
   ("M-y" . counsel-yank-pop)
   ("C-c r" . counsel-recentf)
   ("C-x C-f" . counsel-find-file)
   ("<f1> f" . counsel-describe-function)
   ("<f1> v" . counsel-describe-variable)
   ("<f1> l" . counsel-load-library)
   ("C-h f" . counsel-describe-function)
   ("C-h v" . counsel-describe-variable)
   ("C-h l" . counsel-load-library)))



(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\M-s" 'swiper)
(add-hook 'swiper 'redraw-display)
(setq ivy-display-style 'fancy)
(global-set-key (kbd "C-x C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;; show minibuffer history with Helm
(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

(define-key global-map [remap list-buffers] 'helm-buffers-list)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;;scroll window up/down by one line
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

;; (global-set-key (kbd "M-<up>") 'move-line-up)
;; (global-set-key (kbd "M-<down>") 'move-line-down)
(global-set-key (kbd "M-<up>") 'move-region-up)
(global-set-key (kbd "M-<down>") 'move-region-down)

;; Go to last change

(global-set-key (kbd "C-c b ,") 'goto-last-change)
(global-set-key (kbd "C-c b .") 'goto-last-change-reverse)

(add-hook 'prog-mode-hook (lambda () (highlight-symbol-mode)))
(setq highlight-symbol-on-navigation-p t)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)

(auto-highlight-symbol-mode 1)

;; auto refresh dired when file changes
(add-hook 'dired-mode-hook 'auto-revert-mode)

(defalias 'e 'find-file)

;; Multicursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

  
(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
 (global-set-key [(control tab)] 'shk-tabbar-next)
 (global-set-key [(control shift tab)] 'shk-tabbar-prev)


;; key chords
(require 'key-chord)
;; (setq key-chord-two-keys-delay .015
;;       key-chord-one-key-delay .020)
(key-chord-define-global "BB" 'iswitchb)
(key-chord-define-global "FF" 'find-file)
(key-chord-define-global "xx" 'ivy-switch-buffer)
(key-chord-define-global ";;" 'jump-char-forward)
(key-chord-define-global "::" 'jump-char-backward)
(key-chord-define-global "``" 'goto-last-change)
(key-chord-define-global "~~" 'goto-last-change-reverse)
(key-chord-define-global "YY" 'copy-outer)
(key-chord-define-global "qq" 'avy-goto-line)
(key-chord-define-global "ee" 'dabbrev-expand)
(key-chord-define-global "CC" 'compile)

(key-chord-mode +1)




(provide 'base-global-keys)
