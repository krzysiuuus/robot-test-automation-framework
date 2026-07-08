*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary

*** Keywords ***
Create API Session
    [Arguments]    ${alias}    ${base_url}

    Create Session
    ...    ${alias}
    ...    ${base_url}

Send GET Request
    [Arguments]    ${alias}    ${endpoint}

    ${response}=    GET On Session
    ...    ${alias}
    ...    ${endpoint}
    ...    expected_status=any

    RETURN    ${response}

Response Status Should Be
    [Arguments]    ${response}    ${expected_status}

    Should Be Equal As Integers
    ...    ${response.status_code}
    ...    ${expected_status}


Response JSON Value Should Be
    [Arguments]    ${response}    ${json_path}    ${expected_value}

    ${value}=    Get Value From Json
    ...    ${response.json()}
    ...    ${json_path}

    Should Be Equal
    ...    ${value}[0]
    ...    ${expected_value}

Response Time Should Be Less Than
    [Arguments]    ${response}    ${max_seconds}

    ${elapsed}=    Set Variable    ${response.elapsed.total_seconds()}

    Should Be True
    ...    ${elapsed} < ${max_seconds}
    ...    Response time ${elapsed}s is not less than ${max_seconds}s

Send POST Request
    [Arguments]    ${alias}    ${endpoint}    ${payload}

    ${response}=    POST On Session
    ...    ${alias}
    ...    ${endpoint}
    ...    json=${payload}
    ...    expected_status=any

    RETURN    ${response}

Send PUT Request
    [Arguments]    ${alias}    ${endpoint}    ${payload}

    ${response}=    PUT On Session
    ...    ${alias}
    ...    ${endpoint}
    ...    json=${payload}
    ...    expected_status=any

    RETURN    ${response}

Send DELETE Request
    [Arguments]    ${alias}    ${endpoint}

    ${response}=    DELETE On Session
    ...    ${alias}
    ...    ${endpoint}
    ...    expected_status=any

    RETURN    ${response}