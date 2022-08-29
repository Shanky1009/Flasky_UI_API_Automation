*** Settings ***
Documentation  This file is used to register new user with all information
Library     String

Resource    Common.robot
Resource    ../Locators/userRegistrationPage.txt
Resource    ../User_Data/userData.txt

*** Variables ***


*** Keywords ***
Verify Dashboard
    [Documentation]  This method will verify the Dashboard page is displayed by verifying header label
    ${demo_app_lbl}=  run keyword and return status  wait until page contains element  ${demo_app_title}
    run keyword if  ${demo_app_lbl}  log  "Title Verified"

User Registration
    [Documentation]  This method will register new user by clicking on Register button
    wait until page contains element  ${register_Btn}
    click element  ${register_Btn}
    verify user registration page
    create user information

Verify User Registration Page
    [Documentation]  This method will check Registration page is displayed by verifying submit button is present or not
    ${reg_sub_btn}=  run keyword and return status  wait until page contains element  ${register_submit_btn}
    run keyword if  ${reg_sub_btn}  log  "Register page is displayed"

Create User Information
    [Documentation]  This method will create new users information everytime by randomly generated string

    ${id}  Generate Random String  5  [NUMBERS]

    ${entered_us} =    Set Variable   ${entered_username}${id}
    Log To Console    ${entered_us}
    input text  ${username_txtbx}  ${entered_us}
    set global variable  ${entered_us}

    ${entered_pwd} =    Set Variable   ${entered_password}${id}
    Log To Console    ${entered_pwd}
    input text  ${password_txtbx}  ${entered_pwd}
    set global variable  ${entered_pwd}

    ${entered_fn} =    Set Variable   ${entered_firstname}${id}
    Log To Console    ${entered_fn}
    input text  ${firstname_txtbx}  ${entered_fn}
    set global variable  ${entered_fn}

    ${entered_fln} =    Set Variable   ${entered_familyname}${id}
    Log To Console    ${entered_fln}
    input text  ${familyname_txtbx}  ${entered_fln}
    set global variable  ${entered_fln}

    ${entered_phn} =    Set Variable   ${entered_phonenumber}${id}
    Log To Console    ${entered_phn}
    input text  ${phonenumber_txtbx}  ${entered_phn}
    set global variable  ${entered_phn}

    click element  ${register_submit_btn}
