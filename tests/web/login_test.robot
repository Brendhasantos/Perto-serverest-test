*** Settings ***
Documentation    Cenários de teste da funcionalidade de Login.

Library          SeleniumLibrary

Test Tags        login   web
Test Setup       Open Browser    ${URL}    ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${URL}           https://front.serverest.dev/
${BROWSER}       chrome

${EMAIL_VALIDO}            celso@rothmail.com
${EMAIL_NAO_CADASTRADO}    invalido@tan.com.br
${SENHA_CORRETA}           admin123
${SENHA_INCORRETA}         senha_incorreta

*** Test Cases ***
Login com sucesso
    [Tags]    happy_path
    
    Wait Until Page Contains Element
    ...    link: Cadastre-se   
    ...    timeout= 10s    
    ...    error= O sistema demora demais para carregar.
    
    Input Text      id: email      ${EMAIL_VALIDO}
    Input Password  id: password   ${SENHA_CORRETA}
    Click Button    tag: button
    
    Wait Until Page Contains            Serverest Store  timeout=5s
    Wait Until Page Contains Element    xpath: //button[text() = 'Logout']
    Page Should Not Contain    Login
    Capture Page Screenshot


Login com e-mail não cadastrado
    [Tags]    non_happy_path
    
    Wait Until Page Contains Element
    ...    link: Cadastre-se   
    ...    timeout= 10s    
    ...    error= O sistema demora demais para carregar.
    
    Input Text      id: email      ${EMAIL_NAO_CADASTRADO}
    Input Password  id: password   ${SENHA_CORRETA}
    Click Button    tag: button
    
    Wait Until Page Contains     Email e/ou senha inválidos    timeout=5s
    Page Should Not Contain      Serverest Store
    Capture Page Screenshot

Login com senha incorreta
    [Tags]    non_happy_path

    Wait Until Page Contains Element
    ...    link: Cadastre-se   
    ...    timeout= 10s    
    ...    error= O sistema demora demais para carregar.
    
    Input Text      id: email        ${EMAIL_VALIDO}
    Input Password  id: password     ${SENHA_INCORRETA}
    Click Button    tag: button
    
    Wait Until Page Contains          Email e/ou senha inválidos  timeout=5s
    Page Should Not Contain Button    xpath: //button[text() = 'Logout']
    Page Should Contain Button        xpath: //button[text() = 'Entrar']
    Capture Page Screenshot


Login com e-mail vazio
    [Tags]    non_happy_path
    
    Wait Until Page Contains Element
    ...    link: Cadastre-se   
    ...    timeout= 10s    
    ...    error= O sistema demora demais para carregar.
    
    Input Text      id: email        ${EMPTY}
    Input Password  id: password     ${SENHA_CORRETA}
    Click Button    tag: button
    
    Wait Until Page Contains          Email é obrigatório  timeout=5s
    Page Should Not Contain Button    xpath: //button[text() = 'Logout']
    Page Should Contain Button        xpath: //button[text() = 'Entrar']
    Capture Page Screenshot


Login com password vazio
    [Tags]    non_happy_path
    
    Wait Until Page Contains Element
    ...    link: Cadastre-se   
    ...    timeout= 10s    
    ...    error= O sistema demora demais para carregar.
    
    Input Text      id: email         ${EMAIL_VALIDO}
    Input Password  id: password      ${EMPTY}
    Click Button    tag: button
    
    Wait Until Page Contains          Password é obrigatório   timeout=5s
    Page Should Not Contain Button    xpath: //button[text() = 'Logout']
    Page Should Contain Button        xpath: //button[text() = 'Entrar']
    Capture Page Screenshot

