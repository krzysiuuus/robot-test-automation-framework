*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${INVOICE_TITLE}             xpath=//div[text()='Invoice']
${CUSTOMER_NAME_LABEL}       xpath=//div[2]/table/tbody/tr/td/div[2]
${CUSTOMER_ADDRESS_LABEL}    xpath=//div[2]/table/tbody/tr/td/div[3]
${CUSTOMER_PHONE_LABEL}      xpath=//div[2]/table/tbody/tr/td/div[4]
${DEPARTURE_CITY_LABEL}      xpath=//table[2]/tbody/tr[2]/td[3]
${ARRIVAL_CITY_LABEL}        xpath=//table[2]/tbody/tr[3]/td[3]
${INVOICE_NOTE_LABEL}        xpath=//div[@class='panel-body']
${PAY_NOW_BUTTON}            xpath=//button[text()='Pay Now']
${GATEWAY_SELECT}            xpath=//select[@name='gateway']
${FIRST_NAME_INPUT}          xpath=//input[@name='firstname']
${LAST_NAME_INPUT}           xpath=//input[@name='lastname']
${CARD_NUMBER_INPUT}         xpath=//input[@name='cardnum']
${EXP_MONTH_SELECT}          xpath=//select[@name='expMonth']
${CVV_INPUT}                 xpath=//input[@name='cvv']
${SUBMIT_PAYMENT_BUTTON}     xpath=//button[@type='submit']
${INCORRECT_CARD_MESSAGE}    xpath=//*[@id='body-section']/div[1]/div[2]/div[1]

*** Keywords ***
Wait Until Flight Invoice Page Is Loaded
    Wait Until Element Is Visible    ${INVOICE_TITLE}    timeout=30s

Verify Invoice
    Log    Verifying flight invoice
    Wait Until Flight Invoice Page Is Loaded
    ${name}=    Get Text    ${CUSTOMER_NAME_LABEL}
    ${address}=    Get Text    ${CUSTOMER_ADDRESS_LABEL}
    ${phone}=    Get Text    ${CUSTOMER_PHONE_LABEL}
    ${departure_city}=    Get Text    ${DEPARTURE_CITY_LABEL}
    ${arrival_city}=    Get Text    ${ARRIVAL_CITY_LABEL}
    ${note}=    Get Text    ${INVOICE_NOTE_LABEL}
    RETURN    ${name}    ${address}    ${phone}    ${departure_city}    ${arrival_city}    ${note}


Enter Card
    Click Button    ${PAY_NOW_BUTTON}
    Wait Until Element Is Visible    ${GATEWAY_SELECT}    timeout=30s
    click element    ${GATEWAY_SELECT}
    Select From List By Value    ${GATEWAY_SELECT}    authorize
    Wait Until Element Is Visible    ${FIRST_NAME_INPUT}     5s
    Input Text    ${FIRST_NAME_INPUT}    Anon
    Input Text    ${LAST_NAME_INPUT}    Anonski
    Input Text    ${CARD_NUMBER_INPUT}    1111222233334444
    Select From List By Value    ${EXP_MONTH_SELECT}    12
    Input Text    ${CVV_INPUT}    123
    Click Button    ${SUBMIT_PAYMENT_BUTTON}


Verify Incorrect Card
    Wait Until Element Is Visible    ${INCORRECT_CARD_MESSAGE}    timeout=30s
    ${incorrect_card}=    Get Text    ${INCORRECT_CARD_MESSAGE}
    RETURN    ${incorrect_card}