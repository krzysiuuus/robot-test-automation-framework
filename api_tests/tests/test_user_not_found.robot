*** Settings ***
Resource    ../../core/config.robot
Resource    ../resources/api_keywords.robot

*** Test Cases ***
User Not Found
    Create API Session    jsonplaceholder    ${API_BASE_URL}

    ${response}=    Send GET Request    jsonplaceholder    /users/999

    Response Status Should Be    ${response}    404
    Response Time Should Be Less Than    ${response}    2