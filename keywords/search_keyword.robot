*** Keywords ***
User Is On The Search Page
    ${expected_title}=    common_keywords.Get Current Page Title
    BuiltIn.Should Be Equal As Strings    ${search_title}    ${expected_title}

Verify That The Search Result Is Display Correctly
    search_page.Verify That The Search Result Is Display Correctly