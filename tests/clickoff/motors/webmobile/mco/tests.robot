*** Settings ***
Library    PuppeteerLibrary
Resource    resources.robot
Resource    ../global_resources.robot
Test Teardown    Close Puppeteer

*** Test Cases ***
Card is correct for Motors MCO Webmobile
    [Documentation]  Card is correct for Motors MCO Webmobile
    [Tags]  Smoke
    ${BROWSER} =     Get variable value    ${BROWSER}     ${DEFAULT_BROWSER}
    ${HEADLESS} =    Get variable value    ${HEADLESS}    ${False}
    &{options} =    create dictionary   headless=${HEADLESS}    emulate=iPhone 11
    Open browser    ${vip}   browser=${BROWSER}    options=${options}    alias=TestBrowser
    Credits click off card should be present and has the right content
