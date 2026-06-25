*** Settings ***
Library    DateTime

*** Keywords ***
Get Flight Date Range
    ${departure_date}=    Get Current Date    increment=7 days    result_format=%Y-%m-%d
    ${return_date}=       Get Current Date    increment=14 days    result_format=%Y-%m-%d
    RETURN    ${departure_date}    ${return_date}

Get Hotel Date Range
    ${check_in}=     Get Current Date    increment=7 days    result_format=%d/%m/%Y
    ${check_out}=    Get Current Date    increment=8 days    result_format=%d/%m/%Y
    RETURN    ${check_in}    ${check_out}