*** Settings ***
Documentation   This is the script for Create Sales Visit Repository
Library     Selenium2Library
Library     OperatingSystem
Library     String
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

Home Page Verify Then Select Sales Menu
    Verify Home Page
    Select Sales Menu

Selecting Schedule Tab
    Select Sales Visit Schedule Tab      VISIT       ${SCHEDULE_STRING}

Entering Sales Visit Form
    View Sales Visit Form


Entering Sales Visit Informations
    Start And End Date Informations

Account Name
    Adding Account Information
    Verify Added Account Information

    Click Erase Button          ${ACCOUNT_CLEAR_BUTTON}

    Verify Erased Account Information
    Adding Account Information

Start Time And End Time
    Start Time and End Time Information

Department Sales Visit
    Department Information

Position Sales Visit
    Position Information

Contact Name
    Adding Contact Name Information
    Verify Added Contact Information

    Click Erase Button      ${CONTACT_CLEAR_BUTTON}

    Verify Erased Contact Information
    Adding Contact Name Information
    Verify Added Contact Information

Project Name
    Adding Project Information
    Verify Added Project Information

    Click Erase Button      ${PROJECT_CLEAR_BUTTON}

    Verify Erased Project Information
    Adding Project Information
    Verify Added Project Information

Lead Number
    Adding Lead Information
    Verify Added Lead Information

    Click Erase Button      ${LEAD_CLEAR_BUTTON}

    Verify Erased Lead Information
    Adding Lead Information
    Verify Added Lead Information

Plan Information
    Plan Information

Report Information
    Report Information

Other Information
    Other Information

Save Created Sales Visit Data
    No Alert Should Be Found
    Click Save Button













