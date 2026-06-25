*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}    http://www.kurs-selenium.pl/demo/
${BROWSER}     Chrome

*** Keywords ***
Open Browser Page
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    30s

Close Browser Page
    Close Browser