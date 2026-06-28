*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/logger.robot

*** Variables ***
${INVOICE_TITLE}       xpath://div[text()='Invoice']
${NAME}                xpath://div[2]/table/tbody/tr/td/div[2]
${ADDRESS}             xpath://div[2]/table/tbody/tr/td/div[3]
${PHONE}               xpath://div[2]/table/tbody/tr/td/div[4]
${HOTEL_NAME}          xpath:(//table[1]/tbody/tr[1]/td[1])[5]
${ARRIVAL_CITY}        xpath://table[1]/tbody/tr[1]/td[2]
${NOTE}                xpath://div[@class='panel-body']

*** Keywords ***
Wait Until Hotel Invoice Page Is Loaded
    Wait Until Element Is Visible    ${INVOICE_TITLE}    timeout=30s

Verify Hotel Invoice
    Log Step    Verifying hotel invoice
    Wait Until Hotel Invoice Page Is Loaded
    ${name}=    Get Text    ${NAME}
    ${address}=    Get Text    ${ADDRESS}
    ${phone}=    Get Text    ${PHONE}
    ${hotel}=    Get Text    ${HOTEL_NAME}
    ${city}=    Get Text    ${ARRIVAL_CITY}
    ${note}=    Get Text    ${NOTE}
    RETURN    ${name}    ${address}    ${phone}    ${hotel}    ${city}    ${note}