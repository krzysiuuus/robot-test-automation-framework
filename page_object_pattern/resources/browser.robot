*** Settings ***
Library     SeleniumLibrary
Resource    ../../config/config.robot

*** Keywords ***
Open Browser Page
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Set Selenium Speed    ${SELENIUM_SPEED}

Close Browser Page
    Close Browser