*** Settings ***
Library          SeleniumLibrary

Test Setup       Open Browser Page
Test Teardown    Close Browser Page

Resource         ../resources/browser.robot
Resource         ../pages/hotel_search.robot
Resource         ../pages/hotel_search_results.robot
Resource         ../pages/hotel_details.robot
Resource         ../pages/flight_book.robot
Resource         ../pages/hotel_invoice.robot
Resource         ../pages/flight_invoice.robot
Resource         ../data/hotel_test_data.robot
Resource         ../resources/date_utils.robot

*** Test Cases ***
User Can Search And Book Hotel
    [Documentation]    Test verifies complete hotel search and booking flow
    ${check_in}    ${check_out}=    Get Hotel Date Range
    Open PHP Travels Page
    Set City    ${TEST_HOTEL.city}
    Set Date Range    ${check_in}    ${check_out}
    Set Travellers    @{TEST_GUESTS}
    Click Search Button
    Wait Until Results Are Loaded
    Hotel Names Should Contain    @{TEST_EXPECTED_HOTELS}
    Hotel Prices Should Be Equal    @{TEST_EXPECTED_PRICES}
    Click Hotel Details
    Wait Until Hotel Details Loaded
    Modify Dates And Guests
    Select Room And Book
    Wait Until Flight Book Page Is Loaded
    Enter Name
    ...    ${TEST_USER.first_name}
    ...    ${TEST_USER.last_name}
    ...    ${TEST_USER.email}
    ...    ${TEST_USER.phone}
    ...    ${TEST_USER.address}
    Select Country  ${TEST_USER.country}
    Enter Note      ${TEST_NOTE}
    Click Confirm Booking
    ${name}    ${address}    ${phone}    ${hotel}    ${city}    ${note}=    Verify Hotel Invoice
    Should Be Equal    ${name}       ${TEST_USER.full_name}
    Should Be Equal    ${address}    ${TEST_USER.address}
    Should Be Equal    ${phone}      ${TEST_USER.phone}
    Should Be Equal    ${hotel}      ${TEST_HOTEL.selected_hotel}
    Should Be Equal    ${city}       ${TEST_HOTEL.city}
    Should Contain     ${note}       ${TEST_NOTE}
    Enter Card
    ${error}=    Verify Incorrect Card
    Should Contain    ${error}    ${TEST_PAYMENT.error}