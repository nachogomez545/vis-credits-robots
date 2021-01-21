*** Settings ***
Documentation  Click off workflow tests
Resource    ../global_resources.robot
Resource    resources.robot
Library    SeleniumLibrary
Test Teardown     Close Browser

*** Test Cases ***
Card is correct for Motors MLA Desktop :: VPP
    [Documentation]  Card is correct for Motors MLA Desktop
    [Tags]  Smoke
    Set Selenium Speed    ${delay}
    Open Browser    ${vip}    ${browser}
    Delete All Cookies
    Add Cookie  _d2id   ${vpp d2id}
    Reload Page
    Credits click off card should be present and has the right content for vpp

Card is correct for Motors MLA Desktop :: Web VIP
    [Documentation]  Card is correct for Motors MLA Desktop
    [Tags]  Smoke
    Set Selenium Speed    ${delay}
    Open Browser    ${vip}     ${browser}
    Delete All Cookies
    Add Cookie  _d2id   ${web vip d2id}
    Reload Page
    Credits click off card should be present and has the right content for web vip
