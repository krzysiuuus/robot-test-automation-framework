*** Settings ***
Resource    ../../config/config.robot
Resource    ../resources/api_keywords.robot

Test Template    Verify Single User

*** Test Cases ***
Get User 1    1
Get User 2    2
Get User 3    3

*** Keywords ***
Verify Single User
    [Arguments]    ${user_id}

    ${user_id}=    Convert To Integer    ${user_id}

    Create API Session    jsonplaceholder    ${API_BASE_URL}

    ${response}=    Send GET Request    jsonplaceholder    /users/${user_id}

    Response Status Should Be    ${response}    200
    Response Time Should Be Less Than    ${response}    2
    Response JSON Value Should Be    ${response}    $.id    ${user_id}

    Response Should Match Schema
    ...    ${response}
    ...    api_tests/schemas/user_schema.json