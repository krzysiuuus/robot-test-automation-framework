@echo off
cd /d "%~dp0.."

call venv\Scripts\activate.bat

echo =====================================
echo Running tests on Selenium Grid - Chrome
echo =====================================

pabot --processes 3 ^
--outputdir results/chrome-grid ^
-v EXECUTION:REMOTE ^
-v BROWSER:Chrome ^
page_object_pattern/tests

echo.

echo =====================================
echo Running tests on Selenium Grid - Firefox
echo =====================================

pabot --processes 3 ^
--outputdir results/firefox-grid ^
-v EXECUTION:REMOTE ^
-v BROWSER:Firefox ^
page_object_pattern/tests

echo.

echo =====================================
echo Running tests on Selenium Grid - Edge
echo =====================================

pabot --processes 3 ^
--outputdir results/edge-grid ^
-v EXECUTION:REMOTE ^
-v BROWSER:Edge ^
page_object_pattern/tests

echo.
echo =====================================
echo Selenium Grid execution finished.
echo =====================================

pause