*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/logger.robot

*** Variables ***
${AVAILABLE_ROOMS_TITLE}    xpath://div[text()='Available Rooms']
${CHILD_SELECT}             xpath:(//select[@name='child'])[2]
${MODIFY_BUTTON}            xpath:(//input[@value='Modify'])[2]
${BOOK_NOW_BUTTON}          xpath://button[contains(@class,'book_button') and normalize-space()='Book Now']
${ROOM_CHECKBOX}            xpath://div[@class='control__indicator']

*** Keywords ***
Wait Until Hotel Details Loaded
    Wait Until Element Is Visible    ${AVAILABLE_ROOMS_TITLE}

Modify Dates And Guests
    Log Step    Modifying dates and guests
    Scroll Element Into View    ${AVAILABLE_ROOMS_TITLE}
    Select From List By Value    ${CHILD_SELECT}    2
    Click Element    ${MODIFY_BUTTON}

Select Room And Book
    Log Step    Selecting room and booking hotel
    Scroll Element Into View    ${BOOK_NOW_BUTTON}
    Click Element    ${ROOM_CHECKBOX}
    Click Element    ${BOOK_NOW_BUTTON}