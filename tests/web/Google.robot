*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser    https://www.google.com    chrome
Test Teardown    Close Browser

*** Test Cases ***
Abrir o Google
    Title Should Be    Google
