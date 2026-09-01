*** Variables ***
${PHP_BASE_URL}       http://www.kurs-selenium.pl/demo/
${SHOP_BASE_URL}         http://seleniumdemo.com/?page_id=7
${BROWSER}            Chrome
${TIMEOUT}            25s
${IMPLICIT_WAIT}      0s
${SELENIUM_SPEED}     0s
${HEADLESS}           False
${EXECUTION}          %{EXECUTION=LOCAL}
${REMOTE_URL}         %{REMOTE_URL=http://localhost:4444/wd/hub}
${API_BASE_URL}       %{API_BASE_URL=https://jsonplaceholder.typicode.com}
${REQRES_BASE_URL}    %{REQRES_BASE_URL=https://reqres.in/api}
${REQRES_API_KEY}     %{REQRES_API_KEY=reqres-free-v1}