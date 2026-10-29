language: pt-br

*** Configurações ***
Documentação        Teste de login

Biblioteca          SeleniumLibrary
Recurso             ../../resources/configs/qa.resource
Recurso             ../../resources/steps/login_steps.resource

Inicialização De Teste    Open Browser    ${URL}    ${BROWSER}
Finalização De Teste      Close Browser


*** Casos de Teste ***
Login com sucesso
    [Tags]    login    happy_path
    
    Dado que a tela de login do sistema carregou
    Quando preencho corretamente meus dados de login
    ...    email=celso@rothmail.com
    ...    senha=admin123
    E submeto o formulário para entrar
    Então devo visualizar a Serverest Store
    E devo visualizar as opções restritas
    E não devo mais visualizar a tela de login

