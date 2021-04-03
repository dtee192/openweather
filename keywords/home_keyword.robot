*** Keywords ***
User Is On The Home Page
    ${expected_title}=    common_keywords.Get Current Page Title
    Should Be Equal As Strings    ${home_title}    ${expected_title}

Verify That Search Box Is Display Correctly
    home_page.Verify That Search Box Is Display Correctly

Input Value To Search Box
    [Arguments]    ${text}
    home_page.Input Text To Search Box    ${text}