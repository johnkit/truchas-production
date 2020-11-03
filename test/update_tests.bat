@echo off
Rem Get working directory
set script_dir=%~dp0
echo %script_dir%

set pyscript=%script_dir:~0,-1%\test-pages\compile-tests.py
set specs_dir=%script_dir:~0,-1%\test-specs
set static_dir=%script_dir:~0,-1%\..\docs\test-pages

python %pyscript% %specs_dir% %static_dir%
Rem C:\Apps\Python39\python --version
