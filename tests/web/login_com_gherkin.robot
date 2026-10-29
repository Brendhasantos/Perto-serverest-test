language: pt-br

*** Configurações ***
Documentação        Teste de login

Biblioteca          SeleniumLibrary

Inicialização De Teste    Open Browser    ${URL}    ${BROWSER}
Finalização De Teste      Close Browser


*** Variáveis ***
${URL}           https://front.serverest.dev/
${BROWSER}       chrome

${EMAIL_VALIDO}            celso@rothmail.com
${SENHA_CORRETA}           admin123


*** Casos de Teste ***
Login com sucesso
    [Tags]    happy_path
    
    Dado que a tela de login do sistema carregou
    Quando preencho corretamente meus dados de login
    E submeto o formulário para entrar
    Então devo visualizar a Serverest Store
    E devo visualizar as opções restritas
    E não devo mais visualizar a tela de login


*** Palavras-Chave ***
que a tela de login do sistema carregou
    Wait Until Page Contains Element
    ...    link: Cadastre-se   
    ...    timeout= 10s    
    ...    error= O sistema demora demais para carregar.

preencho corretamente meus dados de login
    Input Text      id: email      ${EMAIL_VALIDO}
    Input Password  id: password   ${SENHA_CORRETA}

submeto o formulário para entrar
    Click Button    tag: button

devo visualizar a Serverest Store
    Wait Until Page Contains            Serverest Store  timeout=5s

devo visualizar as opções restritas
    Wait Until Page Contains Element    xpath: //button[text() = 'Logout']
    
não devo mais visualizar a tela de login
    Page Should Not Contain    Login
    Capture Page Screenshot