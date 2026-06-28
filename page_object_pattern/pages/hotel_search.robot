*** Settings ***
Library    SeleniumLibrary
Resource    ../../config/config.robot
Resource    ../resources/logger.robot

*** Variables ***
${HOTEL_CITY_DROPDOWN}    xpath://span[text()='Search by Hotel or City Name']
${HOTEL_CITY_INPUT}       xpath://div[@id='select2-drop']//input
${CHECK_IN_INPUT}         name:checkin
${CHECK_OUT_INPUT}        name:checkout
${TRAVELLERS_INPUT}       id:travellersInput
${ADULT_INPUT}            id:adultInput
${CHILD_INPUT}            id:childInput
${SEARCH_BUTTON}          xpath://button[contains(text(),'Search')]

*** Keywords ***
Open PHP Travels Page
    Log Step    Opening PHP Travels page
    Go To    ${PHP_BASE_URL}

Set City
    [Arguments]    ${city}
    Log Step    Setting hotel city: ${city}
    Click Element    ${HOTEL_CITY_DROPDOWN}
    Input Text    ${HOTEL_CITY_INPUT}    ${city}
    Wait Until Element Is Visible    xpath://span[text()='${city}']
    Click Element    xpath://span[text()='${city}']

Set Date Range
    [Arguments]    ${check_in}    ${check_out}
    Log Step    Setting hotel date range: ${check_in} - ${check_out}
    Input Text    ${CHECK_IN_INPUT}    ${check_in}
    Input Text    ${CHECK_OUT_INPUT}    ${check_out}

Set Travellers
    [Arguments]    ${adults}    ${child}
    Log Step    Setting hotel travellers: adults=${adults}, children=${child}
    Click Element    ${TRAVELLERS_INPUT}
    Press Keys    ${ADULT_INPUT}    CTRL+A
    Press Keys    ${ADULT_INPUT}    BACKSPACE
    Input Text    ${ADULT_INPUT}    ${adults}
    Press Keys    ${CHILD_INPUT}    CTRL+A
    Press Keys    ${CHILD_INPUT}    BACKSPACE
    Input Text    ${CHILD_INPUT}    ${child}

Click Search Button
    Log Step    Performing hotel search
    Click Element    ${SEARCH_BUTTON}