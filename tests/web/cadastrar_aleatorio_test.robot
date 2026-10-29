language: pt-BR

*** Configurações ***
Documentação     Teste da funcionalidade de 
...              Cadastro de Usuários.

Biblioteca       SeleniumLibrary
Biblioteca       FakerLibrary        locale=pt_BR

Recurso          ../../resources/configs/qa.resource

Test Setup       Open Browser    ${URL}    ${BROWSER}
Test Teardown    Close Browser

Test Tags        cadastro    faker


*** Casos De Teste ***
Cadastrar um usuário com sucesso
    Dado que acessei o sistema ServeRest
    E acessei a página de cadastro
    Quando preecho o formulário com dados válidos aleatórios
    Quando submeto os dados
    Então devo ver a mensagem de sucesso na tela


*** Palavras-Chave ***
que acessei o sistema ServeRest
    Wait Until Element Is Visible
    ...    link: Cadastre-se   
    ...    timeout= 10s    
    ...    error= O sistema demora demais para carregar.
    
acessei a página de cadastro
    Click Link        Cadastre-se

preecho o formulário com dados válidos aleatórios
    ${NOME} =    FakerLibrary.Name
    ${EMAIL} =   FakerLibrary.Email       domain=dbservices.pt
    ${SENHA} =   FakerLibrary.Password    length=8

    Input Text        id: nome        ${NOME}
    Input Text        id: email       ${EMAIL}
    Input Password    id: password    ${SENHA}
    
submeto os dados
    Click Button      tag: button

devo ver a mensagem de sucesso na tela
    Wait Until Page Contains    
    ...    Cadastro realizado com sucesso
    ...    timeout=5s 
    ...    error=A mensagem de sucesso não foi exibida. Revise o cadastro.

    Capture Page Screenshot