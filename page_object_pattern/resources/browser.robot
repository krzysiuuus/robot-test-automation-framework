*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../../config/config.robot

*** Keywords ***
Open Browser Page
    Validate Browser
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

Close Browser Page
    Close Browser

Validate Browser
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

Open Chrome Browser
    IF    '${HEADLESS}' == 'True'
        Open Browser    about:blank    Chrome    options=add_argument("--headless=new"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage"); add_argument("--window-size=1920,1080")
    ELSE
        Open Browser    about:blank    Chrome
        Maximize Browser Window
    END

Open Firefox Browser
    Open Browser    about:blank    Firefox
    Set Window Size    1920    1080

Open Edge Browser
    Open Browser    about:blank    Edge
    Maximize Browser Window