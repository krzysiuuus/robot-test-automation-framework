*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/logger.robot

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
Open Edit Billing Address
    Log Step    Opening billing address page
    Click Link    ${ADDRESS_LINK}
    Click Link    ${EDIT_LINK}

Set Personal Data
    [Arguments]    ${first_name}    ${last_name}
    Log Step    Setting personal data: ${first_name} ${last_name}
    Input Text    ${FIRST_NAME_INPUT}    ${first_name}
    Input Text    ${LAST_NAME_INPUT}    ${last_name}

Select Country
    [Arguments]    ${country}
    Log Step    Selecting country: ${country}
    Select From List By Label    ${COUNTRY_SELECT}    ${country}

Set Input Value By Javascript
    [Arguments]    ${element_id}    ${value}
    Execute Javascript    document.getElementById('${element_id}').value='${value}'

Set Address
    [Arguments]    ${street}    ${postcode}    ${city}
    Log Step    Setting address: ${street}, ${postcode}, ${city}
    Set Input Value By Javascript    billing_address_1    ${street}
    Set Input Value By Javascript    billing_postcode    ${postcode}
    Set Input Value By Javascript    billing_city    ${city}

Set Phone Number
    [Arguments]    ${phone}
    Log Step    Setting phone number: ${phone}
    Set Input Value By Javascript    billing_phone    ${phone}

Save Address
    Log Step    Saving billing address
    Click Button    ${SAVE_ADDRESS_BUTTON}

Get Message Text
    Log Step    Reading confirmation message
    ${message}=    Get Text    ${MESSAGE_TEXT}
    RETURN    ${message}