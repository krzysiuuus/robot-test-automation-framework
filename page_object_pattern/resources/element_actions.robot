*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Scroll To Element
    [Arguments]    ${locator}
    ${element}=    Get WebElement    ${locator}
    Execute Javascript    arguments[0].scrollIntoView({block: 'center'});    ARGUMENTS    ${element}

Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Scroll To Element    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Click Element    ${locator}

Type Text
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}
    Scroll To Element    ${locator}
    Input Text    ${locator}    ${text}

Select By Value
    [Arguments]    ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}
    Scroll To Element    ${locator}
    Select From List By Value    ${locator}    ${value}

Select By Label
    [Arguments]    ${locator}    ${label}
    Wait Until Element Is Visible    ${locator}
    Scroll To Element    ${locator}
    Select From List By Label    ${locator}    ${label}

Click By Javascript
    [Arguments]    ${locator}
    ${element}=    Get WebElement    ${locator}
    Execute Javascript    arguments[0].scrollIntoView({block: 'center'});    ARGUMENTS    ${element}
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${element}