*** Settings ***
Resource    ${CURDIR}/../resources/import/web_import.robot
Test Setup    Initial Browser
Test Teardown    Close Browser

*** Test Cases ***
Search Weather In Your City
    [Tags]    search    city
    home_keyword.User Is On The Home Page
    home_keyword.Verify That Search Box Is Display Correctly
    home_keyword.Input Value To Search Box    ${search_keyword.hcmc}
    search_keyword.User Is On The Search Page
    search_keyword.Verify That The Search Result Is Display Correctly
