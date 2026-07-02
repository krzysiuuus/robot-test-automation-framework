*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../../config/config.robot
Resource    ../resources/logger.robot

*** Keywords ***
Open Browser Session
    Validate Browser Configuration
    ${browser}=    Convert To Lower Case    ${BROWSER}

    IF    '${browser}' == 'chrome'
        Open Chrome Browser
    ELSE IF    '${browser}' == 'firefox'
        Open Firefox Browser
    ELSE IF    '${browser}' == 'edge'
        Open Edge Browser
    END

    Set Selenium Timeout          ${TIMEOUT}
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Set Selenium Speed            ${SELENIUM_SPEED}

Capture Screenshot If Test Failed
    Run Keyword If Test Failed    Capture Page Screenshot

Close Browser Session
    Capture Screenshot If Test Failed
    Close Browser

Validate Browser Configuration
    ${browser}=    Convert To Lower Case    ${BROWSER}
    IF    '${browser}' == 'chrome'
        RETURN
    END

    IF    '${browser}' == 'firefox'
        RETURN
    END

    IF    '${browser}' == 'edge'
        RETURN
    END

    Fail
    ...    Unsupported browser: ${BROWSER}\n
    ...    Supported browsers: Chrome, Firefox, Edge

Get Chrome Options
    ${options}=    Catenate    SEPARATOR=;
    ...    add_argument("--headless=new")
    ...    add_argument("--no-sandbox")
    ...    add_argument("--disable-dev-shm-usage")
    ...    add_argument("--window-size=1920,1080")

    RETURN    ${options}

Open Chrome Browser
    Log Step    Opening Chrome browser
    IF    '${HEADLESS}' == 'True'
        ${options}=    Get Chrome Options
        Open Browser    about:blank    Chrome    options=${options}
    ELSE
        Open Browser    about:blank    Chrome
        Maximize Browser Window
    END

Get Firefox Options
    ${options}=    Set Variable
    ...    add_argument("--headless")
    RETURN    ${options}

Open Firefox Browser
    Log Step    Opening Firefox browser
    IF    '${HEADLESS}' == 'True'
        ${options}=    Get Firefox Options
        Open Browser    about:blank    Firefox    options=${options}
    ELSE
        Open Browser    about:blank    Firefox
        Set Window Size    1920    1080
    END

Open Edge Browser
    Log Step    Opening Edge browser
    Open Browser    about:blank    Edge
    Maximize Browser Window