*** Settings ***
Documentation       Login
...                 Para que eu possa ter acesso a interface de gestão de anúncios
...                 Sendo um usuário que possui um email
...                 Quero poder iniciar uma nova sessão

Resource     ../../resources/steps_kw.robot

Suite Setup      Start Session
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
User login success
    When I am in login page
    When I put my login "eu@papito.io"
    So the logged page has to be show
    
Wrong login
    [Template]      Try to login
    eupapito.io     Oops. Informe um email válido!

Wrong character
    [Template]      Try to login
    eu&papito.io    Oops. Informe um email válido!

No email
    [Template]      Try to login
    ${EMPTY}        Oops. Informe um email válido!

*** Keywords ***
Try to login
    [Arguments]     ${email}    ${expect_message}
    When I am in login page
    When I put my login "${email}"
    So there will a alert message "${expect_message}"

