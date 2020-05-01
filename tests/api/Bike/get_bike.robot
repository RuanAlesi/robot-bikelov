*** Settings ***
Resource        ../../../resources/services.robot

Test Setup      Create session      bikelov      ${BASE_URL}

*** Test Cases ***
Get unique bike ad
    ${user_id}=     Get user id             alesi@bikelov.com.br 
    ${bike_ad}=     Convert to json         {"name": "Elleven Rocker", "brand": "Shimano", "price": "15", "thumbnail": "Elleven.jpg"}

    ${bike_ed_id}   create_bike_ad          ${bike_ad}          ${user_id}

    ${resp}=        Get bike ad id      ${bike_ed_id}           ${user_id}
    Should Be Equal As Strings          ${resp.status_code}     200
    
Get bike ad not found
    ${user_id}=         Get user id             alesi@bikelov.com.br 
    ${bike_ed_id}=      get_mongo_id 

    ${resp}=        Get bike ad id      ${bike_ed_id}           ${user_id}
    Should Be Equal As Strings          ${resp.status_code}     404
  
Get bike ad not authorized
    ${user_id}=         Get user id             alesi@bikelov.com.br 
    ${bike_ed_id}=      get_mongo_id 

    ${resp}=        Get bike ad id      ${bike_ed_id}           ${EMPTY}
    Should Be Equal As Strings          ${resp.status_code}     401
    
Get unique bike ad
    ${user_id}=     Get user id             alesi@bikelov.com.br 
    ${bike_ad}=     Convert to json         {"name": "Elleven Rocker", "brand": "Shimano", "price": "15", "thumbnail": "Elleven.jpg"}

    ${bike_ed_id}   create_bike_ad          ${bike_ad}          ${user_id}

    ${resp}=        Get bike ad id      ${bike_ed_id}           ${user_id}
    Should Be Equal As Strings          ${resp.status_code}     200