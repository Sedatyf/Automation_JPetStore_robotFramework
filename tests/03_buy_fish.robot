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

Accès à la page des articles Fish
    [Documentation]    Accès via le menu de gauche à la page des articles de type "Fish"

    Click Image               xpath=//*[@id="SidebarContent"]/a[1]/img
    Element Text Should Be    xpath=//*[@id="Catalog"]/h2                 Fish
    Click Link                xpath=//tr[3]/td[1]/a
    Element Text Should Be    xpath=//*[@id="Catalog"]/h2                 Tiger Shark
    Click Link                xpath=//tr[2]/td[5]/a
    Element Text Should Be    xpath=//tr[2]/td[3]                         Toothless Tiger Shark
    Element Text Should Be    xpath=//tr[2]/td[6]                         $18.50
    Click Link                xpath=//*[@id="Cart"]/a

[Teardown]    Close Browser