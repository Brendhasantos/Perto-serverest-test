*** Settings ***
Documentation    Teste da funcionalidade de
...              Cadastro de usuários.

Library          SeleniumLibrary

Test Setup       Open Browser    ${URL}    ${BROWSER}
Test Teardown    Close Browser

Test Template    Cadastrar um usuario com sucesso

*** Variables ***
${URL}           https://front.serverest.dev/
${BROWSER}       chrome

*** Test case ***            NOME     EMAIL                 SENHA       EH_ADMINISTRADOR        MENSAGEM_ESPERADA
Cadastrar administrador      Brendha  brendhaa@bol.com.br   admin123     ${True}                Cadastro realizado com sucesso
Cadastrar não administrador  Bruna    Brunaa@bol.com.br     teste123     ${False}               Cadastro realizado com sucesso
Cadastrar senha incorreta    Barbara  barbaraa@uol.com.br   errada123    ${False}               deve ser uma senha válido
Email não cadastrado         bete     nada.nada             admin123     ${False}               email deve ser um email válido
Cadastro com email vazio     carol    ${EMPTY}              senha123     ${False}               email é obrigatório
Cadastro com senha vazia     livia    livia@bol.com.br      ${EMPTY}     ${False}               Password é obrigatório

*** keywords ***

Cadastrar um usuario com sucesso
    [Arguments]    ${NOME}    ${EMAIL}    ${SENHA}    ${EH_ADMINISTRADOR}    ${MENSAGEM_ESPERADA}

    Click Link        Cadastre-se

    Input Text        id:nome        ${NOME}
    Input Text        id:email       ${EMAIL}
    Input Password    id:password    ${SENHA}

    Run Keyword If    ${EH_ADMINISTRADOR}    Click Element    id:administrador

    Click Button      css:button[type="submit"]

    Wait Until Page Contains    ${MENSAGEM_ESPERADA}
    ...    timeout=10s
    ...    error=A mensagem de sucesso não foi exibida. Revise o cadastro.

    Capture Page Screenshot

Cadastrar senha incorreta
    [Arguments]    ${NOME}    ${EMAIL}    ${SENHA}    ${EH_ADMINISTRADOR}    ${MENSAGEM_ESPERADA}
    
    Dado que acessei o sistema ServeRest
    E acessei a pagina de cadastro
    Quando preencho o formulário com senha incorreta    ${NOME}
    Então devo ver a mensagem de senha invalida         ${MENSAGEM_ESPERADA}


Email não cadastrado
    [Arguments]    ${NOME}    ${EMAIL}    ${SENHA}    ${EH_ADMINISTRADOR}    ${MENSAGEM_ESPERADA}

    Dado que acessei o sistema ServeRest
    E acessei a pagina de cadastro
    Quando preencho o formulario com email não cadastrado    ${NOME}
    Então deve ver a mensagem de email invalido              ${MENSAGEM_ESPERADA}

Cadastro com email vazio
    [Arguments]    ${NOME}    ${EMAIL}    ${SENHA}    ${EH_ADMINISTRADOR}    ${MENSAGEM_ESPERADA}

    Dado que acessei o sistema ServeRest
    E acessei a pagina de cadastro
    Quando preencho o formulario com o campo email vazio           ${NOME}
    Então deve ver a mensagem de campo não pode ficar em branco    ${MENSAGEM_ESPERADA}

Cadastro com senha vazia
    [Arguments]    ${NOME}    ${EMAIL}    ${SENHA}    ${EH_ADMINISTRADOR}    ${MENSAGEM_ESPERADA}

    Dado que acessei o sistema ServeRest
    E acessei a pagina de cadastro
    Quando preencho o formulario com o campo de senha vazio        ${NOME}
    Então deve ver a mensagem de campo não pode ficar em branco    ${MENSAGEM_ESPERADA}

