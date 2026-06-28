*** Settings ***
Library          SeleniumLibrary
Test Setup       Open Browser Session
Test Teardown    Close Browser Session
Resource         ../pages/my_account_page.robot
Resource         ../data/user_data.robot
Resource         ../resources/data_generator.robot
Resource         ../resources/browser.robot

*** Test Cases ***
User Can Create Account
    [Documentation]    Verify user can create account successfully
    ${email}=    Generate Email
    Open My Account Page
    Create Account And Wait Until Logged In    ${email}    ${DEFAULT_PASSWORD}

User Cannot Create Account With Existing Email
    [Documentation]    Verify error message for duplicate email
    ${email}=    Generate Email
    Open My Account Page
    Create Account And Wait Until Logged In    ${email}    ${DEFAULT_PASSWORD}
    Logout
    Open My Account Page
    Create Account    ${email}    ${DEFAULT_PASSWORD}
    ${message}=    Get Error Message
    Should Contain    ${message}    ${DUPLICATE_EMAIL_ERROR_MESSAGE}