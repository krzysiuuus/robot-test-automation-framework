*** Settings ***
Library    String

*** Keywords ***
Generate Email
    ${random_string}=    Generate Random String    8    [NUMBERS]
    ${email}=    Set Variable    ${random_string}qwerty@o2.pl
    RETURN    ${email}