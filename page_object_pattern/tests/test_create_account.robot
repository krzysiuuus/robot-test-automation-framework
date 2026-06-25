*** Settings ***
Library          SeleniumLibrary
Test Setup       Open Browser Page
Test Teardown    Close Browser Page
Resource         ../pages/my_account_page.robot
Resource         ../data/user_data.robot
Resource         ../resources/data_generator.robot
Resource         ../resources/browser.robot

*** Test Cases ***
User Can Create Account
    [Documentation]    Verify user can create account successfully
    ${email}=    Generate Email
    Open My Account Page
    Create Account    ${email}    ${DEFAULT_PASSWORD}
    Logout Link Should Be Visible

User Cannot Create Account With Existing Email
    [Documentation]    Verify error message for duplicate email
    ${email}=    Generate Email
    Open My Account Page
    Create Account    ${email}    ${DEFAULT_PASSWORD}
    Logout Link Should Be Visible
    Logout
    Open My Account Page
    Create Account    ${email}    ${DEFAULT_PASSWORD}
    ${message}=    Get Error Message
    Should Contain    ${message}    An account is already registered with your email address.