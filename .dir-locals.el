;;; .dir-locals.el ---                               -*- lexical-binding: t; -*-

;; Copyright (C) 2018 Seong Yong-ju

;; Author: Seong Yong-ju <sei40kr@gmail.com>

((haskell-mode . ((quickrun-option-cmd-alist .
                    ((:command . "stack")
                      (:exec "%c runghc %o %s %a"))))))
