*** Settings ***
Library    SeleniumLibrary
Resource    ../../config/config.robot

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
    Go To    ${SHOP_BASE_URL}

Wait Until My Account Page Is Loaded
    Wait Until Element Is Visible    ${REG_EMAIL_INPUT}

Create Account
    [Arguments]    ${email}    ${password}
    Input Text    ${REG_EMAIL_INPUT}    ${email}
    Input Text    ${REG_PASSWORD_INPUT}    ${password}
    Click Button    ${REGISTER_BUTTON}

Log In
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}

Logout
    Click Element    ${LOGOUT_LINK}

Logout Link Should Be Visible
    Wait Until Page Contains Element    ${LOGOUT_LINK}    timeout=45s
    Wait Until Element Is Visible    ${LOGOUT_LINK}    timeout=45s

Get Error Message
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    timeout=10s
    ${message}=    Get Text    ${ERROR_MESSAGE}
    RETURN    ${message}

Create Account And Wait Until Logged In
    [Arguments]    ${email}    ${password}
    Create Account    ${email}    ${password}
    Logout Link Should Be Visible