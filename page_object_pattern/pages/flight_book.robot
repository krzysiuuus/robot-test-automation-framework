*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FIRST_NAME_INPUT}          xpath://input[@name='firstname']
${LAST_NAME_INPUT}           xpath://input[@name='lastname']
${EMAIL_INPUT}               xpath://input[@name='email']
${CONFIRM_EMAIL_INPUT}       xpath://input[@name='confirmemail']
${PHONE_INPUT}               xpath://input[@name='phone']
${ADDRESS_INPUT}             xpath://input[@name='address']
${COUNTRY_DROPDOWN}          xpath://a[@class='select2-choice']
${COUNTRY_SEARCH_INPUT}      xpath://div[@class='select2-search']//input
${NOTE_LABEL}                xpath://div[@class='panel-heading']//label
${ADDITIONAL_NOTES_TEXTAREA}    xpath://textarea[@name='additionalnotes']
${CONFIRM_BOOKING_BUTTON}    xpath://button[@name='guest']

*** Keywords ***
Wait Until Flight Book Page Is Loaded
    Wait Until Element Is Visible    ${FIRST_NAME_INPUT}

Enter Name
    [Arguments]    ${firstname}    ${lastname}   ${email}   ${phone}   ${address}
    Input Text    ${FIRST_NAME_INPUT}    ${firstname}
    Input Text    ${LAST_NAME_INPUT}    ${lastname}
    Input Text    ${EMAIL_INPUT}    ${email}
    Input Text    ${CONFIRM_EMAIL_INPUT}    ${email}
    Input Text    ${PHONE_INPUT}    ${phone}
    Input Text    ${ADDRESS_INPUT}    ${address}

Select Country
    [Arguments]    ${country}
    wait until element is enabled    ${COUNTRY_DROPDOWN}
    Click Element    ${COUNTRY_DROPDOWN}
    Input Text    ${COUNTRY_SEARCH_INPUT}    ${country}
    Click Element    xpath://span[text()='${country}']

Enter Note
    [Arguments]    ${note}
    Click Element    ${NOTE_LABEL}
    Wait Until Element Is Visible    ${ADDITIONAL_NOTES_TEXTAREA}
    Input Text    ${ADDITIONAL_NOTES_TEXTAREA}    ${note}

Click Confirm Booking
    Scroll Element Into View    ${CONFIRM_BOOKING_BUTTON}
    Click Button    ${CONFIRM_BOOKING_BUTTON}