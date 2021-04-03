*** Settings ***
Resource     ${CURDIR}/../../resources/import/library_import.robot
Resource     ${CURDIR}/../../keywords/common_keywords.robot
Variables    ${CURDIR}/../../env_config.yaml

#test data
Variables    ${CURDIR}/../../resources/testdatas/data.yaml

#page keyword
Resource    ${CURDIR}/../../keywords/home_keyword.robot
Resource    ${CURDIR}/../../keywords/search_keyword.robot

Resource     ${CURDIR}/../../pages/home_page.robot
Resource     ${CURDIR}/../../pages/search_page.robot

#page locator
Resource     ${CURDIR}/../../locators/home_locator.robot
Resource     ${CURDIR}/../../locators/search_locator.robot