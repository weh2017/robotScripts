*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     String   
Library     DateTime
Library     Collections
Library     Dialogs
Resource        ../../common_resources/web_common.robot
Resource        ../../common_resources/misc_resources.robot
Resource        ../resources/user_login_resources/user_login_resource.robot
Suite Setup     Open Chrome Browser
Suite Teardown  Close Browser

*** Variables ***
${IMAGE_PATH}               C://Users/ruela/Documents/robotScripts/AISCRM/create_case_module/images
${CUSTOMER_SERVICE}         Customer Service
${CASE_STRING}              Case
${SEARCH_STRING}            Search
${DROPDOWN_SEARCH_LOC}      search_field
${CASE_TXTBOX}              name:ticket_title
${PRIORITY_LOC}             ticket_important
${CASE_NO_LOC}              ticket_no
${CASE_TYPE_LOC}            ticket_type
${CHANNEL_LOC}              channel
${STATUS_LOC}               ticketstatus
${PROJECT_LOC}              project_no
${PROJECT_ADD_BTN}          //td[4]//table[1]//tbody[1]//tr[1]//td[3]//img[1]
${PROJECT_DEL_BTN}          //td[4]//table[1]//tbody[1]//tr[1]//td[4]//input[1]
${NAME_SEARCH_FIELD}        project_name
${CASE_OPEN_LOC}            name:case_open_date
${CASE_CLOSE_LOC}           name:cf_4616
${CASE_PLAN_LOC}            name:case_date
${WAITING_FOR_LOC}          waiting_for
${PART_ACCOUNT_LOC}         ticket_del_name
${PARTNER_CONTACT_LOC}      id:cf_4614
${CLOSED_REASON_LOC}        cf_4681
${DESCRIPTION_LOC}          name:case_cause
${SOLUTION_LOC}             name:case_perfomance
${PREVENTION_LOC}           name:case_protection
${CONTACT_ADDNAME_BTN}      //td[@class='showPanelBg']//td[2]//table[1]//tbody[1]//tr[1]//td[2]//img[1]
${CONTACTNAME_DEL_BTN}      //td[@class='showPanelBg']//td[2]//table[1]//tbody[1]//tr[1]//td[3]//input[1]
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

Log-In User with Valid Username And Password
    [Tags]  User credentials
    Input Username             ${USER}
    Input User's Password      ${PASS}
    Click Login button


Select Customer Service
    Select Menu                             ${CUSTOMER_SERVICE}

Create Case Data Informations
    Case Data Informations      ALL     ${CURDIR}${/}create_case_module.csv
*** Keywords ***
Case Data Informations
    [Arguments]   ${data}      ${csv}
#    Set Selenium Speed  0.5
    ${contents}=    Get File    ${csv}
    @{read}=    Create List     ${contents}
    @{lines}=   Split To Lines      @{read}     1
    :FOR    ${line}    IN          @{lines}
    \   Select Sub-Menu        ${CASE_STRING}
    \   Click Button To Create Page             ${CASE_STRING}
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
    \   ${strip_part_acc}=          Set Variable    @{bm}[11]
    \   ${partner_account}=         Strip String   ${strip_part_acc}${SPACE}
    # Partner Contact
    \   ${strip_part_cont}=         Set Variable    @{bm}[12]
    \   ${partner_contact}=         Strip String    ${strip_part_cont}${SPACE}
    # Closed Reason
    \   ${strip_closed}=            Set Variable    @{bm}[13]
    \   ${closed_reason}=           Strip String    ${strip_closed}${SPACE}
    # Channel
    \   ${strip_channel}=           Set Variable    @{bm}[14]
    \   ${channel}=                 Strip String    ${strip_channel}${SPACE}
    # Description
    \   ${strip_description}=       Set Variable    @{bm}[15]
    \   ${description}=             Strip String    ${strip_description}${SPACE}
    # Solution
    \   ${strip_solution}=          Set Variable    @{bm}[16]
    \   ${solution}=                Strip String    ${strip_solution}${SPACE}
    # Prevention
    \   ${strip_prevent}=           Set Variable    @{bm}[17]
    \   ${prevention}=              Strip String    ${strip_prevent}${SPACE}
    # Contact Name
    \   ${strip_contact_name}=      Set Variable    @{bm}[18]
    \   ${contact_name}=            Strip String    ${strip_contact_name}${SPACE}
    # Contact Mobile
    \   ${strip_contact_mobile}=    Set Variable    @{bm}[19]
    \   ${contact_mobile}=          Strip String    ${strip_contact_mobile}${SPACE}
    # Contact E-mail
    \   ${strip_contact_email}=     Set Variable    @{bm}[20]
    \   ${contact_email}=           Strip String    ${strip_contact_email}${SPACE}
    # Product Name
    \   ${strip_product_name}=      Set Variable    @{bm}[21]
    \   ${product_name}=            Strip String    ${strip_product_name}${SPACE}
    # Serial Name
    \   ${strip_serial_name}=       Set Variable    @{bm}[22]
    \   ${serial_name}=             Strip String    ${strip_serial_name}${SPACE}
    # Product Brand
    \   ${strip_product_brand}=     Set Variable    @{bm}[23]
    \   ${product_brand}=           Strip String    ${strip_product_brand}${SPACE}
    # Product Model
    \   ${strip_product_model}=     Set Variable    @{bm}[24]
    \   ${product_model}=           Strip String    ${strip_product_model}${SPACE}
    # Delivery Date
    \   ${strip_delivery_date}=     Set Variable    @{bm}[25]
    \   ${delivery_date}=           Strip String   ${strip_delivery_date}${SPACE}
    # Warranty
    \   ${strip_warranty}=           Set Variable    @{bm}[26]
    \   ${warranty}=                 Strip String    ${strip_warranty}${SPACE}
    # Warranty Active Date
    \   ${strip_warranty_active}=    Set Variable    @{bm}[27]
    \   ${warranty_active_date}=     Strip String    ${strip_warranty_active}${SPACE}
    # Check Product Date
    \   ${strip_check_prod}=         Set Variable    @{bm}[28]
    \   ${check_product_date}=       Strip String    ${strip_check_prod}${SPACE}
    # Warranty Expired Date
    \   ${strip_warranty_expired}=   Set Variable    @{bm}[29]
    \   ${warranty_expired_date}=    Strip String    ${strip_warranty_expired}${SPACE}
    # Sent Product Date
    \   ${strip_sent_prod_date}=     Set Variable    @{bm}[30]
    \   ${sent_product_date}=        Strip String    ${strip_sent_prod_date}${SPACE}
    # Case Upload Image
    \   ${strip_img}=                Set Variable    @{bm}[31]
    \   ${case_image}=               Strip String    ${strip_img}${SPACE}
    \   Run Keyword If   '${data}'=='ALL'    Enter Case Information
    ...         ${remove_case}  ${priority}  ${responsible}  ${case_type}  ${status}  ${channel}  ${closed_reason}
    ...         ${account_name}  ${project}  ${case_open_date}  ${case_close_date}  ${plan_due_date}
    ...         ${waiting}  ${partner_account}  ${partner_contact}  ${description}  ${solution}
    ...         ${prevention}  ${contact_name}  ${contact_mobile}  ${contact_email}  ${serial_name}
    ...         ${product_name}  ${product_brand}  ${product_model}  ${delivery_date}  ${warranty}
    ...         ${warranty_active_date}  ${check_product_date}  ${warranty_expired_date}  ${sent_product_date}  ${case_image}
    \   Scroll Up Page From The Browser

Enter Case Information
    [Arguments]  ${remove_case}  ${priority}  ${responsible}  ${case_type}  ${status}  ${channel}   ${closed_reason}
    ...         ${account_name}  ${project}  ${case_open_date}  ${case_close_date}  ${plan_due_date}
    ...         ${waiting}  ${partner_account}  ${partner_contact}  ${description}  ${solution}
    ...         ${prevention}  ${contact_name}  ${contact_mobile}  ${contact_email}  ${serial_name}
    ...         ${product_name}  ${product_brand}  ${product_model}  ${delivery_date}  ${warranty}
    ...         ${warranty_active_date}  ${check_product_date}  ${warranty_expired_date}  ${sent_product_date}  ${case_image}
    Case Name                       ${remove_case}
    Priority Case                   ${priority}
    Responsible Person              ${responsible}
    Case Type                       ${case_type}
    Status                          ${status}
    Channel                         ${channel}
    Account Name                    ${account_name}
    Project Name                    ${project}
    Case Open Date                  ${case_open_date}
    Case Close Date                 ${case_close_date}
    Plan Due Date                   ${plan_due_date}
    Waiting For                     ${waiting}
    Partner Contact                 ${partner_contact}
    Description                     ${description}
    Solution                        ${solution}
    Prevention                      ${prevention}
    Contact Name                    ${contact_name}
    Contact Mobile                  ${contact_mobile}
    Contact E-mail                  ${contact_email}
    Product Name                    ${product_name}
    Serial Name                     ${serial_name}
    Product Brand                   ${product_brand}
    Product Model                   ${product_model}
    Delivery Date                   ${delivery_date}
    Warranty                        ${warranty}
    Warranty Active Date            ${warranty_active_date}
    Check Product Date              ${check_product_date}
    Warranty Expired Date           ${warranty_expired_date}
    Sent Product Date               ${sent_product_date}
    Partner Account                 ${partner_account}
    Case Upload Image               ${case_image}
#    Pause Execution
    Scroll Up Page From The Browser
    Click Save Header Button
    Verify Results After Create      ${case_type}   ${remove_case}  ${status}  ${channel}   ${priority}     ${waiting}
    ...               ${responsible}    ${partner_account}  ${case_open_date}   ${partner_contact}
    ...               ${case_close_date}   ${closed_reason}   ${plan_due_date}  ${solution}     ${prevention}
    ...               ${description}  ${contact_name}  ${contact_mobile}  ${contact_email}  ${project}
    ...               ${account_name}  ${delivery_date}  ${warranty}  ${warranty_active_date}  ${check_product_date}
    ...               ${warranty_expired_date}  ${sent_product_date}   ${product_name}   #${case_image}
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
    Radio Button     ${responsible}

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
    ...     AND    Select Data On Basic Search Mode           ${DROPDOWN_SEARCH_LOC}    ${NAME_SEARCH_FIELD}    ${project}   #from misc_resource.robot
    ...     AND    Exit New Window And Focus Main Browser
    ...     AND    Verify Added Information    ${project}      ${PROJECT_LOC}
    ...     AND    Click Erase Button      ${PROJECT_DEL_BTN}
    ...     AND    Verify Deleted Information      ${PROJECT_LOC}
    ...     AND    Click Plus Button       ${PROJECT_ADD_BTN}
    ...     AND    Focus New Browser Window
    ...     AND    Select Data On Basic Search Mode           ${DROPDOWN_SEARCH_LOC}    ${NAME_SEARCH_FIELD}    ${project}   #from misc_resource.robot
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
    ...     AND     Select Data On Basic Search Mode     ${DROPDOWN_SEARCH_LOC}  ${ACCOUNT_NAME_SEARCH}  ${account_name}
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
    Run Keyword If  "${waiting}"=="${EMPTY}"    Click Element   //select[@name="${WAITING_FOR_LOC}"]/option[@value="--None--"]
    ...     ELSE IF     "${waiting}"=="None"    Click Element   //select[@name="${WAITING_FOR_LOC}"]/option[@value="--${waiting}--"]
    ...     ELSE    Select Option From Dropdown List    ${WAITING_FOR_LOC}      ${waiting}
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

Channel
    [Arguments]   ${channel}
    ${chan}=   Get Web Elements    //select[@name="channel"]
    :FOR  ${item}   IN  @{chan}
    \   Log     ${item.text}
    Run Keyword If  "${channel}"=="None"   Click Element   //select[@name="channel"]/option[@value="--${channel}--"]
    ...     ELSE IF     "${channel}"=="${EMPTY}"    Click Element   //select[@name="channel"]/option[@value="--None--"]
    ...     ELSE    Select Option From Dropdown List    ${CHANNEL_LOC}     ${channel}

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
    ...     AND     Select Data On Basic Search Mode      ${DROPDOWN_SEARCH_LOC}  ${CONTACT_NAME_SEARCH}    ${contact_name}   #from misc_resource.robot
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
    ...     AND     Select Data On Basic Search Mode     ${DROPDOWN_SEARCH_LOC}  ${SERIAL_NO_SEARCH}     ${serial_name}
    ...     AND     Exit New Window And Focus Main Browser
    ...     AND     Verify Added Information      ${element}     ${SERIAL_NAME_LABEL}
    ...     AND     Click Erase Button      ${SERIAL_NAME_DEL_BTN}
    ...     AND     Verify Deleted Information      ${SERIAL_NAME_LABEL}
    ...     AND     Click Plus Button               ${SERIAL_NAME_ADD_BTN}
    ...     AND     Focus New Browser Window
    ...     AND     Run Keyword If     "${not_empty}"!="${EMPTY}"      Click Element       ${ALL_CONTACTS_BTN}
    ...     AND     Select Data On Basic Search Mode     ${DROPDOWN_SEARCH_LOC}  ${SERIAL_NO_SEARCH}     ${serial_name}
    ...     AND     Exit New Window And Focus Main Browser
    ...     AND     Verify Added Information            ${element}     ${SERIAL_NAME_LABEL}
    ${suite}=       Get Value   //input[@name="${SERIAL_NAME_LABEL}"]
    Set Task Variable     ${suite}

Product Name
    [Arguments]   ${product_name}=${EMPTY}
    Scroll Down Page From The Browser
    Run Keyword If  "${product_name}"!="${EMPTY}"   Run Keywords    Click Plus Button   ${PROD_NAME_ADD_BTN}
    ...     AND     Focus New Browser Window
    ...     AND     Select Data On Basic Search Mode   ${DROPDOWN_SEARCH_LOC}  ${PROD_NAME_SEARCH}     ${product_name}
    ...     AND     Exit New Window And Focus Main Browser
    ...     AND     Verify Added Information              ${product_name}     ${PROD_NAME_LABEL}
    ...     AND     Click Erase Button                  ${PROD_NAME_DEL_BTN}
    ...     AND     Verify Deleted Information          ${PROD_NAME_LABEL}
    ...     AND     Click Plus Button                   ${PROD_NAME_ADD_BTN}
    ...     AND     Focus New Browser Window
    ...     AND     Select Data On Basic Search Mode    ${DROPDOWN_SEARCH_LOC}  ${PROD_NAME_SEARCH}     ${product_name}
    ...     AND     Exit New Window And Focus Main Browser
    ...     AND     Verify Added Information            ${product_name}     ${PROD_NAME_LABEL}
    ${product_suite}=       Get Value   //input[@name="${PROD_NAME_LABEL}"]
    Set Task Variable     ${product_suite}



Product Brand
    [Arguments]   ${product_brand}=${EMPTY}
    Run Keyword If      "${product_brand}"!="${EMPTY}"  Run Keywords
    ...     Wait Until Element Is Visible   ${PROD_BRAND_LOC}
    ...     AND     Input Text      ${PROD_BRAND_LOC}       ${product_brand}
    ${brand_suite}=     Get Value   id:case_prd_brand
    Set Global Variable     ${brand_suite}


Product Model
    [Arguments]     ${product_model}=${EMPTY}
    Run Keyword If  "${product_model}"!="${EMPTY}"  Input Text      ${PROD_MODEL_LOC}   ${product_model}
    ${model_suite}=     Get Value   id:case_prd_model
    Set Task Variable     ${model_suite}

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
    ...     ELSE IF     "${warranty}"=="${EMPTY}"   Click Element   //select[@name="case_waranty"]/option[@value="--None--"]
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

Case Upload Image
    [Arguments]      ${case_image}
    Scroll Down Page From The Browser
    Run Keyword If    "${case_image}"!="${EMPTY}"     Upload Single Image    ${IMAGE_PATH}/${case_image}
    ...     //input[@value="${case_image}"]

Verify Results After Create
    [Arguments]       ${case_type}   ${remove_case}     ${status}  ${channel}   ${priority}     ${waiting}
    ...               ${responsible}    ${partner_account}  ${case_open_date}   ${partner_contact}
    ...               ${case_close_date}   ${closed_reason}   ${plan_due_date}  ${solution}     ${prevention}
    ...               ${description}  ${contact_name}  ${contact_mobile}  ${contact_email}  ${project}
    ...               ${account_name}  ${delivery_date}  ${warranty}  ${warranty_active_date}  ${check_product_date}
    ...               ${warranty_expired_date}  ${sent_product_date}   ${product_name}
    Sleep  1
    ${current_date}=    Get Current Date    result_format=%d-%m-%Y
    Log     ${current_date}
    ${web}=     Get WebElements    //tr/td[2][@class="dvtCellInfo"]
    Log     ${web}
    ${get_id}=  Get Text  //tr/td[2][@class="dvtCellInfo"]
    ${convert}=     Convert To String   ${get_id}
    Log  ${convert}
    Set Task Variable   ${convert}
    ##########################################################################################
    #Case Information
    ##########################################################################################
    #Case No
    Element Should Contain                      //tr/td[@class="dvtCellInfo"]  ${convert}
    #Case Name
    Element Should Contain                      //td[@class="dvtCellInfo"]/span[@id="dtlview_Case Name"]       ${remove_case}
    #Priority
    Element Should Contain                      //div[@id="tblCaseInformation"]//tr[3]/td[2]/font     ${priority}
    #Responsible Person
    Element Should Contain                      //div[@id="tblCaseInformation"]//tr[4]/td[@class="dvtCellInfo"]/a     ${responsible}
    #Plan Due Date
    ${remove_dash_due}=       Replace String    ${plan_due_date}    /   -
    Verify Result Date Calendar                 //div[@id="tblCaseInformation"]//tr[5]/td[@class="dvtCellInfo"][contains(text(), "${remove_dash_due}")]      ${remove_dash_due}
    ${get_plan_due_date}=       Get Text        //div[@id="tblCaseInformation"]//tr[5]/td[@class="dvtCellInfo"][contains(text(), "${remove_dash_due}")]
    Log    ${get_plan_due_date}
    #Case Close Date
    ${remove_dash_close}=   Replace String      ${case_close_date}  /   -
    Verify Result Date Calendar                 //div[@id="tblCaseInformation"]//tr[6]/td[2][contains(text(), "${remove_dash_close}")]  ${remove_dash_close}
    ${get_close_date}=      Get Text            //div[@id="tblCaseInformation"]//tr[6]/td[2][contains(text(), "${remove_dash_close}")]
    Log  ${get_close_date}
    #Case Open Date
    ${remove_dash_open}=       Replace String   ${case_open_date}   /   -
    Verify Result Date Calendar                 //div[@id="tblCaseInformation"]//tr[7]/td[2][contains(text(), "${remove_dash_open}")]  ${remove_dash_open}
    ${get_open_date}=       Get Text            //div[@id="tblCaseInformation"]//tr[7]/td[2][contains(text(), "${remove_dash_open}")]
    Log   ${get_open_date}
    #Created Time
    Element Should Contain                      //div[@id="tblCaseInformation"]//tr[8]/td[2]    ${current_date}

    #Created By
    Element Should Contain                      //div[@id="tblCaseInformation"]//tr[9]/td[2]        ${USER_FULL_NAME}
    #Case Type
    Wait Until Element Is Visible               //div[@id="tblCaseInformation"]//tr/td[4]/font[contains(text(), "${case_type}")]
    ${get_case_type}=       Get Text            //div[@id="tblCaseInformation"]//tr/td[4]/font[contains(text(), "${case_type}")]
    Log     ${get_case_type}
    #Status
    Wait Until Element Is Visible               //div[@id="tblCaseInformation"]//tr[2]/td[4]/font[contains(text(), "${status}")]
    #Waiting For
    Run Keyword If  "${waiting}"=="None"    Wait Until Element Is Visible
    ...     //div[@id="tblCaseInformation"]//tr[3]/td[4]/font[contains(text(), "--${waiting}--")]
    ...     ELSE    Wait Until Element Is Visible      //div[@id="tblCaseInformation"]//tr[3]/td[4]/font[contains(text(), "${waiting}")]
    #Partner Account
    Wait Until Element Is Visible               //div[@id="tblCaseInformation"]//tr[4]/td[4]/font[contains(text(), "${partner_account}")]

    #Partner Contact
    Element Should Contain                      //div[@id="tblCaseInformation"]//tr[5]/td[4]/span      ${partner_contact}
    #Closed Reason
    Run Keyword If   "${closed_reason}"!="None"
    ...     Wait Until Element Is Visible       //div[@id="tblCaseInformation"]//tr[6]/td[4]/font[contains(text(), "${closed_reason}")]
    # Modified Time
    Wait Until Element Is Visible               //div[@id="tblCaseInformation"]//tr[7]/td[4][contains(text(), "${current_date}")]
#    #Modified By
#    Wait Until Element Is Visible    //div[@id="tblCaseInformation"]//tr[8]/td[4]/font[contains(text(), "${current_date}")]

    #Channel
    Wait Until Element Is Visible               //div[@id="tblCaseInformation"]//tr[9]/td[4]/font[contains(text(), "${channel}")]
    #####################################################################################################
    #Decription Information
    #####################################################################################################
#    #Solution and Answer
#    Scroll Element Into View    //tr[3]/td/div[@id="comments_div"]
#    Table Row Should Contain    //tr[3]/td/div[@id="comments_div"]   3      ${solution}
    #Description
    Scroll Element Into View    //div[@id="tblDescriptionInformation"]//tr/td[2]/span[@id="dtlview_Description"]
    Element Should Contain      //div[@id="tblDescriptionInformation"]//tr/td[2]/span[@id="dtlview_Description"]     ${description}
    #Prevention
    Scroll Element Into View    //div[@id="tblDescriptionInformation"]//tr/td[2]/span[@id="dtlview_Prevention (วิธีการป้องกัน)"]
    Element Should Contain      //div[@id="tblDescriptionInformation"]//tr/td[2]/span[@id="dtlview_Prevention (วิธีการป้องกัน)"]    ${prevention}
    #####################################################################################################
    #Customer Information
    #####################################################################################################
    #Contact Name
    Scroll Down Page From The Browser
    Wait Until Element Is Visible    //div[@id="tblCustomerInformation"]//tr/td[2]/a[contains(text(), "${contact_name}")]
    ${get_text}=    Get Text         //div[@id="tblCustomerInformation"]//tr/td[2]/a[contains(text(), "${contact_name}")]
#    ${remove}=  Remove String    ${get_text}    -
#    ${strip}=   Strip String    ${remove}${SPACE}
#    Should Be Equal       ${strip}  ${contact_name}
    #Contact Mobile
    Element Should Contain     //span[@id="dtlview_Contact Mobile"]     ${contact_mobile}
    #Contact E-mail
    Element Should Contain     //div[@id="tblCustomerInformation"]/table/tbody/tr[3]/td[2]    ${contact_email}
    #Project Name
    Element Should Contain     //td[@id="mouseArea_Project Name"]      ${project}
    ${text_project}=     Get Text    //td[@id="mouseArea_Project Name"]
    Should Be Equal    ${text_project}    ${project}
    #Account Name
    Wait Until Element Is Visible      //div[@id="tblCustomerInformation"]/table/tbody/tr[2]/td[4][contains(text(), "${account_name}")]
    ${get_account}=     Get Text       //div[@id="tblCustomerInformation"]/table/tbody/tr[2]/td[4]
    Should Be Equal   ${get_account}   ${account_name}
    #####################################################################################################
    #Production Informatin
    #####################################################################################################
    #Serial Name
    Element Should Contain              //div[@id="tblProductInformation"]/table/tbody/tr[1]/td[2]         ${suite}
    ${get_serial}=      Get Text        //div[@id="tblProductInformation"]/table/tbody/tr[1]/td[2]
    Should Be Equal      ${get_serial}  ${suite}
    #Product Name
    ${prod_suite}=      Strip String    ${product_suite}${SPACE}
    Element Should Contain       //div[@id="tblProductInformation"]/table/tbody/tr[1]/td[4]/a    ${prod_suite}

    #Product Brand
    Element Should Contain       //div[@id="tblProductInformation"]/table/tbody/tr[2]/td[2]   ${brand_suite}

    #Product Model
    Element Should Contain        //div[@id="tblProductInformation"]/table/tbody/tr[2]/td[4]      ${model_suite}

    #Delivery Date
    ${replace}=     Replace String   ${delivery_date}   /   -
    Element Should Contain        //div[@id="tblProductInformation"]/table/tbody/tr[3]/td[2]  ${replace}
    ${get_delivery_date}=       Get Text    //div[@id="tblProductInformation"]/table/tbody/tr[3]/td[2]
    Log     ${get_delivery_date}

    #Warranty
    Element Should Contain        //div[@id="tblProductInformation"]/table/tbody/tr[3]/td[4]    ${warranty}
    ${get_warranty}=    Get Text  //div[@id="tblProductInformation"]/table/tbody/tr[3]/td[4]
    Log  ${get_warranty}

    #Warranty Active Date
    ${replace}=     Replace String   ${warranty_active_date}   /   -
    Element Should Contain                  //div[@id="tblProductInformation"]/table/tbody/tr[4]/td[2]  ${replace}
    ${get_warranty_active}=     Get Text    //div[@id="tblProductInformation"]/table/tbody/tr[4]/td[2]
    Log     ${get_warranty_active}
    #Check Product Date
    ${replace}=     Replace String   ${check_product_date}   /   -
    Element Should Contain              //div[@id="tblProductInformation"]/table/tbody/tr[4]/td[4]  ${replace}
    ${get_check_product}=   Get Text    //div[@id="tblProductInformation"]/table/tbody/tr[4]/td[4]
    Log         ${get_check_product}
    #Warranty Active Date
    ${replace}=     Replace String   ${warranty_expired_date}   /   -
    Element Should Contain              //div[@id="tblProductInformation"]/table/tbody/tr[5]/td[2]    ${replace}
    ${get_expired_date}=    Get Text    //div[@id="tblProductInformation"]/table/tbody/tr[5]/td[2]
    Log     ${get_expired_date}
    #Sent Product Date
    ${replace}=     Replace String   ${sent_product_date}   /   -
    Element Should Contain              //div[@id="tblProductInformation"]/table/tbody/tr[5]/td[4]      ${replace}
    ${get_check_product}=   Get Text    //div[@id="tblProductInformation"]/table/tbody/tr[5]/td[4]
    Log    ${get_check_product}

Verify Tabulated Case Results
    [Arguments]
    Click Button To Create Page     ${SEARCH_STRING}
    Input Text To Search    ${convert}
    Select Option From Dropdown List    ${DROPDOWN_SEARCH_LOC}  ${CASE_NO_LOC}
    Click Search Button