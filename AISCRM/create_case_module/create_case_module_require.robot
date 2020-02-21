*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String
Library     RequestsLibrary
Library     Collections
Library     String
Library     OperatingSystem
Library     CSVLibrary.py
Library     ExcelLibrary
Resource    ../../common_resources/misc_resources.robot
Resource        ../resources/user_login_resources/user_login_resource.robot
Resource        ../../common_resources/web_common.robot
Suite Setup     Open Chrome Browser
#Suite Teardown  Close Browser

*** Test Cases ***
Getting Requests
    Create Session      AIST           ${URL}
    ${resp}=    Get Request     AIST        /
    Should Be Equal As Strings      ${resp.status_code}     200
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
#    Case Information Data
#    Input Case Name
#    Select Priority
#    Select Responsible Person
#    Case Open Date
#    Case Type
#    Case Status
#    Partner Account
    Get Priority Case
    Get Responsible Person
    Get Case Type
    Get Ticket Status
    Get Project Name
*** Variables ***
${MENU_NAME}       Customer Service
${MODULE_NAME}     Case
${LABEL_HEADER}     //span[@class="lvtHeaderText"][contains(text(), "Creating New Case")]
${CASE_NAME_LOC}    id:ticket_title
${PRIOR_LOC}         //select[@name="ticket_important"]/option[@value=""]
${CASE_CSV}         ${CURDIR}${/}create_case_module.csv
${NAME}             Account Manager and PM
${NAME_USER}        Kanlaya Srinakorn
${USER_DROPDOWN}    //select[@name="assigned_user_id"]/option[contains(text(), "${NAME}")]
${COLLECT_USER}     name:assigned_user_id
${COLLECT_GROUP}    name:assigned_group_id
${GROUP_RESPONSIBLE}    Kanlaya Srinakorn
${GROUP_DROPDOWN}       //select[@name="assigned_group_id"]/option[contains(text(), "${NAME}")]
${OPEN_DATE_STRING}     28/02/2020
${CASE_TYPE_TICKET}     name:ticket_type
${STATUS_TICKET}        name:ticketstatus
${PARTNER_TICKET}       name:ticket_del_name


*** Keywords ***
Case Information Data
    [Documentation]     This to get CSV file, read data and send data to the system
    #[Arguments]     ${data}
    ${contents}=    Get File      ${CASE_CSV}
    @{read}=    Create List     ${contents}
    @{lines}=   Split To Lines      @{read}     1
    :FOR    ${line}    IN      @{lines}
    \   @{bm}=    Split String  ${line}     |
    # case_name
    \   ${case_name}=   Set Variable    @{bm}[0]
    # Priority
    \   ${priority}=    Set Variable    @{bm}[1]
    # Responsible
    \   ${responsible}=     Set Variable    @{bm}[2]
    \   Input Case Name     ${case_name}
#    \   Select Priority     ${priority}
    \   Select Responsible Person   ${responsible}
#    \   Case Open Date
#    \   Case Type
#    \   Case Status
#    \   Partner Account

Input Case Name
    [Documentation]     Input the desired case name
    [Arguments]    ${case_name}
    Input Text      ${CASE_NAME_LOC}      ${case_name}

Select Priority
    [Documentation]   Select the desired Priority : Low, Medium, High, Urgent
    [Arguments]     ${priority}
    Run Keyword If      "${priority}"!=
    #Click Element   //select[@name="ticket_important"]/option[@value="${priority}"]
    ...     Click Element   //select[@name="ticket_important"]/option[@value="${priority}"]

Select Responsible Person
    [Documentation]  This is to set the person to assign Case
    [Arguments]     ${responsible}

    ${xpath_user}=   Get Element Count    //select[@name="assigned_user_id"]/option[contains(text(), "${responsible}")]
    ${xpath_group}=     Get Element Count     //select[@name="assigned_group_id"]/option[contains(text(), "${responsible}")]

    Run Keyword And Return If  ${xpath_user}   Click Element      //select[@name="assigned_user_id"]/option[contains(text(), "${responsible}")]
    Run Keyword And Return If  ${xpath_group}   Run Keywords     Select Radio Button   assigntype    T
    ...   AND     Wait Until Element Is Visible   //select[@name="assigned_group_id"]/option[contains(text(), "${responsible}")]
    ...   AND     Click Element       //select[@name="assigned_group_id"]/option[contains(text(), "${responsible}")]


Case Open Date
    Input Date Calendar Text    case_open_date      ${OPEN_DATE_STRING}

Case Type
    @{create_case_type}=     Create List      ${CASE_TYPE_TICKET}

    :FOR   ${text}  IN    @{create_case_type}
    \       ${get}=     Get Text     ${text}
    \       Log     ${get}

Case Status
    @{create_case_status}=  Create List     ${STATUS_TICKET}

    :FOR    ${case_status}   IN       @{create_case_status}
    \       ${get_status}=      Get Text        ${case_status}
    \       Log   ${get_status}


Partner Account
    @{create_partner}=  Create List     ${PARTNER_TICKET}
    :FOR   ${case_partner}  IN     @{create_partner}
    \   ${get_partner}=     Get Text       ${case_partner}
    \   Log     ${get_partner}

###########################################################################
Get Priority Case
    @{web}=     Get Web Elements   //select[@name="ticket_important"]

    :FOR  ${item}   IN    @{web}

    \   Log  ${item.text}

Get Responsible Person
     @{responsible}=     Get Web Elements   //select[@name="assigned_user_id"]
     :FOR  ${item}  IN    @{responsible}
     \  Log   ${item.text}

     Select Radio Button  assigntype    T
     @{group}=      Get Web Elements    //select[@name="assigned_group_id"]
     :FOR  ${item}  IN    @{group}
     \  Log    ${item.text}
Get Case Type
    @{case}=    Get Web Elements   //select[@name="ticket_type"]
    :FOR   ${item}   IN   @{case}
    \   Log    ${item.text}

Get Ticket Status
    @{status}=  Get Web Elements   //select[@name="ticketstatus"]
    :FOR   ${item}  IN   @{status}
    \   Log    ${item.text}

Get Project Name
    Mouse Down        //*[@id="basicTab"]/table/tbody/tr/td/table/tbody/tr[2]/td/table/tbody/tr[27]/td/div/input[1]
    Click Element     //td[4]//table[1]//tbody[1]//tr[1]//td[3]//img[1]
    Switch Window   NEW
    ${project}=     Get Web Elements    //a[@href="javascript:window.close();"]
    :FOR   ${item}  IN    @{project}
    \   Log      ${item.text}
