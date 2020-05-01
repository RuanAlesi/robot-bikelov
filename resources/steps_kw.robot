*** Settings ***
Resource    base.robot
Library     ./lib/mongo.py

*** Keywords ***
## Login
When I am in login page
    Go To       ${BASE_URL}

When I put my login "${email}"
    Input Text          id:email       ${email}
    Click Element       xpath://button[contains(text(), 'Quero Anúnciar')]

So the logged page has to be show
    Page Should Contain Element     class:dashboard

So there will a alert message "${expect_message}"
    Element Text Should Be     class:alert-dark     ${expect_message}

So I have to see an error message "${expect_message}"
    Element Text Should Be     class:alert-error     ${expect_message}

## Ads
I have a beautiful ${bike_string}
    ${bike_json}=       evaluate        json.loads($bike_string)    json
    Log                 ${bike_json}
    Set Test Variable   ${bike_json}
    Remove Bike         ${bike_json['name']}

And I am at the register page
    Click Link          /new

When I ad this bike
    BuiltIn.Run keyword if           "${bike_json['thumb']}" != "${Empty}"      Choose File         css:#thumbnail input                ${CURDIR}\\images\\${bike_json['thumb']}
    Clear Element text      id:name
    Input Text              id:name                             ${bike_json['name']}
    Clear Element text      id:brand
    Input Text              id:brand                            ${bike_json['brand']}
    Input Text              css:input[placeholder$=dia]         ${bike_json['price']}
    Click Element           class:btn-red

So I have to see my bike in the ads list
    Wait Until Element Is Visible   css:.bike-list li
    Element Should Contain          class:bike-list     ${bike_json['name']}

And the rent price has to be "${expect_price}"
    Element Should Contain      class:bike-list     ${expect_price}
