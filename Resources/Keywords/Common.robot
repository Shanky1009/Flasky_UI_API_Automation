*** Settings ***
Documentation  Selenium library for web automation. This file is used for writing commonly used keywords across all tests.
Library  Selenium2Library

*** Variables ***


*** Keywords ***
Launch Browser
    [Documentation]  Keyword to launch Browser by creating web driver based on browser variables like Chrome/Firefox/Edge
    [Arguments]  ${BROWSER}
    Create Webdriver  ${BROWSER}  executable_path=Executables/MAC/${BROWSER}
    Go To   http://127.0.0.1:8080


