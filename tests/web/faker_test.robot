*** Settings ***
Library    FakerLibrary    locale=pt_BR

Test Tags   faker    exemplos

*** Test Cases ***
Gerar um e-mail fake
    ${email}=    FakerLibrary.Email
    Log  ${email}


Gerar um CNPJ fake
    ${CNPJ}=    FakerLibrary.Cnpj
    Log  ${CNPJ}


Gerar um texto fake
    ${TEXTO}=    FakerLibrary.Text    max_nb_chars=300
    Log  ${TEXTO}
