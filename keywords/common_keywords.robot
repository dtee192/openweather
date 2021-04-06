*** Keywords ***
Initial Browser
    Open chrome browser to page    ${base_url}

Open chrome browser to page
    [Arguments]    ${url}    ${speed}=0.3 
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    disable-gpu
    SeleniumLibrary.Create Webdriver    Chrome    chrome_options=${chrome_options}
    SeleniumLibrary.Go To    ${url}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed    ${speed}

Click To Element
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${GLOBALTIMEOUT}
    SeleniumLibrary.Click Element    ${locator}

Verify Elements Are Visible
    [Arguments]    @{elems}
    SeleniumLibrary.Wait Until Page Contains Element    ${elems}[0]    timeout=${GLOBALTIMEOUT}
    FOR    ${elem}    IN    @{elems}
        SeleniumLibrary.Wait Until Element Is Visible    ${elem}    timeout=${GLOBALTIMEOUT}
    END

Verify Element Is Visible
    SeleniumLibrary.Wait Until Element Is Visible    ${elem}    timeout=${GLOBALTIMEOUT}

Enter Text To Element
    [Arguments]    ${locator}    ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${GLOBALTIMEOUT}
    SeleniumLibrary.Input Text    ${locator}    ${text}

Get Value From Element
    [Arguments]    ${locator}    ${value}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${GLOBALTIMEOUT}
    ${text}=    SeleniumLibrary.Get Element Attribute   ${locator}    ${value}
    [Return]    ${text}

Verify Element Text Should Be
    [Arguments]    ${locator}    ${expected}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${GLOBALTIMEOUT}
    SeleniumLibrary.Element Text Should Be    ${locator}    ${expected}

Close Browser
    SeleniumLibrary.Close Browser

Go To Specific Page
    [Arguments]    ${page}=${EMPTY}
    SeleniumLibrary.Go To    ${base_url}${page}
    
Get Current Page Title
    ${title}=    SeleniumLibrary.Get Title
    [return]    ${title}

Input Text And Verify Input For Web Element
    [Documentation]    ${locator} - could be any selenium locator and webelement object
    ...    ${text} - text to be verified
    [Arguments]     ${locator}      ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${GLOBALTIMEOUT}
    SeleniumLibrary.Input Text     ${locator}    ${text}
    ${entered_text}=    SeleniumLibrary.Get Value    ${locator}
    Should Be Equal    '${entered_text}'    '${text}'

Press Key On Keyboard
    [Arguments]    ${locator}    ${key}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${GLOBALTIMEOUT}
    SeleniumLibrary.Press Keys    ${locator}    ${key}

Wait Until Page Complete Loaded
    [Arguments]    ${timeout}=${15}
    FOR    ${i}    IN RANGE    ${timeout}
        ${status}=    SeleniumLibrary.Execute Javascript    return window.document.readyState
        Run Keyword If    '${status}'=='complete'    Exit For Loop
    END
    Should Be Equal As Strings    ${status}    complete