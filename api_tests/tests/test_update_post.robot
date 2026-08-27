*** Settings ***
Resource    ../../config/config.robot
Resource    ../resources/api_keywords.robot
Resource    ../data/update_post_payload.robot

*** Test Cases ***
Update Post
    Create API Session    jsonplaceholder    ${API_BASE_URL}

    ${response}=    Send PUT Request
    ...    jsonplaceholder
    ...    /posts/1
    ...    ${UPDATE_POST_PAYLOAD}

    Response Status Should Be        ${response}    200
    Response Time Should Be Less Than    ${response}    2
    Response JSON Value Should Be    ${response}    $.id       ${1}
    Response JSON Value Should Be    ${response}    $.title    Updated title
    Response JSON Value Should Be    ${response}    $.body     Updated body