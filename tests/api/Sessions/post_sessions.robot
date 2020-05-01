*** Settings ***
Resource        ../../../resources/services.robot

Test Setup      Create session      bikelov      ${BASE_URL}

*** Test Cases ***
User session    
    ${payload}=     Convert to json         {"email": "fernando@bol.com.br"}
    ${resp}=        Post session    ${payload}
    Should Be Equal As Strings      ${resp.status_code}     200

Wrong email    
    ${payload}=     Convert to json         {"email": "wrong&mail.com.br"}
    ${resp}=        Post session    ${payload}
    Should Be Equal As Strings      ${resp.status_code}     409

Empty email    
    ${payload}=     Convert to json         {"email": ""}
    ${resp}=        Post session    ${payload}
    Should Be Equal As Strings      ${resp.status_code}     412

Without data    
    ${payload}=     Convert to json         {}
    ${resp}=        Post session    ${payload}
    Should Be Equal As Strings      ${resp.status_code}     412

