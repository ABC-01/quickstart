@echo off

echo Deploying updates to GitHub...

rmdir /S /Q docs

:: Build the project.
:: if using a theme, replace with `hugo -t <YOURTHEME>`
hugo

:: Go To docs folder
::cd doc
:: Add changes to git.
git add .

set msg=rebuilding site %date% %time%
git commit -m "%msg%"

:: Push source and build repos.
git push origin master

:: Come Back up to the Project Root
::cd ..

echo ok