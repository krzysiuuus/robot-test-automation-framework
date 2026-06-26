*** Settings ***
Library    SeleniumLibrary
Resource    ../../config/config.robot

*** Keywords ***
Open PHP Travels Page
    Go To    ${PHP_BASE_URL}

Set City
    [Arguments]    ${city}
    Click Element    xpath://span[text()='Search by Hotel or City Name']
    Input Text    xpath://div[@id='select2-drop']//input    ${city}
    Wait Until Element Is Visible    xpath://span[text()='${city}']
    Click Element    xpath://span[text()='${city}']

Set Date Range
    [Arguments]    ${check_in}    ${check_out}
    Input Text    name:checkin    ${check_in}
    Input Text    name:checkout    ${check_out}

Set Travellers
    [Arguments]    ${adults}    ${child}
    Click Element    id:travellersInput
    Press Keys    id:adultInput    CTRL+A
    Press Keys    id:adultInput    BACKSPACE
    Input Text    id:adultInput    ${adults}
    Press Keys    id:childInput    CTRL+A
    Press Keys    id:childInput    BACKSPACE
    Input Text    id:childInput    ${child}

Click Search Button
    Click Element    xpath://button[contains(text(),'Search')]