*** Settings ***
Documentation   This is the script for Create Sales Visit Optional fields only
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
    Launch Web System   ${URL}     # For the link. I saved it to user_login_resource.robot file

Log-In User with Valid Username And Password
    [Tags]  User credentials
    Input Username      ${USER}
    Input User's Password      ${PASS}
    Click Login button

Home Page Verify Then Select Sales Menu
    Verify Home Page
#    Select Sales Menu

Repeat Testing
    :FOR   ${index}     IN RANGE   999999
    \   Select Sales Menu
    \   Selecting Schedule Tab
    \   Entering Sales Visit Form
    \   Phone And Mobile
    \   Lead Number
    \   Department Sales Visit
    \   Position Sales Visit
    \   E-mail Address Sales Visit
#    \   E-mail Domain Remove Information
    \   Comment Information Detail
    \   Report Information Detail
    \   Other Information Detail
    \   Save Created Sales Visit Data
#    \   Save Created Sales Visit Data
    \   Log     ${index}
    \   Exit For Loop If        ${index}==0
    Click Logout button

*** Keywords ***

Selecting Schedule Tab
    Select Sales Visit Schedule Tab          ${SCHEDULE_STRING}

Entering Sales Visit Form
    View Sales Visit Form

#*** Keywords ***
Phone And Mobile
    Phone And Mobile Contacts Information

Lead Number
    Adding Lead Information
    Verify Added Lead Information
    Sleep   1
    Click Erase Button      ${LEAD_CLEAR_BUTTON}
    Sleep   1
    Verify Erased Lead Information
    Adding Lead Information
    Verify Added Lead Information

Department Sales Visit
    Department Information

Position Sales Visit
    Position Information

E-mail Domain Remove Information
    Email Domain Remove

E-mail Address Sales Visit
    Email Address Information

Comment Information Detail
    Comment Information

Report Information Detail
    Report Information

Other Information Detail
    Other Information

Save Created Sales Visit Data
    Click Save Button
    Alert Should Be Found
