*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     OperatingSystem
Library     lib/mongo.py


*** Variables ***
${BASE_URL}     http://bikelov-api.herokuapp.com

*** Keywords ***
### SESSIONS
Post session
    [Arguments]     ${payload}
    &{headers}=     Create Dictionary       Content-Type=application/json
    ${resp}=        Post Request     bikelov      /sessions     data=${payload}     headers=${headers}
    [Return]        ${resp}

Get user id
    [Arguments]     ${email}
    ${payload}=     Convert to json         {"email": "${email}"}
    ${resp}         Post session            ${payload}
    [Return]        ${resp.json()['_id']}

### BIKES
Post Bike Ad
    [Arguments]     ${user_id}      ${payload}      ${thumb}

    &{headers}=     Create Dictionary   user_id=${user_id}

    ${file_bin}=    Get Binary File     ${CURDIR}/images/${thumb}
    &{files}=       Create Dictionary   thumbnail=${file_bin}

                                    #sessao
    ${resp}=        Post Request    bikelov      /bikes     data=${payload}     headers=${headers}     files=${files}
    [Return]        ${resp}

Get bike ad id
    [Arguments]     ${bike_id}      ${user_id}
    &{headers}=     Create Dictionary   Content-Type=application/json    user_id=${user_id}

    ${resp}=        Get Request     bikelov     /bikes/${bike_id}   headers=${headers}
    [Return]        ${resp}

Delete bike ad
    [Arguments]     ${bike_id}      ${user_id}
    &{headers}=     Create Dictionary   Content-Type=application/json   user_id=${user_id}

    ${resp}=        Delete Request     bikelov     /bikes/${bike_id}   headers=${headers}
    [Return]        ${resp}
    
### HELPERS
Convert to json
    [Arguments]     ${target}
    ${result}       evaluate        json.loads($target)     json
    [Return]        ${result}