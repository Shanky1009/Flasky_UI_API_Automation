*** Settings ***
Documentation  This Test will verify registered user's information
Library  Selenium2Library
Resource  ../Resources/Keywords/Common.robot
Resource  ../Resources/Keywords/LoginPage.robot
Resource  ../Resources/Keywords/ReviewUserInformationPage.robot
Force Tags          All-Tests

Test Teardown  Close all browsers

*** Variables ***


*** Test Cases ***
Test002 - Review User Information Page
   [Documentation]  This Test will review user's information
   [Tags]   userReg
   ${BROWSER}  get variable value  ${BROWSER}

   Log  "Step 1: Launch Browser"
   Launch Browser  ${BROWSER}

   Log  "Step 2: Verify Login Page"
   Verify Login Page

   Log  "Step 3: Enter Username and Password"
   Enter Username and Password

   Log  "Step 4: Verify User Information"
   Verify User Information