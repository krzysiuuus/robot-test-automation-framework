*** Settings ***
Resource    ../../config/config.robot
Resource    ../resources/api_keywords.robot

*** Test Cases ***
Get Single User
    Create API Session    jsonplaceholder    ${API_BASE_URL}

    ${response}=    Send GET Request    jsonplaceholder    /users/2

    Response Status Should Be    ${response}    200
    Response Time Should Be Less Than    ${response}    2
    Response JSON Value Should Be    ${response}    $.id       ${2}
    Response JSON Value Should Be    ${response}    $.email    Shanna@melissa.tv
    Response JSON Value Should Be    ${response}    $.company.name    Deckow-Crist