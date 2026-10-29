language: pt-BR

*** Configurações ***
Documentação     Teste da funcionalidade de 
...              Cadastro de Usuários.

Biblioteca       SeleniumLibrary
Recurso          ../../resources/configs/qa.resource

Test Setup       Open Browser    ${URL}    ${BROWSER}
Test Teardown    Close Browser

Test Template    Cadastrar um usuário com sucesso


*** Casos De Teste ***         NOME      EMAIL                  SENHA        EH_ADMINISTRADOR    MENSAGEM_ESPERADA
Cadastrar administrador        Celso     celso4@rothmail.com    admin123     ${True}             Cadastro realizado com sucesso
Cadastrar não administrador    Fulane    fulane4@bol.com.br     teste123     ${False}            Cadastro realizado com sucesso


*** Palavras-Chave ***
Cadastrar um usuário com sucesso
    [Arguments]    ${NOME}    ${EMAIL}    ${SENHA}    ${EH_ADMINISTRADOR}    ${MENSAGEM_ESPERADA}

    Dado que acessei o sistema ServeRest
    E acessei a página de cadastro
    Quando preecho o formulário com meus dados        ${NOME}                ${EMAIL}    ${SENHA}
    E marco o campo "administrador" se for o caso     ${EH_ADMINISTRADOR}
    E submeto os dados
    Então devo ver a mensagem de sucesso na tela      ${MENSAGEM_ESPERADA}




que acessei o sistema ServeRest
    Wait Until Element Is Visible
    ...    link: Cadastre-se   
    ...    timeout= 10s    
    ...    error= O sistema demora demais para carregar.
    
acessei a página de cadastro
    Click Link        Cadastre-se

preecho o formulário com meus dados
    [Arguments]       ${NOME}         ${EMAIL}    ${SENHA}

    Input Text        id: nome        ${NOME}
    Input Text        id: email       ${EMAIL}
    Input Password    id: password    ${SENHA}
    
marco o campo "administrador" se for o caso
    [Arguments]       ${EH_ADMINISTRADOR}

    Run Keyword If    ${EH_ADMINISTRADOR}
    ...    Click Element     id: administrador
    
submeto os dados
    Click Button      tag: button

devo ver a mensagem de sucesso na tela
    [Arguments]       ${MENSAGEM_ESPERADA}

    Wait Until Page Contains    
    ...    ${MENSAGEM_ESPERADA}
    ...    timeout=5s 
    ...    error=A mensagem de sucesso não foi exibida. Revise o cadastro.

    Capture Page Screenshot
