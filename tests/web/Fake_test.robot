*** Settings ***
Documentation    Teste da funcionalidade de
...              Cadastro de usuários.

Library          SeleniumLibrary
Library          FakerLibrary

Test Setup       Open Browser    ${URL}    ${BROWSER}
Test Teardown    Close Browser


*** Variables ***
${URL}           https://front.serverest.dev/
${BROWSER}       chrome


*** Test Cases ***
Cadastrar um usuario com sucesso
    Given que acessei o sistema ServeRest
    And acessei a pagina de cadastro
    When preencho o formulário com dados válidos aleatórios
    And submeto os dados
    Then devo ver a mensagem de sucesso na tela


*** Keywords ***
Que acessei o sistema ServeRest
    Wait Until Element Is Visible    link:Cadastre-se
    ...    timeout=10s
    ...    error=O sistema demora demais para carregar

Acessei a pagina de cadastro
    Click Link    link:Cadastre-se

Preencho o formulário com dados válidos aleatórios
    ${NOME}=     FakerLibrary.Name
    ${EMAIL}=    FakerLibrary.Email       domain=dbservices.pt
    ${SENHA}=    FakerLibrary.Password    length=8
    Log    Usuário fake gerado: nome=${NOME}, email=${EMAIL}
    Input Text        id:nome        ${NOME}
    Input Text        id:email       ${EMAIL}
    Input Password    id:password    ${SENHA}

Submeto os dados
    Click Button    tag:button

Devo ver a mensagem de sucesso na tela
    Wait Until Page Contains    Cadastro realizado com sucesso
    ...    timeout=5s
    ...    error=A mensagem de sucesso não foi exibida. Revise o cadastro.
