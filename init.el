(package-initialize)
(require 'ob-tangle)
(org-babel-load-file
 (expand-file-name "configuracion.org"
                   user-emacs-directory))

(toggle-debug-on-error)
(toggle-debug-on-quit) ;; Se activa cuando el usuario presiona C-g


;;Cargar archivo para habilitación de Python
(unless (file-exists-p (expand-file-name "elpa/archives/melpa" user-emacs-directory))
  (package-refresh-contents))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(require 'use-package)
(load-file (expand-file-name "paquetes.el" user-emacs-directory))

;; carga un agregado para cuando se escriben correos usando mu4e
(load-file (expand-file-name "site-packages/u-vm-color/u-vm-color.el" user-emacs-directory))
(ignore-errors 
  (load-file "~/quicklisp/slime-helper.el")
  (setf inferior-lisp-program "sbcl"))
