*** Settings ***
Documentation    Se connecter en tant qu'utilisateur au store
Library          Selenium2Library

*** Variables ***
${fish_side_menu_image}    xpath=//*[@id="SidebarContent"]/a[1]/img    
${fish_header}             xpath=//*[@id="Catalog"]/h2
${tiger_shark_link}        xpath=//tr[3]/td[1]/a
${add_to_cart_button}      xpath=//tr[2]/td[5]/a 
${proceed_checkout}        xpath=//*[@id="Cart"]/a
${description_cell}        xpath=//tr[2]/td[3]
${list_price_cell}         xpath=//tr[2]/td[6]
${quantity_input}          name=EST-3
${update_cart_button}      name=updateCartQuantities
${quantity}                2

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

    Click Image                ${fish_side_menu_image}
    Element Text Should Be     ${fish_header}             Fish
    Click Link                 ${tiger_shark_link}
    Element Text Should Be     ${fish_header}             Tiger Shark
    Click Link                 ${add_to_cart_button} 
    Element Text Should Be     ${description_cell}        Toothless Tiger Shark
    Element Text Should Be     ${list_price_cell}         $18.50
    Input Text                 ${quantity_input}          ${quantity}
    Click Button               ${update_cart_button}
    Capture Page Screenshot
    Click Link                 ${proceed_checkout}

[Teardown]    Close Browser