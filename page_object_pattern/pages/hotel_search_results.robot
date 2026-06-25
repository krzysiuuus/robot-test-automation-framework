*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${HOTEL_NAMES}            xpath://h4[contains(@class, 'list_title')]//b
${HOTEL_PRICES}           xpath://div[contains(@class, 'price_tab')]//b
${HOTEL_DETAILS_BUTTON}   xpath:(//button[contains(text(),'Details')])[1]

*** Keywords ***
Wait Until Results Are Loaded
    Wait Until Element Is Visible    ${HOTEL_NAMES}

Get Hotel Names
    @{hotel_names_text}=    Create List
    @{hotel_names}=    Get WebElements    ${HOTEL_NAMES}
    FOR    ${element}    IN    @{hotel_names}
        ${text}=    Get Text    ${element}
        Append To List    ${hotel_names_text}    ${text}
    END
    RETURN    ${hotel_names_text}

Hotel Names Should Contain
    [Arguments]    @{expected_hotels}
    ${hotel_names}=    Get Hotel Names
    FOR    ${hotel}    IN    @{expected_hotels}
        Should Contain    ${hotel_names}    ${hotel}
    END

Get Hotel Prices
    @{hotel_prices_text}=    Create List
    @{hotel_prices}=    Get WebElements    ${HOTEL_PRICES}
    FOR    ${element}    IN    @{hotel_prices}
        ${text}=    Get Text    ${element}
        Append To List    ${hotel_prices_text}    ${text}
    END
    RETURN    ${hotel_prices_text}

Hotel Prices Should Be
    [Arguments]    @{expected_prices}
    ${hotel_prices}=    Get Hotel Prices
    Lists Should Be Equal    ${hotel_prices}    ${expected_prices}

Click Hotel Details
    Wait Until Element Is Visible    ${HOTEL_DETAILS_BUTTON}
    Scroll Element Into View    ${HOTEL_DETAILS_BUTTON}
    Click Button    ${HOTEL_DETAILS_BUTTON}