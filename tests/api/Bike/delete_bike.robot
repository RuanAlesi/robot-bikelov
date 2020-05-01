*** Settings ***
Resource        ../../../resources/services.robot

Test Setup      Create session      bikelov      ${BASE_URL}

*** Test Cases ***
Delete bike ad
    ${user_id}=     Get user id             alesi@bikelov.com.br 
    ${bike_ad}=     Convert to json         {"name": "Elleven Rocker", "brand": "Shimano", "price": "15", "thumbnail": "Elleven.jpg"}

    ${bike_ed_id}   create_bike_ad          ${bike_ad}          ${user_id}

    ${resp}=        Delete bike ad      ${bike_ed_id}           ${user_id}
    Should Be Equal As Strings          ${resp.status_code}     204