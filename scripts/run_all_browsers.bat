@echo off
cd /d "%~dp0.."

call venv\Scripts\activate.bat

echo =====================================
echo Running tests on Chrome
echo =====================================

robot -d results/chrome -v EXECUTION:LOCAL -v BROWSER:Chrome page_object_pattern/tests

echo.

echo =====================================
echo Running tests on Firefox
echo =====================================

robot -d results/firefox -v EXECUTION:LOCAL -v BROWSER:Firefox page_object_pattern/tests

echo.

echo =====================================
echo Running tests on Edge
echo =====================================

robot -d results/edge -v EXECUTION:LOCAL -v BROWSER:Edge page_object_pattern/tests

echo.
echo =====================================
echo All browsers finished.
echo =====================================

pause