*** Settings ***
Resource    ../../core/config.robot
Resource    ../resources/api_keywords.robot
Resource    ../data/create_post_payload.robot

*** Test Cases ***
Create Post
    Create API Session    jsonplaceholder    ${API_BASE_URL}

    ${response}=    Send POST Request
    ...    jsonplaceholder
    ...    /posts
    ...    ${CREATE_POST_PAYLOAD}

    Response Status Should Be    ${response}    201
    Response Time Should Be Less Than    ${response}    2

    ${body}=    Set Variable    ${response.json()}

    Should Be Equal    ${body}[title]    ${CREATE_POST_PAYLOAD}[title]
    Should Be Equal    ${body}[body]     ${CREATE_POST_PAYLOAD}[body]
    Should Be Equal As Integers    ${body}[userId]    ${CREATE_POST_PAYLOAD}[userId]