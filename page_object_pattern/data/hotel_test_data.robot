*** Variables ***
&{TEST_USER}
...    first_name=Anon
...    last_name=Anonski
...    full_name=ANON ANONSKI
...    email=Anon@non.pl
...    phone=234567246
...    address=ANON 24/7
...    country=Poland

&{TEST_HOTEL}
...    city=Dubai
...    selected_hotel=Jumeirah Beach Hotel

@{TEST_EXPECTED_HOTELS}
...    Jumeirah Beach Hotel
...    Oasis Beach Tower
...    Rose Rayhaan Rotana
...    Hyatt Regency Perth

@{TEST_EXPECTED_PRICES}
...    $22
...    $50
...    $80
...    $150

@{TEST_GUESTS}
...    2
...    2

&{TEST_PAYMENT}
...    error=THE MERCHANT LOGIN ID OR PASSWORD IS INVALID OR THE ACCOUNT IS INACTIVE.

${TEST_NOTE}    The test is here old man