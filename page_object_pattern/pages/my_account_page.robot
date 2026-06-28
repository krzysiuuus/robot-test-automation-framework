*** Settings ***
Library    SeleniumLibrary
Resource    ../../config/config.robot
Resource    ../resources/logger.robot

*** Variables ***
${REG_EMAIL_INPUT}      xpath=//input[@id='reg_email']
${REG_PASSWORD_INPUT}   xpath=//input[@id='reg_password']
${USERNAME_INPUT}       xpath=//input[@id='username']
${PASSWORD_INPUT}       xpath=//input[@id='password']
${LOGIN_BUTTON}         name=login
${REGISTER_BUTTON}      name=register
${LOGOUT_LINK}          xpath=//a[text()='Logout']
${ERROR_MESSAGE}        xpath=//ul[@class='woocommerce-error']/li

*** Keywords ***
Open My Account Page
    Log Step    Opening My Account page
    Go To    ${SHOP_BASE_URL}

Wait Until My Account Page Is Loaded
    Wait Until Element Is Visible    ${REG_EMAIL_INPUT}

Create Account
    [Arguments]    ${email}    ${password}
    Log Step    Creating account for: ${email}
    Input Text    ${REG_EMAIL_INPUT}    ${email}
    Input Text    ${REG_PASSWORD_INPUT}    ${password}
    Click Button    ${REGISTER_BUTTON}

Create Account And Wait Until Logged In
    [Arguments]    ${email}    ${password}
    Create Account    ${email}    ${password}
    Logout Link Should Be Visible

Log In
    [Arguments]    ${username}    ${password}
    Log Step    Logging in as: ${username}
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}

Logout
    Log Step    Logging out
    Click Element    ${LOGOUT_LINK}

Logout Link Should Be Visible
    Log Step    Verifying successful login
    Wait Until Page Contains Element    ${LOGOUT_LINK}    timeout=45s
    Wait Until Element Is Visible    ${LOGOUT_LINK}    timeout=45s

Get Error Message
    Log Step    Reading error message
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    timeout=10s
    ${message}=    Get Text    ${ERROR_MESSAGE}
    RETURN    ${message}