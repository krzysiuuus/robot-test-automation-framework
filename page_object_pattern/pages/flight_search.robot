*** Settings ***
Library    SeleniumLibrary
Resource    ../../config/config.robot

*** Variables ***
${FLIGHTS_TAB}                 xpath://span[normalize-space(.)='Flights']
${ROUND_TRIP_RADIO}            xpath://div[@class='iradio_square-grey']
${CITY_DROPDOWN}               xpath://span[text()='Enter City Or Airport']
${CITY_SEARCH_INPUT}           xpath://div[@id='select2-drop']//input
${DEPARTURE_DATE_INPUT}        name:departure
${ARRIVAL_DATE_INPUT}          name:arrival
${TRAVELLERS_INPUT}            name:totalManualPassenger
${ADULT_SELECT}                xpath://select[@name='madult']
${CHILD_SELECT}                xpath://select[@name='mchildren']
${INFANT_SELECT}               xpath://select[@name='minfant']
${SUM_TRAVELLERS_BUTTON}       id:sumManualPassenger
${SEARCH_BUTTON}               xpath://div[@class='bgfade col-md-3 col-xs-12 search-button']//button

*** Keywords ***
Open PHP Travels Page
    Go To    ${PHP_BASE_URL}

Switch To Flights
    Click Element    ${FLIGHTS_TAB}

Select Round Trip
    Wait Until Element Is Visible    ${ROUND_TRIP_RADIO}
    Click Element    ${ROUND_TRIP_RADIO}

Set Departure City
    [Arguments]    ${city}
    Click Element    ${CITY_DROPDOWN}
    Input Text    ${CITY_SEARCH_INPUT}    ${city}
    wait until element is visible    xpath://span[text()='${city}']
    click element    xpath://span[text()='${city}']

Set Arrival City
    [Arguments]    ${city}
    Click Element    ${CITY_DROPDOWN}
    Input Text    ${CITY_SEARCH_INPUT}    ${city}
    wait until element is visible    xpath://span[text()='${city}']
    click element    xpath://span[text()='${city}']

Set Date Range
    [Arguments]    ${check_in}    ${check_out}
    Input Text    ${DEPARTURE_DATE_INPUT}    ${check_in}
    Input Text    ${ARRIVAL_DATE_INPUT}    ${check_out}

Set Travellers
    [Arguments]    ${adults}    ${child}    ${infant}
    Click Element    ${TRAVELLERS_INPUT}
    Wait Until Element Is Visible    ${ADULT_SELECT}
    click element    ${ADULT_SELECT}
    Select From List By Value    ${ADULT_SELECT}    ${adults}
    click element    ${CHILD_SELECT}
    Select From List By Value    ${CHILD_SELECT}    ${child}
    click element    ${INFANT_SELECT}
    Select From List By Value    ${INFANT_SELECT}    ${infant}
    Click Element    ${SUM_TRAVELLERS_BUTTON}

Perform Search
    Click Button    ${SEARCH_BUTTON}