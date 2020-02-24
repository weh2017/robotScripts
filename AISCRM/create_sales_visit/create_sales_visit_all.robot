*** Settings ***
Documentation   This is the script for Create Sales Visit All Informations
...             Prerequisites : Follow the steps below
...             1. Open user_login_resource
...             2. Input Username at variable ${USER}
...             3. Input password at variable ${PASS}
...             4. Input User's Full Name at variable ${USER_FULL_NAME}
Library     SeleniumLibrary
Library     OperatingSystem
Library     String
Library     DateTime
Library     Collections
Library     Dialogs
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
    Launch Web System   ${URL_2}

Log-In User with Valid Username And Password
    [Tags]  User credentials
    Input Username      ${USER}
    Input User's Password      ${PASS}
    Click Login button

Sales Visit
    [Tags]  Sales Visit
    Select Menu     ${HEADER_MENU_STRING}
##    Select Dropdown Option From Menu    ${SALES_VISIT_STRING}
#
All Informations
    Perform Create Sales Visit All Informations     ALL      ${CURDIR}${/}../resources/sales_visit2.csv


#Log Out
#    Click Logout button
#${CURDIR}${/}../resources/sales_visit.csv




