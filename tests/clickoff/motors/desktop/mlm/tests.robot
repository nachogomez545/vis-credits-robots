*** Settings ***
Documentation  Click off workflow tests
Resource    global_resources.robot
Library    SeleniumLibrary
Test Teardown     Close Browser

*** Test Cases ***
Test card is present for MCO Motors on Web VIP
    [Documentation]  Testing card is present for MCO Motors
    [Tags]  Smoke
    Open Browser    ${click off mco}     ${browser}
    Set Selenium Speed    ${delay}
    Credits click off card should be present and has the right content