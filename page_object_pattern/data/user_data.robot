*** Variables ***
${DEFAULT_PASSWORD}    Qwerty123!@#123

${INVALID_EMAIL}       qwerty@o2.pls

&{BILLING_ADDRESS}
...    first_name=john
...    last_name=doe
...    country=Poland
...    street=Kwiatowa 11
...    postcode=01-001
...    city=Warsaw
...    phone=123123123

${ADDRESS_CHANGED_MESSAGE}    Address changed successfully.

${INVALID_LOGIN_ERROR_MESSAGE}      ERROR: Incorrect username or password.

${DUPLICATE_EMAIL_ERROR_MESSAGE}    An account is already registered with your email address.