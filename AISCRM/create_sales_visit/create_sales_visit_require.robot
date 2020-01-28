*** Settings ***
Documentation   This is the script for Create Sales Visit Require Fields Only
Library     SeleniumLibrary
Library     OperatingSystem
Library     String
Library     DateTime
Library     Collections
Resource        ../resources/create_sales_visit_resources/create_sales_visit_resource.robot
Resource        ../../common_resources/web_common.robot
Resource        create_sales_visit_form/create_sales_visit_variables.robot
Resource        ../../common_resources/misc_resources.robot
Resource        ../resources/user_login_resources/user_login_resource.robot
Suite Setup     Open Chrome Browser
Suite Teardown  Close Browser


*** Test Cases ***
AIS-CRM Website
    [Tags]      AIS-CRM SITE
    Launch Web System   ${URL}      # For the link. I saved it to user_login_resource.robot file

Log-In User with Valid Username And Password
    [Tags]  User credentials
    Input Username      ${USER}
    Input User's Password      ${PASS}
    Click Login button

Continue Running
    :FOR   ${index}     IN RANGE   999999
    \   Select Sales Menu
    \   Selecting Schedule Tab
    \   Select Sales Visit Schedule Tab          ${SCHEDULE_STRING}
    \   Entering Sales Visit Form
    \   Entering Sales Visit Informations
    \   Start Time And End Time
    \   Account Name
    \   Contact Name
    \   Project Name
    \   Plan Information Detail
    \   Save Created Sales Visit Data
    \   Verify Required Fields Information
    \   Add Image
    \   Log     ${index}
    \   Exit For Loop If        ${index}==0
    Click Logout button

*** Keywords ***
Selecting Schedule Tab
    Select Sales Visit Schedule Tab          ${SCHEDULE_STRING}

Entering Sales Visit Form
    View Sales Visit Form

Entering Sales Visit Informations
    Start And End Date Informations

Start Time And End Time
    Start Time and End Time Information

Account Name
    Adding Account Information
    Verify Added Account Information
    Sleep   1
    Click Erase Button          ${ACCOUNT_CLEAR_BUTTON}
    Sleep   1
    Verify Erased Account Information
    Adding Account Information

Contact Name
    Adding Contact Name Information
    Verify Added Contact Information
    Sleep   1
    Click Erase Button      ${CONTACT_CLEAR_BUTTON}
    Sleep   1
    Verify Erased Contact Information
    Adding Contact Name Information
    Verify Added Contact Information

Plan Information Detail
    Plan Information

Save Created Sales Visit Data
    No Alert Should Be Found
    Click Save Button

Project Name
    Adding Project Information
    Verify Added Project Information
    Sleep   1
    Click Erase Button      ${PROJECT_CLEAR_BUTTON}
    Sleep   1
    Verify Erased Project Information
    Adding Project Information
    Verify Added Project Information


Add Image
    Click Add Image Button

Delete Data
    Click Delete Button
