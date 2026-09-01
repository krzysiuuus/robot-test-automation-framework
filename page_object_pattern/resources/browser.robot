*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../../core/config.robot
Resource    ../resources/logger.robot

*** Keywords ***
Open Local Browser
    ${browser}=    Convert To Lower Case    ${BROWSER}

    IF    '${browser}' == 'chrome'
        Open Chrome Browser
    ELSE IF    '${browser}' == 'firefox'
        Open Firefox Browser
    ELSE IF    '${browser}' == 'edge'
        Open Edge Browser
    END

Open Remote Browser
    Log Step    Opening remote browser: ${BROWSER} on ${REMOTE_URL}

    ${options}=    Get Browser Options    ${BROWSER}

    Open Browser
    ...    about:blank
    ...    browser=${BROWSER}
    ...    remote_url=${REMOTE_URL}
    ...    options=${options}

Open Browser Session
    Validate Browser Configuration
    IF    '${EXECUTION}' == 'LOCAL'
        Open Local Browser
    ELSE IF    '${EXECUTION}' == 'REMOTE'
        Open Remote Browser
    ELSE
        Fail    Unsupported execution type: ${EXECUTION}. Supported types: LOCAL, REMOTE
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

Get Edge Options
    ${options}=    Catenate    SEPARATOR=;
    ...    add_argument("--headless=new")
    ...    add_argument("--no-sandbox")
    ...    add_argument("--disable-dev-shm-usage")
    ...    add_argument("--window-size=1920,1080")

    RETURN    ${options}

Open Edge Browser
    Log Step    Opening Edge browser
    IF    '${HEADLESS}' == 'True'
        ${options}=    Get Edge Options
        Open Browser    about:blank    Edge    options=${options}
    ELSE
        Open Browser    about:blank    Edge
        Maximize Browser Window
    END

Get Browser Options
    [Arguments]    ${browser_name}

    ${browser}=    Convert To Lower Case    ${browser_name}

    IF    '${browser}' == 'chrome'
        ${options}=    Get Chrome Options
    ELSE IF    '${browser}' == 'firefox'
        ${options}=    Get Firefox Options
    ELSE IF    '${browser}' == 'edge'
        ${options}=    Get Edge Options
    ELSE
        Fail    Unsupported browser: ${browser_name}
    END

    RETURN    ${options}

Log Current Page State
    ${current_url}=    Get Location
    ${title}=          Get Title

    Log To Console    CURRENT URL: ${current_url}
    Log To Console    PAGE TITLE: ${title}

    Capture Page Screenshot