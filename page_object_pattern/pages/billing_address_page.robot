*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ADDRESS_LINK}                 link=Addresses
${EDIT_LINK}                    link=Edit
${FIRST_NAME_INPUT}             id=billing_first_name
${LAST_NAME_INPUT}              id=billing_last_name
${COUNTRY_SELECT}               id=billing_country
${STREET_ADDRESS_INPUT}         id=billing_address_1
${POSTCODE_INPUT}               id=billing_postcode
${CITY_INPUT}                   id=billing_city
${PHONE_INPUT}                  id=billing_phone
${SAVE_ADDRESS_BUTTON}          name=save_address
${MESSAGE_TEXT}                 xpath=//div[contains(@class, 'woocommerce-message')]

*** Keywords ***
Set Input Value By Javascript
    [Arguments]    ${element_id}    ${value}
    Execute Javascript    document.getElementById('${element_id}').value='${value}'

Open Edit Billing Address
    Click Element    ${ADDRESS_LINK}
    Click Element    ${EDIT_LINK}

Set Personal Data
    [Arguments]    ${first_name}    ${last_name}
    Input Text    ${FIRST_NAME_INPUT}    ${first_name}
    Input Text    ${LAST_NAME_INPUT}    ${last_name}

Select Country
    [Arguments]    ${country}
    Wait Until Element Is Visible    ${COUNTRY_SELECT}
    Select From List By Label    ${COUNTRY_SELECT}    ${country}

Set Address
    [Arguments]    ${street}    ${postcode}    ${city}
    Set Input Value By Javascript    billing_address_1    ${street}
    Set Input Value By Javascript    billing_postcode     ${postcode}
    Set Input Value By Javascript    billing_city         ${city}

Set Phone Number
    [Arguments]    ${phone}
    Set Input Value By Javascript    billing_phone    ${phone}

Save Address
    Click Button    ${SAVE_ADDRESS_BUTTON}

Get Message Text
    ${message}=    Get Text    ${MESSAGE_TEXT}
    RETURN    ${message}