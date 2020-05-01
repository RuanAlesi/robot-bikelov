*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BASE_URL}     https://bikelov-anunciante.herokuapp.com

*** Keywords ***
Start Session
    Open Browser                    about:blank      chrome
    Set Selenium Implicit Wait      5
    Set Window Size                 1440    900

End Session
    Close Browser

Logged with "${email}"
    Start Session
    Go To               ${BASE_URL}

    Input Text          id:email       ${email}
    Click Element       xpath://button[contains(text(), 'Quero Anúnciar')]

    Page Should Contain Element     class:dashboard

End Test
    Capture Page Screenshot