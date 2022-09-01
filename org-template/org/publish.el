;;; package --- Publishing Functions
;;; Commentary:
;;; Makes sure to publish to all desired formats.
;;; publish.el -*- lexical-binding: t; -*-

;;; Code:

(setq org-export-with-toc nil)
(setq org-publish-project-alist
      '(("project"
        :base-directory "."
        :base-extension "org"
        :publishing-directory ".."
        :publishing-function org-gfm-publish-to-gfm
        :recursive t
        ;;:makeindex t
      )))
(setq format ".md")

(org-publish "project" t)

(setq org-export-with-toc t)
(setq org-publish-project-alist
      '(("project"
        :base-directory "."
        :base-extension "org"
        :publishing-directory "../public"
        :publishing-function org-html-publish-to-html
        :recursive t
        ;;:makeindex t
      )
        ("org-static"
         :base-directory "../resources"
         :base-extension "png\\|jpg\\|jpeg\\|gif\\|svg\\|html\\|css\\|js"
         :publishing-directory "../public"
         :recursive t
         :publishing-function org-publish-attachment
)))
(setq format ".html")

(org-publish "project" t)
