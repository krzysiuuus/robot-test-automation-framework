*** Variables ***
&{TEST_USER}
...    first_name=Anon
...    last_name=Anonski
...    full_name=ANON ANONSKI
...    email=Anon@non.pl
...    phone=234567246
...    address=ANON 24/7
...    country=Poland

&{TEST_FLIGHT}
...    departure_city=Warsaw Intl Arpt
...    arrival_city=Dubai Intl Arpt
...    airline=Air Arabia

@{TEST_TRAVELLERS}
...    2
...    2
...    2

&{TEST_PAYMENT}
...    error=THE MERCHANT LOGIN ID OR PASSWORD IS INVALID OR THE ACCOUNT IS INACTIVE.

${TEST_NOTE}    The test is here old man