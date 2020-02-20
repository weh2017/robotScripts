*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource    ../../common_resources/misc_resources.robot
Resource        ../resources/user_login_resources/user_login_resource.robot
Resource        ../../common_resources/web_common.robot
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

Case Module Page

    Select Menu     ${MENU_NAME}
    Select Dropdown Option From Menu    ${MODULE_NAME}
    Click Button To Create Page     ${MODULE_NAME}
    Input Case Name
    Select Priority
    Select Responsible Person
*** Variables ***
${MENU_NAME}       Customer Service
${MODULE_NAME}     Case
${LABEL_HEADER}     //span[@class="lvtHeaderText"][contains(text(), "Creating New Case")]
${CASE_NAME_LOC}    id:ticket_title
${PRIOR_LOC}         //select[@name="ticket_important"]/option[@value=""]
${CASE_CSV}         ${CURDIR}${/}create_case_module.csv
${NAME}             Account Manager and PM
${NAME_USER}        Kanlaya Srinakorn
${USER_DROPDOWN}    //select[@name="assigned_user_id"]/option[contains(text(), "${NAME_USER}")]
${GROUP_RESPONSIBLE}    Kanlaya Srinakorn
${GROUP_DROPDOWN}       //select[@name="assigned_group_id"]/option[contains(text(), "${NAME_USER}")]

*** Keywords ***
Input Case Name
    [Documentation]     Input the desired case name
    #[Arguments]    ${case_name}
    Input Text      ${CASE_NAME_LOC}      Automated Case Name    #${case_name}

Select Priority
    [Documentation]   Select the desired Priority : Low, Medium, High, Urgent
    #[Arguments]     ${priority}
    #Click Element   //select[@name="ticket_important"]/option[@value="${priority}"]
    Click Element   //select[@name="ticket_important"]/option[@value="Urgent"]

Select Responsible Person
    [Documentation]  This is to set the person to assign Case
    [Arguments]     ${response}=${None}
    ${xpath_user}=   Get Element Count    ${USER_DROPDOWN}
    ${xpath_group}=     Get Element Count     ${GROUP_DROPDOWN}
    Run Keyword And Return If  ${xpath_user}   Click Element      ${USER_DROPDOWN}
    Run Keyword And Return If  ${xpath_group}   Run Keywords     Select Radio Button   assigntype    T
    ...   AND     Wait Until Element Is Visible   ${GROUP_DROPDOWN}
    ...   AND     Click Element       ${GROUP_DROPDOWN}
