*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../resources/logger.robot

*** Variables ***
${HOTEL_NAMES}            xpath://h4[contains(@class, 'list_title')]//b
${HOTEL_PRICES}           xpath://div[contains(@class, 'price_tab')]//b
${HOTEL_DETAILS_BUTTON}   xpath:(//button[contains(text(),'Details')])[1]

*** Keywords ***
Wait Until Results Are Loaded
    Log Step    Waiting until hotel search results are loaded
    Wait Until Element Is Visible    ${HOTEL_NAMES}    timeout=30s

Get Hotel Names
    Log Step    Reading hotel names
    @{hotel_names_elements}=    Get WebElements    ${HOTEL_NAMES}
    @{hotel_names}=    Create List
    FOR    ${hotel_name_element}    IN    @{hotel_names_elements}
        ${hotel_name}=    Get Text    ${hotel_name_element}
        Append To List    ${hotel_names}    ${hotel_name}
    END
    RETURN    @{hotel_names}

Hotel Names Should Contain
    [Arguments]    @{expected_hotels}
    Log Step    Verifying hotel names
    @{hotel_names}=    Get Hotel Names
    FOR    ${expected_hotel}    IN    @{expected_hotels}
        Should Contain    ${hotel_names}    ${expected_hotel}
    END

Get Hotel Prices
    Log Step    Reading hotel prices
    @{price_elements}=    Get WebElements    ${HOTEL_PRICES}
    @{price_values}=    Create List
    FOR    ${price_element}    IN    @{price_elements}
        ${price}=    Get Text    ${price_element}
        Append To List    ${price_values}    ${price}
    END
    RETURN    @{price_values}

Hotel Prices Should Be Equal
    [Arguments]    @{expected_prices}
    Log Step    Verifying hotel prices
    @{price_values}=    Get Hotel Prices
    Lists Should Be Equal    ${price_values}    ${expected_prices}

Click Hotel Details
    Log Step    Opening hotel details
    Wait Until Element Is Visible    ${HOTEL_DETAILS_BUTTON}
    Scroll Element Into View    ${HOTEL_DETAILS_BUTTON}
    Click Button    ${HOTEL_DETAILS_BUTTON}