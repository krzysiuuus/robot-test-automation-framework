*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/logger.robot
Resource    ../resources/element_actions.robot

*** Variables ***
${AVAILABLE_ROOMS_TITLE}    xpath://div[text()='Available Rooms']
${CHILD_SELECT}             xpath:(//select[@name='child'])[2]
${MODIFY_BUTTON}            xpath:(//input[@value='Modify'])[2]
${BOOK_NOW_BUTTON}          xpath://button[contains(@class,'book_button') and normalize-space()='Book Now']
${ROOM_CHECKBOX}            xpath:(//input[@name='rooms[]'])[1]

*** Keywords ***
Wait Until Hotel Details Loaded
    Wait Until Element Is Visible    ${AVAILABLE_ROOMS_TITLE}

Modify Dates And Guests
    Log Step    Modifying dates and guests
    Scroll To Element    ${AVAILABLE_ROOMS_TITLE}
    Select By Value    ${CHILD_SELECT}    2
    Click    ${MODIFY_BUTTON}

Select Room And Book
    Log Step    Selecting room and booking hotel
    Click By Javascript    ${ROOM_CHECKBOX}
    Click    ${BOOK_NOW_BUTTON}
