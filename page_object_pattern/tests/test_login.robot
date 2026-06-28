*** Settings ***
Library          SeleniumLibrary
Test Setup       Open Browser Session
Test Teardown    Close Browser Session
Resource         ../pages/my_account_page.robot
Resource         ../data/user_data.robot
Resource         ../resources/data_generator.robot
Resource         ../resources/browser.robot

*** Test Cases ***
User Can Log In
    [Documentation]    Test verifies user can create account and log in successfully
    ${email}=    Generate Email
    Open My Account Page
    Wait Until My Account Page Is Loaded
    Create Account    ${email}    ${DEFAULT_PASSWORD}
    Logout Link Should Be Visible
    Logout
    Log In    ${email}    ${DEFAULT_PASSWORD}
    Logout Link Should Be Visible

User Cannot Log In With Invalid Credentials
    [Documentation]    Test verifies error message is displayed for invalid login
    Open My Account Page
    Wait Until My Account Page Is Loaded
    Log In    ${INVALID_EMAIL}    ${DEFAULT_PASSWORD}
    ${message}=    Get Error Message
    Should Contain    ${message}    ${INVALID_LOGIN_ERROR_MESSAGE}