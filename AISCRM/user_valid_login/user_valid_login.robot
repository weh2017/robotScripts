*** Settings ***
Documentation    Test Case for Email Valid Login
Library     SeleniumLibrary
Resource        ../../common_resources/web_common.robot
Resource        ../../common_resources/misc_resources.robot
Resource        ../resources/user_login_resources/user_login_resource.robot
Suite Setup     Open Chrome Browser
Suite Teardown  Close Browser

*** Test Cases ***

Launch AIS-CRM site
    Launch Web System   ${URL}

Login Valid AIS-CRM Credentials
    [Tags]      Second TC : Login Valid AIS-CRM Credentials
    Input Username       ${USER}

Password valid AIS-CRM credentials
    [Tags]      Third TC : Password valid AIS-CRM credentials
    Input Password       ${PASS}

Click Sign In
    [Tags]      Fourth TC : Click Sign In
    Click Login button

Verify AIS-CRM Home Page
    [Tags]  Fifth TC:Verify AIS-CRM Home Page
    Verify Home Page

Click Logout
    [Tags]  Sixth TC : Click Logout
    Click Logout button


