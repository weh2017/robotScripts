*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     String   
Library     DateTime
Library     Collections
Library     Dialogs
Library     ImapLibrary
Resource        ../../common_resources/web_common.robot
Resource        ../../common_resources/misc_resources.robot
Resource        ../resources/user_login_resources/user_login_resource.robot


Suite Setup     Open Chrome Browser
#Suite Teardown  Close Browser

*** Variables ***
${CUSTOMER_SERVICE}         Customer Service
${CASE_STRING}              Case
${CASE_TXTBOX}              name:ticket_title
${PRIORITY_LOC}             ticket_important
${CASE_TYPE_LOC}            ticket_type
${STATUS_LOC}               ticketstatus
${PROJECT_LOC}              project_no
${PROJECT_ADD_BTN}          //td[4]//table[1]//tbody[1]//tr[1]//td[3]//img[1]
${PROJECT_DEL_BTN}          //td[4]//table[1]//tbody[1]//tr[1]//td[4]//input[1]
${NAME_SEARCH_FIELD}        project_name
${CASE_OPEN_LOC}            name:case_open_date
${CASE_CLOSE_LOC}           name:cf_4616
${CASE_PLAN_LOC}            name:case_date
${WAITING_FOR_LOC}          cf_4583
${PART_ACCOUNT_LOC}         ticket_del_name
${PARTNER_CONTACT_LOC}      id:cf_4614
${CLOSED_REASON_LOC}        cf_4681
${DESCRIPTION_LOC}          name:case_cause
${SOLUTION_LOC}             name:case_perfomance
${PREVENTION_LOC}           name:case_protection
${CONTACT_ADDNAME_BTN}      //td[@class='showPanelBg']//td[2]//table[1]//tbody[1]//tr[1]//td[2]//img[1]
${CONTACTNAME_DEL_BTN}      //td[@class='showPanelBg']//td[2]//table[1]//tbody[1]//tr[1]//td[3]//input[1]
${DROPDOWN_SEARCH_LOC}      search_field
${CONTACT_NAME_SEARCH}      firstname
${CONTACT_NAME_LABEL}       contact_name
${CONTACT_EMAIL_LOC}        name:email
${CONTACT_MOBILE_LOC}       name:phone
${ACCOUNT_NAME_ADD_BTN}     //tr[17]//td[4]//table[1]//tbody[1]//tr[1]//td[2]//img[1]
${ACCOUNT_NAME_DEL_BTN}     //tr[17]//td[4]//table[1]//tbody[1]//tr[1]//td[3]//input[1]
${ACCOUNT_NAME_LABEL}       account_name
${ACCOUNT_NAME_SEARCH}      accountname
${SERIAL_NAME_ADD_BTN}      //td[@class='showPanelBg']//td[2]//table[1]//tbody[1]//tr[1]//td[3]//img[1]
${SERIAL_NAME_DEL_BTN}      //td[@class='showPanelBg']//td[2]//table[1]//tbody[1]//tr[1]//td[4]//input[1]
${SERIAL_NAME_LABEL}        serial_name
${SERIAL_NO_SEARCH}         serial_no
${PROD_NAME_ADD_BTN}        //tr[21]//td[4]//table[1]//tbody[1]//tr[1]//td[2]//img[1]
${PROD_NAME_LABEL}          product_name
${PROD_NAME_DEL_BTN}        //tr[21]//td[4]//table[1]//tbody[1]//tr[1]//td[3]//input[1]
${PROD_NAME_SEARCH}         product_no
${PROD_BRAND_LOC}           id:case_prd_brand
${PROD_MODEL_LOC}           name:case_prd_model
${DELIVERY_DATE_LOC}        name:case_datebuy
${WARRANTY_DROPDOWN_LOC}    case_waranty
${WARRANTY_DATE_LOC}        name:case_start_date
${CHECK_PRODUCT_LOC}        name:case_daterecieve
${WARRANTY_EXPIRED_LOC}     name:case_end_date
${SENT_PRODUCT_LOC}         name:case_datesent
${ALL_CONTACTS_BTN}         id:all_contacts
*** Test Cases ***
AIS-CRM Website
    Launch Web System   ${URL_2}

# Log-In User with Valid Username And Password
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
    :FOR    ${line}    IN          @{lines}
    \   @{bm}=      Split String    ${line}     |
    # Case Name
    \   ${case_name}=   Set Variable    @{bm}[0]
    \   ${remove_space}=    Strip String   ${case_name}${SPACE}
    \   ${remove_case}=  Remove String   ${remove_space}    ['
    # Priority
    \   ${remove}=                  Set Variable    @{bm}[1]
    \   ${priority}=                Strip String   ${remove}${SPACE}
    # Responsble Person
    \   ${space_res}=               Set Variable    @{bm}[2]
    \   ${responsible}=             Strip String   ${space_res}${SPACE}
    # Case Type
    \   ${rem_case}=                Set Variable    @{bm}[3]
    \   ${case_type}=               Strip String   ${rem_case}${SPACE}
    # Status
    \   ${strip_status}=            Set Variable    @{bm}[4]
    \   ${status}=                  Strip String    ${strip_status}${SPACE}
    # Account Name
    \   ${strip_account}=            Set Variable    @{bm}[5]
    \   ${account_name}=            Strip String     ${strip_account}${SPACE}
    # Project Name
    \   ${strip_project}=           Set Variable    @{bm}[6]
    \   ${project}=                 Strip String    ${strip_project}${SPACE}
    # Case Open Date
    \   ${strip_case_open}=          Set Variable    @{bm}[7]
    \   ${case_open_date}=          Strip String    ${strip_case_open}${SPACE}
    # Case Close Date
    \   ${strip_case_close}=         Set Variable   @{bm}[8]
    \   ${case_close_date}=          Strip String   ${strip_case_close}${SPACE}
    # Plan Due Date
    \   ${strip_plan_due}=          Set Variable   @{bm}[9]
    \   ${plan_due_date}=           Strip String    ${strip_plan_due}${SPACE}
    # Waiting For
    \   ${strip_waiting}=           Set Variable   @{bm}[10]
    \   ${waiting}=                 Strip String   ${strip_waiting}${SPACE}
    # Partner Account
    \   ${strip_part_acc}=         Set Variable    @{bm}[11]
    \   ${partner_account}=         Strip String   ${strip_part_acc}${SPACE}
    # Partner Contact
    \   ${strip_part_cont}=         Set Variable    @{bm}[12]
    \   ${partner_contact}=         Strip String    ${strip_part_cont}${SPACE}
    # Closed Reason
    \   ${strip_closed}=            Set Variable    @{bm}[13]
    \   ${closed_reason}=           Strip String    ${strip_closed}${SPACE}
    # Description
    \   ${strip_description}=       Set Variable    @{bm}[14]
    \   ${description}=             Strip String    ${strip_description}${SPACE}
    # Solution
    \   ${strip_solution}=          Set Variable    @{bm}[15]
    \   ${solution}=                Strip String    ${strip_solution}${SPACE}
    # Prevention
    \   ${strip_prevent}=           Set Variable    @{bm}[16]
    \   ${prevention}=              Strip String    ${strip_prevent}${SPACE}
    # Contact Name
    \   ${strip_contact_name}=      Set Variable    @{bm}[17]
    \   ${contact_name}=            Strip String    ${strip_contact_name}${SPACE}
    # Contact Mobile
    \   ${strip_contact_mobile}=    Set Variable    @{bm}[18]
    \   ${contact_mobile}=          Strip String    ${strip_contact_mobile}${SPACE}
    # Contact E-mail
    \   ${strip_contact_email}=     Set Variable    @{bm}[19]
    \   ${contact_email}=           Strip String    ${strip_contact_email}${SPACE}
    # Serial Name
    \   ${strip_serial_name}=       Set Variable    @{bm}[20]
    \   ${serial_name}=             Strip String    ${strip_serial_name}${SPACE}
    # Product Name
    \   ${strip_product_name}=      Set Variable    @{bm}[21]
    \   ${product_name}=            Strip String    ${strip_product_name}${SPACE}
    # Product Brand
    \   ${strip_product_brand}=     Set Variable    @{bm}[22]
    \   ${product_brand}=           Strip String    ${strip_product_brand}${SPACE}
    # Product Model
    \   ${strip_product_model}=     Set Variable    @{bm}[23]
    \   ${product_model}=           Strip String    ${strip_product_model}${SPACE}
    # Delivery Date
    \   ${strip_delivery_date}=     Set Variable    @{bm}[24]
    \   ${delivery_date}=           Strip String   ${strip_delivery_date}${SPACE}
    # Warranty
    \   ${strip_warranty}=           Set Variable    @{bm}[25]
    \   ${warranty}=                 Strip String    ${strip_warranty}${SPACE}
    # Warranty Active Date
    \   ${strip_warranty_active}=    Set Variable    @{bm}[26]
    \   ${warranty_active_date}=     Strip String    ${strip_warranty_active}${SPACE}
    # Check Product Date
    \   ${strip_check_prod}=         Set Variable    @{bm}[27]
    \   ${check_product_date}=       Strip String    ${strip_check_prod}${SPACE}
    # Warranty Expired Date
    \   ${strip_warranty_expired}=   Set Variable    @{bm}[28]
    \   ${warranty_expired_date}=    Strip String    ${strip_warranty_expired}${SPACE}
    # Sent Product Date
    \   ${strip_sent_prod_date}=     Set Variable    @{bm}[29]
    \   ${sent_product_date}=        Strip String    ${strip_sent_prod_date}${SPACE}
    \   Case Name                       ${remove_case}
    \   Priority Case                   ${priority}
    \   Responsible Person              ${responsible}
    \   Case Type                       ${case_type}
    \   Status                          ${status}
    \   Account Name                    ${account_name}
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
    \   Contact Mobile                  ${contact_mobile}
    \   Contact E-mail                  ${contact_email}
    \   Serial Name                     ${serial_name}
    \   Product Name                    ${product_name}
    \   Product Brand                   ${product_brand}
    \   Product Model                   ${product_model}
    \   Delivery Date                   ${delivery_date}
    \   Warranty                        ${warranty}
    \   Warranty Active Date            ${warranty_active_date}
    \   Check Product Date              ${check_product_date}
    \   Warranty Expired Date           ${warranty_expired_date}
    \   Sent Product Date               ${sent_product_date}
#    \   Enter Case Information          ${remove_case}  ${priority}    ${responsible}    ${case_type}
#    ...     ${status}   ${project}  ${case_open_date}   ${case_close_date}
#    ...     ${plan_due_date}    ${waiting}  ${partner_account}  ${partner_contact}
#    ...     ${description}  ${solution}     ${prevention}

Email Verification
    Open Mailbox    mail.aisyst.com     user
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
    Run Keyword If  "${priority}"=="None"   Click Element   //select[@name="ticket_important"]/option[@value="--${priority}--"]
    ...     ELSE    Select Option From Dropdown List    ${PRIORITY_LOC}     ${priority}
Responsible Person
    [Documentation]  This is to set the person to assign Case
    [Arguments]     ${responsible}
#    Set Selenium Speed   0.5
    ${xpath_user}=   Get Element Count    //select[@name="assigned_user_id"]/option[contains(text(), "${responsible}")]
    ${xpath_group}=     Get Element Count     //select[@name="assigned_group_id"]/option[contains(text(), "${responsible}")]

    Run Keyword And Return If  ${xpath_user}    Run Keywords     Select Radio Button   assigntype    U
    ...   AND     Click Element      //select[@name="assigned_user_id"]/option[contains(text(), "${responsible}")]
    ...   AND     Element Text Should Be     //select[@name="assigned_user_id"]/option[contains(text(), "${responsible}")]
    ...     ${responsible}
    Run Keyword And Return If  ${xpath_group}   Run Keywords     Select Radio Button   assigntype    T
    ...   AND     Wait Until Element Is Visible   //select[@name="assigned_group_id"]/option[contains(text(), "${responsible}")]
    ...   AND     Click Element       //select[@name="assigned_group_id"]/option[contains(text(), "${responsible}")]
    ...   AND     Element Text Should Be     //select[@name="assigned_group_id"]/option[contains(text(), "${responsible}")]
    ...     ${responsible}
Case Type
    [Arguments]     ${case_type}
    ${ticket}=      Get Web Elements        //select[@name="ticket_type"]
    :FOR    ${item}     IN   @{ticket}
    \   Log     ${item.text}
#    Click Element   //select[@name="ticket_type"]/option[@value="${case_type}"]
    Select Option From Dropdown List    ${CASE_TYPE_LOC}        ${case_type}
    Wait Until Page Contains Element       //select[@name="${CASE_TYPE_LOC}"]/option[@value="${case_type}"]
Status
    [Arguments]   ${status}
    ${status_case}=     Get Web Elements    //select[@name="ticketstatus"]
    :FOR    ${item}     IN    @{status_case}
    \   Log    ${item.text}
#    Click Element   //select[@name="ticketstatus"]/option[@value="${status}"]
    Select Option From Dropdown List     ${STATUS_LOC}      ${status}
    Wait Until Page Contains Element      //select[@name="${STATUS_LOC}"]/option[@value="${status}"]


Project Name
    [Arguments]     ${project}=${EMPTY}
    ${get}=     Get WebElements     //a[@href="javascript:window.close();"]
    :FOR    ${item}     IN    @{get}
    \   Log   ${item.text}
    Run Keyword If  "${project}"!="${EMPTY}"    Run Keywords    Scroll Down Page From The Browser
    ...     AND     Click Plus Button       ${PROJECT_ADD_BTN}
    ...     AND     Focus New Browser Window
    ...     AND    Select Data On Basic Search Mode          ${DROPDOWN_SEARCH_LOC}   ${NAME_SEARCH_FIELD}    ${project}   #from misc_resource.robot
    ...     AND    Exit New Window And Focus Main Browser
    ...     AND    Verify Added Information    ${project}      ${PROJECT_LOC}
    ...     AND    Click Erase Button      ${PROJECT_DEL_BTN}
    ...     AND    Verify Deleted Information      ${PROJECT_LOC}
    ...     AND    Click Plus Button       ${PROJECT_ADD_BTN}
    ...     AND    Focus New Browser Window
    ...     AND    Select Data On Basic Search Mode          ${DROPDOWN_SEARCH_LOC}   ${NAME_SEARCH_FIELD}    ${project}   #from misc_resource.robot
    ...     AND    Exit New Window And Focus Main Browser
    ...     AND    Verify Added Information    ${project}  ${PROJECT_LOC}
    Run Keyword If  "${project}"=="${EMPTY}"    Run Keywords    Click Erase Button  ${PROJECT_DEL_BTN}
    ...     AND     Verify Deleted Information   ${PROJECT_LOC}

Account Name
    [Arguments]  ${account_name}=${EMPTY}
    Run Keyword If  "${account_name}"!="${EMPTY}"   Run Keywords    Scroll Down Page From The Browser
    ...     AND     Click Plus Button       ${ACCOUNT_NAME_ADD_BTN}
    ...     AND     Focus New Browser Window
    ...     AND     Select Data On Basic Search Mode    ${DROPDOWN_SEARCH_LOC}  ${ACCOUNT_NAME_SEARCH}      ${account_name}     #from misc_resources.robot
    ...     AND     Exit New Window And Focus Main Browser
    ...     AND     Verify Added Information    ${account_name}  ${ACCOUNT_NAME_LABEL}
    ...     AND     Click Erase Button      ${ACCOUNT_NAME_DEL_BTN}
    ...     AND     Verify Deleted Information  ${ACCOUNT_NAME_LABEL}
    ...     AND     Click Plus Button   ${ACCOUNT_NAME_ADD_BTN}
    ...     AND     Focus New Browser Window
    ...     AND     Select Data On Basic Search Mode    ${DROPDOWN_SEARCH_LOC}  ${ACCOUNT_NAME_SEARCH}  ${account_name}
    ...     AND     Exit New Window And Focus Main Browser
    ...     AND     Verify Added Information    ${account_name}  ${ACCOUNT_NAME_LABEL}
    Run Keyword If  "${account_name}"=="${EMPTY}"   Run Keywords    Click Erase Button   ${ACCOUNT_NAME_DEL_BTN}
    ...     AND     Verify Deleted Information      ${ACCOUNT_NAME_LABEL}

Case Open Date
    [Arguments]     ${case_open_date}=${EMPTY}
    Run Keyword If  "${case_open_date}"!="${EMPTY}"
    ...     Enter Date Calendar Text    ${CASE_OPEN_LOC}    ${case_open_date}   clear=True
Case Close Date
    [Arguments]     ${case_close_date}=${EMPTY}
    Run Keyword If  "${case_close_date}"!="${EMPTY}"
    ...     Enter Date Calendar Text    ${CASE_CLOSE_LOC}   ${case_close_date}  clear=True
Plan Due Date
    [Arguments]     ${plan_due_date}=${EMPTY}
    Run Keyword If  "${plan_due_date}"!="${EMPTY}"
    ...     Enter Date Calendar Text        ${CASE_PLAN_LOC}    ${plan_due_date}    clear=True
Waiting For
    [Arguments]     ${waiting}
    ${wait_for}=    Get Web Elements    //select[@name="${WAITING_FOR_LOC}"]      #Get Web Elements is extract text or strings
    :FOR   ${item}  IN    @{wait_for}
    \   Log  ${item.text}
    Click Element   //select[@name="${WAITING_FOR_LOC}"]/option[@value=contains(text(), "${waiting}")]
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
    [Arguments]  ${description}=${EMPTY}
    Run Keyword If  "${description}"!="${EMPTY}"    Input Text      ${DESCRIPTION_LOC}      ${description}
Solution
    [Arguments]  ${solution}=${EMPTY}
    Run Keyword If  "${solution}"!="${EMPTY}"   Input Text      ${SOLUTION_LOC}         ${solution}
Prevention
    [Arguments]  ${prevention}=${EMPTY}
    Run Keyword If  "${prevention}"!="${EMPTY}"     Input Text      ${PREVENTION_LOC}       ${prevention}

Contact Name
    [Arguments]     ${contact_name}=${EMPTY}
    Scroll Down Page From The Browser
    Run Keyword If  "${contact_name}"!="${EMPTY}"   Run Keywords    Click Plus Button       ${CONTACT_ADDNAME_BTN}       #${plus_button_locator}
    ...     AND     Focus New Browser Window
    ...     AND     Select Data On Basic Search Mode      ${DROPDOWN_SEARCH_LOC}  ${CONTACT_NAME_SEARCH}  ${contact_name}
    ...     AND     Exit New Window And Focus Main Browser
    ...     AND     Verify Added Information              ${contact_name}      ${CONTACT_NAME_LABEL}
    ...     AND     Click Erase Button                    ${CONTACTNAME_DEL_BTN}
    ...     AND     Verify Deleted Information            ${CONTACT_NAME_LABEL}
    ...     AND     Click Plus Button                     ${CONTACT_ADDNAME_BTN}
    ...     AND     Focus New Browser Window
    ...     AND     Select Data On Basic Search Mode      ${DROPDOWN_SEARCH_LOC}   ${CONTACT_NAME_SEARCH}    ${contact_name}   #from misc_resource.robot
    ...     AND     Exit New Window And Focus Main Browser
    ...     AND     Verify Added Information              ${contact_name}      ${CONTACT_NAME_LABEL}
Contact Mobile
    [Arguments]     ${contact_mobile}=${EMPTY}
    Run Keyword If   "${contact_mobile}"!="${EMPTY}"     Input Text      ${CONTACT_MOBILE_LOC}        ${contact_mobile}

Contact E-mail
    [Arguments]     ${contact_email}=${EMPTY}
    Run Keyword If  "${contact_email}"!="${EMPTY}"      Input Text  ${CONTACT_EMAIL_LOC}    ${contact_email}

Click All Contacts Button
     ${not_empty}=   Get Element Count   id:all_contacts
     Run Keyword If     "${not_empty}"!="${EMPTY}"      Click Element       id:all_contacts
Serial Name
    [Arguments]  ${serial_name}=${EMPTY}
    Scroll Down Page From The Browser
    ${element}=     Get Element Count   //tr[2]/td[2]
    ${not_empty}=   Get Element Count   ${ALL_CONTACTS_BTN}
    Run Keyword If  "${serial_name}"!="${EMPTY}"     Run Keywords    Click Plus Button   ${SERIAL_NAME_ADD_BTN}   # plus button locator
    ...     AND     Focus New Browser Window
    ...     AND     Run Keyword If     "${not_empty}"!="${EMPTY}"      Click Element       ${ALL_CONTACTS_BTN}
    ...     AND     Select Data On Basic Search Mode    ${DROPDOWN_SEARCH_LOC}  ${SERIAL_NO_SEARCH}     ${serial_name}
    ...     AND     Exit New Window And Focus Main Browser
    ...     AND     Verify Added Information      ${element}     ${SERIAL_NAME_LABEL}
    ...     AND     Click Erase Button      ${SERIAL_NAME_DEL_BTN}
    ...     AND     Verify Deleted Information      ${SERIAL_NAME_LABEL}
    ...     AND     Click Plus Button               ${SERIAL_NAME_ADD_BTN}
    ...     AND     Focus New Browser Window
    ...     AND     Run Keyword If     "${not_empty}"!="${EMPTY}"      Click Element       ${ALL_CONTACTS_BTN}
    ...     AND     Select Data On Basic Search Mode    ${DROPDOWN_SEARCH_LOC}  ${SERIAL_NO_SEARCH}     ${serial_name}
    ...     AND     Exit New Window And Focus Main Browser
    ...     AND     Verify Added Information            ${element}     ${SERIAL_NAME_LABEL}
Product Name
    [Arguments]   ${product_name}=${EMPTY}
    Scroll Down Page From The Browser
    Run Keyword If  "${product_name}"!="${EMPTY}"   Run Keywords    Click Plus Button   ${PROD_NAME_ADD_BTN}
    ...     AND     Focus New Browser Window
    ...     AND     Select Data On Basic Search Mode    ${DROPDOWN_SEARCH_LOC}  ${PROD_NAME_SEARCH}     ${product_name}
    ...     AND     Exit New Window And Focus Main Browser
    ...     AND     Verify Added Information              ${product_name}     ${PROD_NAME_LABEL}
    ...     AND     Click Erase Button                  ${PROD_NAME_DEL_BTN}
    ...     AND     Verify Deleted Information          ${PROD_NAME_LABEL}
    ...     AND     Click Plus Button                   ${PROD_NAME_ADD_BTN}
    ...     AND     Focus New Browser Window
    ...     AND     Select Data On Basic Search Mode    ${DROPDOWN_SEARCH_LOC}  ${PROD_NAME_SEARCH}     ${product_name}
    ...     AND     Exit New Window And Focus Main Browser
    ...     AND     Verify Added Information            ${product_name}     ${PROD_NAME_LABEL}



Product Brand
    [Arguments]   ${product_brand}=${EMPTY}
    Run Keyword If      "${product_brand}"!="${EMPTY}"  Run Keywords
    ...     Wait Until Element Is Visible   ${PROD_BRAND_LOC}
    ...     AND     Input Text      ${PROD_BRAND_LOC}       ${product_brand}

Product Model
    [Arguments]     ${product_model}=${EMPTY}
    Run Keyword If  "${product_model}"!="${EMPTY}"  Input Text      ${PROD_MODEL_LOC}   ${product_model}

Delivery Date
    [Arguments]     ${delivery_date}=${EMPTY}
    Run Keyword If  "${delivery_date}"!="${EMPTY}"
    ...     Enter Date Calendar Text            ${DELIVERY_DATE_LOC}      ${delivery_date}      clear=True

Warranty
    [Arguments]    ${warranty}=${EMPTY}
    ${get_warranty}=    Get Web Elements    ${WARRANTY_DROPDOWN_LOC}
    :FOR    ${item}     IN      @{get_warranty}
    \   Log     ${item.text}
    Run Keyword If      "${warranty}"=="None"     Click Element     //select[@name="case_waranty"]/option[@value="--${warranty}--"]
    ...     ELSE    Select Option From Dropdown List    ${WARRANTY_DROPDOWN_LOC}        ${warranty}

Warranty Active Date
    [Arguments]     ${warranty_active_date}=${EMPTY}
    Run Keyword If      "${warranty_active_date}"!="${EMPTY}"
    ...     Enter Date Calendar Text  ${WARRANTY_DATE_LOC}    ${warranty_active_date}      clear=True

Check Product Date
    [Arguments]     ${check_product_date}=${EMPTY}
    Run Keyword If      "${check_product_date}"!="${EMPTY}"
    ...     Enter Date Calendar Text  ${CHECK_PRODUCT_LOC}    ${check_product_date}     clear=True

Warranty Expired Date
    [Arguments]     ${warranty_expired_date}=${EMPTY}
    Run Keyword If  "${warranty_expired_date}"!="${EMPTY}"
    ...     Enter Date Calendar Text  ${WARRANTY_EXPIRED_LOC}     ${warranty_expired_date}      clear=True

Sent Product Date
    [Arguments]     ${sent_product_date}=${EMPTY}
    Run Keyword If  "${sent_product_date}"!="${EMPTY}"
    ...     Enter Date Calendar Text   ${SENT_PRODUCT_LOC}     ${sent_product_date}     clear=True

