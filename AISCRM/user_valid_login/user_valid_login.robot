*** Settings ***
Documentation    Test Case for Email Valid Login
Library     SeleniumLibrary
Library     String
Resource        ../../common_resources/web_common.robot
Resource        ../../common_resources/misc_resources.robot
Resource        ../resources/user_login_resources/user_login_resource.robot
Suite Setup     Open Chrome Browser
Suite Teardown  Close Browser

*** Test Cases ***

Launch AIS-CRM site
    Launch Web System   ${URL_2}

Login Valid AIS-CRM Credentials
    Input Username       ${USER}
    Input User's Password       ${PASS}
    Click Login button
    Verify Home Page
    Click Logout button

Login Valid E-mail And Invalid Password AIS-CRM Credentials
    Input Username      ${USER}
    Input User's Password      !@#$#$%x
    Click Login button
    Sleep  2
    Verify Error Message    ${LOGIN_ERROR_MSG}

Login Invalid E-mail And Valid Password AIS-CRM Credentials
    Input Username      ais@aisyst.com
    Input User's Password     ${PASS}
    Click Login button
    Sleep  2
    Verify Error Message    ${LOGIN_ERROR_MSG}

Login With Username And Password TextFields Are Both Blank
    Input Username      ${EMPTY}
    Input User's Password     ${EMPTY}
    Click Login button
    Sleep  2
    Verify Error Message    ${LOGIN_ERROR_MSG}


Login With Invalid Username And Password Are Entered
    Input Username      invalid@aisyst.com
    Input User's Password      invalidpassword
    Click Login button
    Sleep  2
    Verify Error Message    ${LOGIN_ERROR_MSG}
