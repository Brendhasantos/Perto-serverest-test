language: pt-br

*** Configurações ***
Documentação        Ações da página de Login.

Biblioteca          SeleniumLibrary

Recurso             ../page_objects/login_page_objects.resource


*** Palavras-Chave ***
Preencher campo de e-mail
    [Arguments]     ${email}
    Input Text      ${EMAIL_TEXT_FIELD}      ${email}


Preencher campo de senha
    [Arguments]     ${senha}
    Input Password  ${PASSWORD_TEXT_FIELD}   ${senha}


Submeter o formulário de cadastro
    Click Button    ${CADASTRAR_BUTTON}