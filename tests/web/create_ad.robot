*** Settings ***
Documentation       Criar Anúncio
...                 Para que eu possa disponibilizar bikes para locação
...                 Sendo um anúnciante
...                 Quero poder cadastar um novo anúncio

Resource        ../../resources/steps_kw.robot

Suite Setup      Logged with "ruan@alesi.io"
Suite Teardown   End Session

Test Teardown    End Test

*** Variables ***
${bike}=        {"thumb": "elleven.jpg", "name": "Elleven Rocker 26 Marchas", "brand": "Shimano", "price": "15" }

*** Test Cases ***
Ad my bike
    I have a beautiful ${bike}
    And I am at the register page
    When I ad this bike
    So I have to see my bike in the ads list
    And the rent price has to be "R$15/dia"
