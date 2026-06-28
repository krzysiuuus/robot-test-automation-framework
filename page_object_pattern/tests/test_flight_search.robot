*** Settings ***
Library          SeleniumLibrary
Test Setup       Open Browser Session
Test Teardown    Close Browser Session
Resource         ../resources/browser.robot
Resource         ../pages/flight_search.robot
Resource         ../pages/flight_list.robot
Resource         ../pages/flight_book.robot
Resource         ../pages/flight_invoice.robot
Resource         ../data/flight_test_data.robot
Resource         ../resources/date_utils.robot

*** Test Cases ***
User Can Search And Book Flight
    [Documentation]    Test verifies complete flight booking flow
    ${departure_date}    ${return_date}=    Get Flight Date Range
    Open PHP Travels Page
    Switch To Flights
    Select Round Trip
    Set Departure City    ${TEST_FLIGHT.departure_city}
    Set Arrival City    ${TEST_FLIGHT.arrival_city}
    Set Date Range    ${departure_date}    ${return_date}
    Set Travellers    @{TEST_TRAVELLERS}
    Perform Search
    Title Should Be    Flights List
    Search Only Specific Airline    ${TEST_FLIGHT.airline}
    Check More Details
    Click Book Button
    Title Should Be    PHPTRAVELS | Travel Technology Partner
    Enter Name
    ...    ${TEST_USER.first_name}
    ...    ${TEST_USER.last_name}
    ...    ${TEST_USER.email}
    ...    ${TEST_USER.phone}
    ...    ${TEST_USER.address}

    Select Country    ${TEST_USER.country}

    Enter Note    ${TEST_NOTE}
    Click Confirm Booking
    ${name}    ${address}    ${phone}    ${dep}    ${arr}    ${note}=    Verify Invoice
    Should Be Equal    ${name}       ${TEST_USER.full_name}
    Should Be Equal    ${address}    ${TEST_USER.address}
    Should Be Equal    ${phone}      ${TEST_USER.phone}
    Should Be Equal    ${dep}    ${TEST_FLIGHT.departure_city}
    Should Be Equal    ${arr}    ${TEST_FLIGHT.arrival_city}
    Should Be Equal    ${note}       ${TEST_NOTE}
    Enter Card
    ${error}=    Verify Incorrect Card
    Should Contain    ${error}    ${TEST_PAYMENT.error}