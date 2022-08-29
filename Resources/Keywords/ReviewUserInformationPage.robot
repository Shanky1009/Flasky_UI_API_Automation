*** Settings ***
Documentation  This robot file is to verify registered users information is correct or not
Resource    Common.robot
Resource    ../Locators/reviewUserInfoPage.txt

*** Variables ***


*** Keywords ***
Verify User Information
    [Documentation]  This method will verify the registered user information

    ${user_info_lbl}=  run keyword and return status  wait until page contains element  ${usr_info_title}
    run keyword if  ${user_info_lbl}  log  "User Information page is displayed"

    ${actual_username}  get text  ${value_username}
    run keyword if  '${actual_username}' == '${entered_us}'  run keyword  log  "Username is Correct!"

    ${actual_firstname}  get text  ${value_firstname}
    run keyword if  '${actual_firstname}' == '${entered_fn}'  run keyword  log  "First Name is Correct!"

    ${actual_lastname}  get text  ${value_lastname}
    run keyword if  '${actual_lastname}' == '${entered_fln}'  run keyword  log  "Last Name is Correct!"

    ${actual_phonenumber}  get text  ${value_phone}
    run keyword if  '${actual_phonenumber}' == '${entered_phn}'  run keyword  log  "Phone Number is Correct!"