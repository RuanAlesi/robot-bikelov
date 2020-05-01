*** Settings ***

Resource        ../../../resources/services.robot

Test Setup      Create session      bikelov      ${BASE_URL}

*** Test Cases ***
Create a new bike Ad   
    ${user_id}=     Get user id             alesi@bikelov.com.br          
    ${payload}=     Convert to json         {"name": "Elleven Rocker", "brand": "Shimano", "price": "15"}
    Remove Bike     ${payload['name']}

    ${resp}=        Post Bike Ad    ${user_id}      ${payload}      elleven.jpg
    
    Should Be Equal As Strings      ${resp.status_code}             200

Empty name
    [Template]      Required fields     
    {"name": "", "brand": "Shimano", "price": "15"}     1001    Bike name is required

Empty brand
    [Template]      Required fields     
    {"name": "Elleven Rocker", "brand": "", "price": "15"}     1002    Brand is required

*** Keywords ***
Required fields
    [Arguments]     ${json}         ${expected_bcode}               ${expected_message}
    ${user_id}=     Get user id             alesi@bikelov.com.br          
    ${payload}=     Convert to json         ${json}
    Remove Bike     ${payload['name']}

    ${resp}=        Post Bike Ad    ${user_id}      ${payload}      elleven.jpg
    
    Should Be Equal As Strings      ${resp.status_code}             412
    Should Be Equal As Strings      ${resp.json()['code']}          ${expected_bcode}
    Should Be Equal As Strings      ${resp.json()['error']}         ${expected_message}
