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

Verify If Home Page Is Displayed
    Verify Home Page

Selecting Sales Menu Header
    Select Sales Menu

Selecting Schedule Tab
    Select Sales Visit Schedule Tab      VISIT       ${SCHEDULE_STRING}

Entering Sales Visit Form
    View Sales Visit Form


Entering Sales Visit Informations
    Sales Visit Information
    Execute Adding Account
    Execute Deleting Account
    Verify Erase Account

#Entering Plan Informations
    #Plan Information

#Entering Report Informations
    #Report Information

#Entering Other Informations
    #Other Information

#Save Created Sales Visit Data
    #No Alert Should Be Found
    #Click Save Button













