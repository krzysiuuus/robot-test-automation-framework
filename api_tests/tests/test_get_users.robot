*** Settings ***
Resource    ../../core/config.robot
Resource    ../resources/api_keywords.robot

*** Test Cases ***
Get Users
    Create API Session    jsonplaceholder    ${API_BASE_URL}

    ${response}=    Send GET Request    jsonplaceholder    /users

    Response Status Should Be    ${response}    200
    Response Time Should Be Less Than    ${response}    2

    ${body}=    Set Variable    ${response.json()}
    Should Not Be Empty    ${body}
    Should Be Equal As Integers    ${body}[0][id]    1