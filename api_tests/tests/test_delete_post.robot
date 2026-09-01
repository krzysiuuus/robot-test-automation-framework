*** Settings ***
Resource    ../../core/config.robot
Resource    ../resources/api_keywords.robot

*** Test Cases ***
Delete Post
    Create API Session    jsonplaceholder    ${API_BASE_URL}

    ${response}=    Send DELETE Request
    ...    jsonplaceholder
    ...    /posts/1

    Response Status Should Be    ${response}    200
    Response Time Should Be Less Than    ${response}    2