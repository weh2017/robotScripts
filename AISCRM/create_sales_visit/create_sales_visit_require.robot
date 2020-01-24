*** Settings ***
Documentation   This is the script for Create Sales Visit Repository
Library     AutoItLibrary
Library     SeleniumLibrary
Library     OperatingSystem
Library     String
Library     DateTime
Library     Collections
Library     WhiteLibrary

Resource        ../resources/create_sales_visit_resources/create_sales_visit_resource.robot
Resource        ../../common_resources/web_common.robot
Resource        create_sales_visit_form/create_sales_visit_variables.robot
Resource        ../../common_resources/misc_resources.robot
Resource        ../resources/user_login_resources/user_login_resource.robot
Suite Setup     Open Chrome Browser
#Suite Teardown  Close Browser




*** Test Cases ***
AIS-CRM Website
    [Tags]      AIS-CRM SITE
    Launch Web System   ${URL}

Log-In User with Valid Username And Password
    [Tags]  User credentials
    Input Username      ${USER}
    Input User's Password      ${PASS}
    Click Login button

Running
    Continue Running

*** Keywords ***

Continue Running
    :FOR   ${index}     IN RANGE   999999
    \   Exit For Loop If        ${index}==1
    \   Select Sales Menu
    \   Selecting Schedule Tab
    \   Select Sales Visit Schedule Tab          ${SCHEDULE_STRING}
    \   Entering Sales Visit Form
    \   Entering Sales Visit Informations
    \   Start Time And End Time
    \   Account Name
    \   Contact Name
    \   Department Sales Visit
    \   Position Sales Visit
    \   E-mail Address Sales Visit
    \   Project Name
    \   Lead Number
    \   Plan Information Detail
    \   Comment Information Detail
    \   Report Information Detail
    \   Other Information Detail
    \   Save Created Sales Visit Data
    \   All Required Informations
    #\   Delete Data
    \   Click Add Image Button

    \   Log     ${index}

Home Page Verify Then Select Sales Menu
    Verify Home Page
    Select Sales Menu

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

Department Sales Visit
    Department Information

Position Sales Visit
    Position Information

E-mail Address Sales Visit
    Email Address Information

Project Name
    Adding Project Information
    Verify Added Project Information
    Sleep   1
    Click Erase Button      ${PROJECT_CLEAR_BUTTON}
    Sleep   1
    Verify Erased Project Information
    Adding Project Information
    Verify Added Project Information

Lead Number
    Adding Lead Information
    Verify Added Lead Information
    Sleep   1
    Click Erase Button      ${LEAD_CLEAR_BUTTON}
    Sleep   1
    Verify Erased Lead Information
    Adding Lead Information
    Verify Added Lead Information

Plan Information Detail
    Plan Information

Comment Information Detail
    Comment Information
Report Information Detail
    Report Information

Other Information Detail
    Other Information

Save Created Sales Visit Data
    No Alert Should Be Found
    Click Save Button

All Required Informations
    Verify All Fields Informations

Add Image
    Click Add Image Button

Delete Data
    Click Delete Button










