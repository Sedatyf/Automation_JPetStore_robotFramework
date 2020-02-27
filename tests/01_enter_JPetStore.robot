*** Settings ***
Documentation    Se connecter à la page JPetStore
Library          Selenium2Library

*** Test Cases ***
Enter JPetStore
    [Documentation]    Enter in the store

    Open Browser                     https://petstore.octoperf.com/       chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="Content"]/p[1]/a
    Click Link                       xpath=//*[@id="Content"]/p[1]/a
    Wait Until Element Is Enabled    xpath=//*[@id="MenuContent"]/a[2]

    # Close the browser
    [Teardown]    Close Browser