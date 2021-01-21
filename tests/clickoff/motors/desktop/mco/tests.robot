*** Settings ***
Documentation  Click off workflow tests
Resource    ../global_resources.robot
Resource    resources.robot
Library    SeleniumLibrary
Test Teardown     Close Browser

*** Test Cases ***
Card is correct for Motors MCO Desktop
    [Documentation]  Card is correct for Motors MCO Desktop
    [Tags]  Smoke
    Open Browser    ${vip}     ${browser}
    Set Selenium Speed    ${delay}
    Credits click off card should be present and has the right content