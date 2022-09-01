# -*- mode: org; -*-

# GENERAL header
#+PROPERTY: header-args :mkdirp yes :dir . :exports both :noweb strip-export
# SHELL header
#+PROPERTY: header-args:shell :results output :wrap example
# PYTHON header
#+PROPERTY: header-args:python :session Python :results output :wrap example
# C header
#+PROPERTY: header-args:C :includes <stdlib.h> <stdio.h> <ctype.h> <assert.h> :flags -Wall -Werror -std=gnu99 -g -I . :results output :wrap example :main no
# SQL header
#+PROPERTY: header-args:sql :engine postgresql :dbhost localhost :dbuser albertovaldez :database PH-EmployeeDB :results output :wrap export html
# GO header
#+PROPERTY: header-args:go :results output :wrap example
# JAVASCRIPT header
#+PROPERTY: header-args:js :results output :wrap example
# ELISP header
#+PROPERTY: header-args:elisp :wrap example

#+NAME: python_version
#+begin_src shell :exports none
python --version
#+end_src

#+RESULTS: python_version
#+begin_example
Python 3.7.13
#+end_example
