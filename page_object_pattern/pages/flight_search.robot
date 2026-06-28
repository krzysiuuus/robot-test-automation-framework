*** Settings ***
Library    SeleniumLibrary
Resource    ../../config/config.robot
Resource    ../resources/logger.robot

*** Variables ***
${FLIGHTS_TAB}              xpath://span[normalize-space(.)='Flights']
${ROUND_TRIP_RADIO}         xpath://div[@class='iradio_square-grey']
${CITY_DROPDOWN}            xpath://span[text()='Enter City Or Airport']
${CITY_SEARCH_INPUT}        xpath://div[@id='select2-drop']//input
${DEPARTURE_DATE_INPUT}     name:departure
${ARRIVAL_DATE_INPUT}       name:arrival
${TRAVELLERS_INPUT}         name:totalManualPassenger
${ADULT_SELECT}             xpath://select[@name='madult']
${CHILD_SELECT}             xpath://select[@name='mchildren']
${INFANT_SELECT}            xpath://select[@name='minfant']
${SUM_TRAVELLERS_BUTTON}    id:sumManualPassenger
${SEARCH_BUTTON}            xpath://div[@class='bgfade col-md-3 col-xs-12 search-button']//button

*** Keywords ***
Open PHP Travels Page
    Log Step    Opening PHP Travels page
    Go To    ${PHP_BASE_URL}

Switch To Flights
    Log Step    Switching to flights tab
    Click Element    ${FLIGHTS_TAB}

Select Round Trip
    Log Step    Selecting round trip
    Wait Until Element Is Visible    ${ROUND_TRIP_RADIO}
    Click Element    ${ROUND_TRIP_RADIO}

Set Departure City
    [Arguments]    ${city}
    Log Step    Setting departure city: ${city}
    Click Element    ${CITY_DROPDOWN}
    Input Text    ${CITY_SEARCH_INPUT}    ${city}
    Wait Until Element Is Visible    xpath://span[text()='${city}']
    Click Element    xpath://span[text()='${city}']

Set Arrival City
    [Arguments]    ${city}
    Log Step    Setting arrival city: ${city}
    Click Element    ${CITY_DROPDOWN}
    Input Text    ${CITY_SEARCH_INPUT}    ${city}
    Wait Until Element Is Visible    xpath://span[text()='${city}']
    Click Element    xpath://span[text()='${city}']

Set Date Range
    [Arguments]    ${check_in}    ${check_out}
    Log Step    Setting flight date range: ${check_in} - ${check_out}
    Input Text    ${DEPARTURE_DATE_INPUT}    ${check_in}
    Input Text    ${ARRIVAL_DATE_INPUT}    ${check_out}

Set Travellers
    [Arguments]    ${adults}    ${child}    ${infant}
    Log Step    Setting travellers: adults=${adults}, children=${child}, infants=${infant}
    Click Element    ${TRAVELLERS_INPUT}
    Wait Until Element Is Visible    ${ADULT_SELECT}
    Click Element    ${ADULT_SELECT}
    Select From List By Value    ${ADULT_SELECT}    ${adults}
    Click Element    ${CHILD_SELECT}
    Select From List By Value    ${CHILD_SELECT}    ${child}
    Click Element    ${INFANT_SELECT}
    Select From List By Value    ${INFANT_SELECT}    ${infant}
    Click Element    ${SUM_TRAVELLERS_BUTTON}

Perform Search
    Log Step    Performing flight search
    Click Button    ${SEARCH_BUTTON}