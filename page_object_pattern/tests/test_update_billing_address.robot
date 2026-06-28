*** Settings ***
Library          SeleniumLibrary
Test Setup       Open Browser Session
Test Teardown    Close Browser Session
Resource         ../pages/my_account_page.robot
Resource         ../pages/billing_address_page.robot
Resource         ../data/user_data.robot
Resource         ../resources/data_generator.robot
Resource         ../resources/browser.robot

*** Test Cases ***
User Can Update Billing Address
    [Documentation]    Test verifies user can update billing address successfully
    ${email}=    Generate Email
    Open My Account Page
    Wait Until My Account Page Is Loaded
    Create Account    ${email}    ${DEFAULT_PASSWORD}
    Open Edit Billing Address
    Set Personal Data    ${BILLING_ADDRESS.first_name}    ${BILLING_ADDRESS.last_name}
    Select Country    ${BILLING_ADDRESS.country}
    Set Address    ${BILLING_ADDRESS.street}    ${BILLING_ADDRESS.postcode}    ${BILLING_ADDRESS.city}
    Set Phone Number    ${BILLING_ADDRESS.phone}
    Save Address
    ${message}=    Get Message Text
    Should Contain    ${message}    ${ADDRESS_CHANGED_MESSAGE}