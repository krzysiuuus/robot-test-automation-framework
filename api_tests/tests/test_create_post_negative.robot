*** Settings ***
Library     Collections

Resource    ../../core/config.robot
Resource    ../resources/api_keywords.robot

*** Test Cases ***
Create Post With Invalid Data
    Create API Session    jsonplaceholder    ${API_BASE_URL}

    ${payload}=    Create Dictionary
    ...    title=
    ...    body=
    ...    userId=

    ${response}=    Send POST Request    jsonplaceholder    /posts    ${payload}

    Response Status Should Be    ${response}    201
    Response Time Should Be Less Than    ${response}    2

    ${response_body}=    Set Variable    ${response.json()}

    Dictionary Should Contain Key    ${response_body}    id