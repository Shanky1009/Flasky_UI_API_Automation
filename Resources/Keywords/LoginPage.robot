*** Settings ***
Documentation  Robot file to Login with registered user
Resource    Common.robot
Resource    ../Locators/loginPage.txt

*** Variables ***


*** Keywords ***
Verify Login Page
    [Documentation]  Verifying login page by log in header
    ${log_In_header}=  run keyword and return status  wait until page contains element  ${login_header}
    run keyword if  ${log_In_header}  log  "Log In Page is Displayed"

Enter Username and Password
    [Documentation]  Enter username and password for randomly generate registered user
    click element  ${login_btn}
    input text  ${log_In_username_txtbx}  ${entered_us}
    input text  ${log_In_password_txtbx}  ${entered_pwd}
    click element  ${log_In_submit_btn}

Enter Hardcoded Username and Password
    [Documentation]  Enter hardcoded username and password for registered user
    click element  ${login_btn}
    input text  ${log_In_username_txtbx}  Demo1
    input text  ${log_In_password_txtbx}  Demo@1234
    click element  ${log_In_submit_btn}