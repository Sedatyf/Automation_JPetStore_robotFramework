*** Settings ***
Documentation    Se connecter en tant qu'utilisateur au store
Library          Selenium2Library

*** Test Cases ***
Entrer dans JPetStore
    [Documentation]    Enter in the store

    Open Browser                     https://petstore.octoperf.com/       chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="Content"]/p[1]/a
    Click Link                       xpath=//*[@id="Content"]/p[1]/a
    Wait Until Element Is Enabled    xpath=//*[@id="MenuContent"]/a[2]

Connexion en tant qu'utilisateur
    [Documentation]    Se connecter en tant qu'utilisateur ABC

    Click Link                xpath=//*[@id="MenuContent"]/a[2]
    Element Text Should Be    xpath=//*[@id="Catalog"]/form/p[1]    Please enter your username and password.
    Clear Element Text        name=username
    Clear Element Text        name=password
    Input Text                name=username                         j2ee
    Input Text                name=password                         j2ee
    Click Button              name=signon
    Element Text Should Be    id=WelcomeContent                     Welcome ABC!

[Teardown]    Close Browser