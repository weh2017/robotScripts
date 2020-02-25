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
${CASE_TXTBOX}          name:ticket_title
${PRIORITY_LOC}         ticket_important
${CASE_TYPE_LOC}        ticket_type
${STATUS_LOC}           ticketstatus
${PROJECT_LOC}          project_no
${PROJECT_ADD_BTN}      //td[4]//table[1]//tbody[1]//tr[1]//td[3]//img[1]
${PROJECT_DEL_BTN}      //td[4]//table[1]//tbody[1]//tr[1]//td[4]//input[1]
${NAME_SEARCH_FIELD}    project_name
${CASE_OPEN_LOC}        name:case_open_date
${CASE_CLOSE_LOC}       name:cf_4616
${CASE_PLAN_LOC}        name:case_date
${WAITING_FOR_LOC}      cf_4583
${PART_ACCOUNT_LOC}     ticket_del_name
${PARTNER_CONTACT_LOC}   id:cf_4614
${CLOSED_REASON_LOC}    cf_4681
${DESCRIPTION_LOC}      name:case_cause
${SOLUTION_LOC}         name:case_perfomance
${PREVENTION_LOC}       name:case_protection
${CONTACT_ADDNAME_BTN}  //td[@class='showPanelBg']//td[2]//table[1]//tbody[1]//tr[1]//td[2]//img[1]
${CONTACTNAME_DEL_BTN}  //td[@class='showPanelBg']//td[2]//table[1]//tbody[1]//tr[1]//td[3]//input[1]
${DROPDOWN_SEARCH_LOC}  search_field
${CONTACT_NAME_SEARCH}  firstname
${CONTACT_NAME_LABEL}   contact_name
*** Test Cases ***
AIS-CRM Website
    [Tags]      AIS-CRM SITE
    Launch Web System   ${URL}

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
    # Case Open Date
    \   ${case_open_date}=  Set Variable    @{bm}[6]
    # Case Close Date
    \   ${case_close_date}=  Set Variable   @{bm}[7]
    # Plan Due Date
    \   ${plan_due_date}=    Set Variable   @{bm}[8]
    # Waiting For
    \   ${waiting}=     Set Variable        @{bm}[9]
    # Partner Account
    \   ${partner_account}=     Set Variable    @{bm}[10]
    # Partner Contact
    \   ${partner_contact}=     Set Variable    @{bm}[11]
    # Closed Reason
    \   ${closed_reason}=       Set Variable    @{bm}[12]
    # Description
    \   ${description}=         Set Variable    @{bm}[13]
    # Solution
    \   ${solution}=            Set Variable    @{bm}[14]
    # Prevention
    \   ${prevention}=          Set Variable    @{bm}[15]
    # Contact Name
    \   ${contact_name}=        Set Variable    @{bm}[16]
    # Contact Mobile
    \   ${contact_mobile}=      Set Variable    @{bm}[17]

    \   Case Name                       ${remove_case}
    \   Priority Case                   ${priority}
    \   Responsible Person              ${responsible}
    \   Case Type                       ${case_type}
    \   Status                          ${status}
    \   Project Name                    ${project}
    \   Case Open Date                  ${case_open_date}
    \   Case Close Date                 ${case_close_date}
    \   Plan Due Date                   ${plan_due_date}
    \   Waiting For                     ${waiting}
    \   Partner Account                 ${partner_account}
    \   Partner Contact                 ${partner_contact}
    \   Description                     ${description}
    \   Solution                        ${solution}
    \   Prevention                      ${prevention}
    \   Contact Name                    ${contact_name}
#    \   Enter Case Information          ${remove_case}  ${priority}    ${responsible}    ${case_type}
#    ...     ${status}   ${project}  ${case_open_date}   ${case_close_date}
#    ...     ${plan_due_date}    ${waiting}  ${partner_account}  ${partner_contact}
#    ...     ${description}  ${solution}     ${prevention}


Enter Case Information
    [Arguments]     ${remove_case}  ${priority}    ${responsible}    ${case_type}
    ...     ${status}   ${project}  ${case_open_date}   ${case_close_date}
    ...     ${plan_due_date}    ${waiting}  ${partner_account}  ${partner_contact}  #${closed_reason}
    ...     ${description}      ${solution}     ${prevention}   ${contact_name}
    Case Name           ${remove_case}
    Priority Case       ${priority}
    Responsible Person  ${responsible}
    Case Type           ${case_type}
    Status              ${status}
    Case Open Date      ${case_open_date}
    Case Close Date     ${case_close_date}
    Plan Due Date       ${plan_due_date}
    Waiting For         ${waiting}
    Partner Account     ${partner_account}
    Partner Contact     ${partner_contact}
    Description         ${description}
    Solution            ${solution}
    Prevention          ${prevention}
    Project Name        ${project}
    Contact Name        ${contact_name}
Case Name
    [Arguments]     ${remove_case}
    Input Data To TextBox   ${CASE_TXTBOX}      ${remove_case}
Priority Case
    [Arguments]   ${priority}
    ${prior}=   Get Web Elements    //select[@name="ticket_important"]
    :FOR  ${item}   IN  @{prior}
    \   Log     ${item.text}
#    Click Element   //select[@name="ticket_important"]/option[@value="${priority}"]
    Select Option From Dropdown List    ${PRIORITY_LOC}     ${priority}
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
    ${ticket}=      Get Web Elements        //select[@name="ticket_type"]
    :FOR    ${item}     IN   @{ticket}
    \   Log     ${item.text}
#    Click Element   //select[@name="ticket_type"]/option[@value="${case_type}"]
    Select Option From Dropdown List    ${CASE_TYPE_LOC}        ${case_type}
Status
    [Arguments]   ${status}
    ${status_case}=     Get Web Elements    //select[@name="ticketstatus"]
    :FOR    ${item}     IN    @{status_case}
    \   Log    ${item.text}
#    Click Element   //select[@name="ticketstatus"]/option[@value="${status}"]
    Select Option From Dropdown List     ${STATUS_LOC}      ${status}
Project Name
    [Arguments]     ${project}
    Scroll Down Page From The Browser
    Click Plus Button       ${PROJECT_ADD_BTN}
    Select Data On Basic Search Mode          ${DROPDOWN_SEARCH_LOC}   ${NAME_SEARCH_FIELD}    ${project}   #from misc_resource.robot
    Verify Added Information    ${project}      ${PROJECT_LOC}
    Click Erase Button      ${PROJECT_DEL_BTN}
    Verify Deleted Information      ${PROJECT_LOC}
    Click Plus Button       ${PROJECT_ADD_BTN}
    Select Data On Basic Search Mode          ${DROPDOWN_SEARCH_LOC}   ${NAME_SEARCH_FIELD}    ${project}   #from misc_resource.robot
    Verify Added Information    ${project}  ${PROJECT_LOC}

Case Open Date
    [Arguments]     ${case_open_date}
    Enter Date Calendar Text    ${CASE_OPEN_LOC}    ${case_open_date}
Case Close Date
    [Arguments]     ${case_close_date}
    Enter Date Calendar Text    ${CASE_CLOSE_LOC}   ${case_close_date}
Plan Due Date
    [Arguments]     ${plan_due_date}
    Enter Date Calendar Text        ${CASE_PLAN_LOC}    ${plan_due_date}
Waiting For
    [Arguments]     ${waiting}
    ${wait_for}=    Get Web Elements    //select[@name="${WAITING_FOR_LOC}"]
    :FOR   ${item}  IN    @{wait_for}
    \   Log  ${item.text}
#    Click Element   //select[@name="${WAITING_FOR_LOC}"]/option[@value=contains(text(), "${waiting}")]
Partner Account
    [Arguments]     ${partner_account}
    ${case_part_acc}=   Get Web Elements  //select[@name="${PART_ACCOUNT_LOC}"]
    :FOR  ${item}   IN      @{case_part_acc}
    \   Log     ${item.text}
    Select Option From Dropdown List        ${PART_ACCOUNT_LOC}     ${partner_account}
Partner Contact
    [Arguments]     ${partner_contact}
    Input Text      ${PARTNER_CONTACT_LOC}  ${partner_contact}
Closed Reason
    [Arguments]     ${closed_reason}
    ${closed_reason_list}=  Get Web Elements     //select[@name="${CLOSED_REASON_LOC}"]
    :FOR  ${item}  IN   @{closed_reason_list}
    \   Log     ${item.text}

Description
    [Arguments]  ${description}
    Input Text      ${DESCRIPTION_LOC}      ${description}
Solution
    [Arguments]  ${solution}
    Input Text      ${SOLUTION_LOC}         ${solution}
Prevention
    [Arguments]  ${prevention}
    Input Text      ${PREVENTION_LOC}       ${prevention}

Contact Name
    [Arguments]     ${contact_name}
    Scroll Down Page From The Browser
    Click Plus Button                     ${CONTACT_ADDNAME_BTN}       #${plus_button_locator}
    Select Data On Basic Search Mode      ${DROPDOWN_SEARCH_LOC}  ${CONTACT_NAME_SEARCH}  ${contact_name}
    Verify Added Information              ${contact_name}      ${CONTACT_NAME_LABEL}
    Click Erase Button                    ${CONTACTNAME_DEL_BTN}
    Verify Deleted Information            ${CONTACT_NAME_LABEL}
    Click Plus Button                     ${CONTACT_ADDNAME_BTN}
    Select Data On Basic Search Mode      ${DROPDOWN_SEARCH_LOC}   ${CONTACT_NAME_SEARCH}    ${contact_name}   #from misc_resource.robot
    Verify Added Information              ${contact_name}      ${CONTACT_NAME_LABEL}

Contact Mobile
    [Arguments]     ${contact_mobile}
    