*** Settings ***
Documentation  This Test will register new users
Library  Selenium2Library
Resource  ../Resources/Keywords/Common.robot
Resource  ../Resources/Keywords/UserRegistrationPage.robot
Resource  ../Resources/Keywords/LoginPage.robot
Force Tags          All-Tests

Test Teardown  Close all browsers

*** Variables ***


*** Test Cases ***
Test001 - User Registration
   [Documentation]  This test will register new user with random generated data
   [Tags]   userReg
   ${BROWSER}  get variable value  ${BROWSER}

   Log  "Step 1: Launch Browser"
   Launch Browser  ${BROWSER}

   Log  "Step 2: Verify Application Dashboard"
   Verify Dashboard

   Log  "Step 3: Register new user by entering all information"
   User Registration

   Log  "Step 4: Verify Login Page"
   Verify Login Page