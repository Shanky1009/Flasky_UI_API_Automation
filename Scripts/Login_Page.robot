*** Settings ***
Documentation  This Test will login into application by entering username and password
Library  Selenium2Library
Resource  ../Resources/Keywords/Common.robot
Resource  ../Resources/Keywords/LoginPage.robot
Resource  ../Resources/Keywords/UserRegistrationPage.robot
Force Tags          All-Tests

Test Teardown  Close all browsers

*** Variables ***


*** Test Cases ***
Log In Page
   [Documentation]  This method will login into application with hardcoded values
   [Tags]   login
   ${BROWSER}  get variable value  ${BROWSER}

   Log  "Step 1: Launch Browser"
   Launch Browser  ${BROWSER}

   Log  "Step 2: Verify Application Dashboard"
   Verify Dashboard

   Log  "Step 3: Verify Login Page"
   Verify Login Page

   Log  "Step 4: Enter Username and Password with hardcoded values"
   Enter Hardcoded Username and Password