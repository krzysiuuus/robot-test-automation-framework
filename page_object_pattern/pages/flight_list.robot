*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MORE_DETAILS_LINK}          xpath://a[text()='More Details']
${FLIGHT_DESCRIPTION}         xpath://p[contains(@class, 'main-title go-right')]
${BOOK_BUTTON}                xpath://button[@id='bookbtn']

*** Keywords ***
Wait Until Flight List Page Is Loaded
    Wait Until Element Is Visible    ${MORE_DETAILS_LINK}    timeout=30s

Search Only Specific Airline
    [Arguments]    ${airline}
    Scroll Element Into View    id=checkair${airline}
    Click Element    xpath=//input[@value='${airline}']/following-sibling::ins[contains(@class,'iCheck-helper')]

Check More Details
    Wait Until Element Is Visible    ${MORE_DETAILS_LINK}
    Click Element    ${MORE_DETAILS_LINK}
    ${description}=    Get Text    ${FLIGHT_DESCRIPTION}
    RETURN    ${description}

Click Book Button
    Click Button    ${BOOK_BUTTON}