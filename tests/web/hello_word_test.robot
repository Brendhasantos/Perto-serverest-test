*** Variables ***
${NOME}     Maria
${CURSO}    Automação de testes

*** Test Cases ***
Ler variaveis
    Log To Console    Aluna: ${NOME}
    Log To Console    Curso: ${CURSO}

Criar e alterar variável no teste
    ${nota}=    Set Variable    7
    Log To Console    Nota inicial: ${nota}
    ${nota}=    Set Variable    9
    Log To Console    Nota final: ${nota}