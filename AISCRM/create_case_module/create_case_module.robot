*** Settings ***
Library     Selenium2Library
Library     OperatingSystem
Library     String
Library     DateTime
Library     Collections
Library     Dialogs
Resource        ../../common_resources/web_common.robot
Resource        ../../common_resources/misc_resources.robot
Resource        ../resources/user_login_resources/user_login_resource.robot


Suite Setup     Open Chrome Browser
#Suite Teardown  Close Browser

*** Variables ***
${CUSTOMER_SERVICE}     Customer Service
${CASE_STRING}          Case
#${CREATE_BTN}           Case...
${CASE_TXTBOX}          name:ticket_title
${PRIORITY_LOC}         name:ticket_important
${CASE_TYPE_LOC}        name:ticket_type
${STATUS_LOC}           name:ticketstatus
${PROJECT_LOC}          name:project_no
${PROJECT_ADD_BTN}      //td[4]//table[1]//tbody[1]//tr[1]//td[3]//img[1]
${NAME_SEARCH_FIELD}    project_name

*** Test Cases ***
AIS-CRM Website
    [Tags]      AIS-CRM SITE
    Launch Web System   ${URL_2}

Log-In User with Valid Username And Password
    [Tags]  User credentials
    Input Username             ${USER}
    Input User's Password      ${PASS}
    Click Login button

Select Customer Service
    Select Menu                             ${CUSTOMER_SERVICE}
    Select Dropdown Option From Menu        ${CASE_STRING}
    Click Button To Create Page             ${CASE_STRING}

Create Case Data Informations
    Case Data Informations      ${CURDIR}${/}create_case_module.csv



*** Keywords ***
Case Data Informations
    [Arguments]         ${csv}
    ${contents}=    Get File    ${csv}
    @{read}=    Create List     ${contents}
    @{lines}=   Split To Lines      @{read}     1
    :FOR    ${line}    IN          @{lines} + 1
    \   @{bm}=      Split String    ${line}     |
    # Case Name
    \   ${case_name}=   Set Variable    @{bm}[0]
    \   ${remove_case}=  Remove String   ${case_name}    ['
    # Priority
    \   ${priority}=    Set Variable    @{bm}[1]
    # Responsble Person
    \   ${responsible}=  Set Variable    @{bm}[2]
    # Case Type
    \   ${case_type}=   Set Variable    @{bm}[3]
    # Status
    \   ${status}=      Set Variable    @{bm}[4]
    # Project Name
    \   ${project}=     Set Variable    @{bm}[5]
    \   Case Name               ${remove_case}
    \   Priority Case           ${priority}
    \   Responsible Person      ${responsible}
    \   Case Type               ${case_type}
    \   Status                  ${status}
    \   Project Name            ${project}

Case Name
    [Arguments]     ${remove_case}
    Input Data To TextBox   ${CASE_TXTBOX}      ${remove_case}

Priority Case
    [Arguments]   ${priority}
    ${prior}=   Get Web Elements    ${PRIORITY_LOC}
    :FOR  ${item}   IN  @{prior}
    \   Log     ${item.text}
    Click Element   //select[@name="ticket_important"]/option[@value="${priority}"]


Responsible Person
    [Documentation]  This is to set the person to assign Case
    [Arguments]     ${responsible}

    ${xpath_user}=   Get Element Count    //select[@name="assigned_user_id"]/option[contains(text(), "${responsible}")]
    ${xpath_group}=     Get Element Count     //select[@name="assigned_group_id"]/option[contains(text(), "${responsible}")]

    Run Keyword And Return If  ${xpath_user}   Click Element      //select[@name="assigned_user_id"]/option[contains(text(), "${responsible}")]
    Run Keyword And Return If  ${xpath_group}   Run Keywords     Select Radio Button   assigntype    T
    ...   AND     Wait Until Element Is Visible   //select[@name="assigned_group_id"]/option[contains(text(), "${responsible}")]
    ...   AND     Click Element       //select[@name="assigned_group_id"]/option[contains(text(), "${responsible}")]

Case Type
    [Arguments]     ${case_type}
    ${ticket}=      Get Web Elements        ${CASE_TYPE_LOC}
    :FOR    ${item}     IN   @{ticket}
    \   Log     ${item.text}
    Click Element   //select[@name="ticket_type"]/option[@value="${case_type}"]

Status
    [Arguments]   ${status}
    ${status_case}=     Get Web Elements    ${STATUS_LOC}
    :FOR    ${item}     IN    @{status_case}
    \   Log    ${item.text}
    Click Element   //select[@name="ticketstatus"]/option[@value="${status}"]

Project Name
    [Arguments]     ${project}
    ${project_case}=    Get Web Elements    //a[@href="javascript:window.close();"]
    :FOR  ${item}   IN      @{project_case}
    \   Log     ${item.text}
    Scroll Down Page From The Browser
    Select Data On Basic Search Mode    ${PROJECT_ADD_BTN}      ${NAME_SEARCH_FIELD}    ${project}
