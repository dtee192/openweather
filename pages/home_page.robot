*** Keywords ***
Verify That Search Box Is Display Correctly
    common_keywords.Verify Elements Are Visible    ${dicHomePage}[frm_search]    ${dicHomePage}[txt_seach_box]

Input Text To Search Box
    [Arguments]    ${text}
    common_keywords.Input Text And Verify Input For Web Element    ${dicHomePage}[txt_seach_box]    ${text}
    common_keywords.Press Key On Keyboard    ${dicHomePage}[txt_seach_box]    ENTER

