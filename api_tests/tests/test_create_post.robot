*** Settings ***
Resource    ../../config/config.robot
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