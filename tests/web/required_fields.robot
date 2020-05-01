*** Settings ***
Resource            ../../resources/steps_kw.robot

Suite Setup         Run keywords        Logged with "ruan@alesi.io"
...                 AND                 And I am at the register page
Suite Teardown      End Session

Test Teardown       End Test
Test Template       Not registered ad

*** Variables ***
${no_thumb}=        {"thumb": "", "name": "Elleven Rocker 26 Marchas", "brand": "Shimano", "price": "15" }
${no_name}=         {"thumb": "elleven.jpg", "name": "", "brand": "Shimano", "price": "15" }
${no_brand}=        {"thumb": "elleven.jpg", "name": "Elleven Rocker 26 Marchas", "brand": "", "price": "15" }

*** Test Cases ***      bike            alert
No picture ad      ${no_thumb}     Precisamos de uma foto para o seu anúncio!     
No name ad         ${no_name}      Informe a descrição do anúncio!
No brand ad        ${no_brand}     Informe a marca da sua Bike :)


*** Keywords ***
Not registered ad
    [Arguments]     ${bike}     ${Text}

    I have a beautiful ${bike}
    When I ad this bike
    So I have to see an error message "${Text}"
