@echo off

if "%1"=="" (
   set min=30
)else (
set    min=%1
)

python "%dt%\misc\busy.py" %min%
