*** Settings ***
Documentation   This is the script for Create Sales Visit Repository
Library     Selenium2Library
Library     OperatingSystem
#Library     String
Resource        ../../common_resources/web_common.robot
Resource        create_sales_visit_form/create_sales_visit_variables.robot
Suite Setup     Open Chrome Browser
#Suite Teardown  Close Browser




*** Test Cases ***
AIS-CRM Website
    [Tags]      AIS-CRM SITE
    Launch AIS-CRM site

Log-In User with Valid Username And Password
    [Tags]  User credentials
    Log-in Username and Password

Selecting Sales Menu Header
    Select Sales Menu

Selecting Schedule Tab
    Select Sales Visit Schedule Tab      VISIT       ${SCHEDULE_STRING}

Entering Sales Visit Form
    View Sales Visit Form


Entering Sales Visit Informations
    Sales Visit Information

Entering Plan Informations
    Plan Information

Entering Report Informations
    Report Information

Entering Other Informations
    Other Information

Save Created Sales Visit Data
    No Alert Should Be Found
    Click Save Button






*** Variables ***
${URL}                      http://aisystem.dyndns.biz:8090/aistcrm_uat/index.php?module=Users&action=Logout
${SIGN_IN_TEXT}             //input[@class="save"]
${LOGIN_FORM}               //div[@class="login-form"]
${HEADER_MENU_STRING}       Sales
${HEADER_MENU_LOCATOR}      //td[@class="tabUnSelected"]/a[contains(text(), '${HEADER_MENU_STRING}')]
${SALES_VISIT_STRING}               Sales Visit
${SALES_VISIT_DROPDOWN_LOCATOR}     //a[contains(text(), '${SALES_VISIT_STRING}')]
${SALES_VISIT_TAB}                  //td[@class="dvtSelectedCell"][contains(text(), '${SALES_VISIT_STRING}')]
${CAL_ADD_BUTTON}           //td[@class="calAddButton"]
${SALES_VISIT_OPTION}       //a[@id="add${OBJECTIVE_STRING}"]

${SCHEDULE_LOCATOR}         //td[@class="calUnSel"]/a[contains(text(), '${SCHEDULE_STRING}')]
${SAVE_BUTTON_LOCATOR}      //input[@title="Save [Alt+S]"]
##########################
#SALES VISIT INFORMATIONS
##########################
${ACCOUNT_OPTION_STRING}    Account Name
${FIRST_NAME_OPTION_STRING}     First Name
${PROJECT_DROP_DOWN}      Project Name
${ACCOUNT_HEADER}           Accounts
${OBJECTIVE_SELECT}         //option[@value="${OBJECTIVE_STRING}"]
${START_DATE_LOCATOR}       //input[@name="date_start"]
${STATUS_LOCATOR}           //option[@value="${STATUS_STRING}"]
${ADD_ACCOUNT_NAME}         //table/tbody/tr[7]/td[2]/table/tbody/tr/td[2]/img     #this is an add account button.opens new window
${ACCOUNT_POPUP_WINDOW}     //td[@class="moduleName"][contains(text(), 'Accounts')]
${EMAIL_TEXT_LOCATOR}       id:email
${TIME_START_LOCATOR}       //tbody/tr[4]/td/span/input[1]         #this is a start time locator
${TIME_END_LOCATOR}         //tbody/tr[5]/td[4]/span/input[1]      #this is an end time locator
${ADD_CONTACT_NAME}         //table/tbody/tr[6]/td[4]/table/tbody/tr/td[2]/img     #this is a contact button.opens new window
${ADD_PROJECT_NAME}         //tr[9]//td[4]//table[1]//tbody[1]//tr[1]//td[3]//img[1]    #this is a project button.open new window
${CONTACT_LIST_LOCATOR}     //a[@href="javascript:window.close();"][contains(text(), '${CONTACT_LIST_STRING}')]
${DEPARTMENT_LOCATOR}       id:con_department
${POSITION_LOCATOR}         id:con_position
${PHONE_LOCATOR}            id:phone
${MOBILE_LOCATOR}           id:mobile
############################################
# PLAN INFORMATION LOCATORS
############################################
${PLAN_DETAIL_LOCATOR}      id:description
${COMMENT_PLAN_LOCATOR}     id:commentplan
############################################
# REPORT INFORMATION LOCATORS
############################################
${REPORT_LOCATOR}           id:sale_report
${REMAINING_LOCATOR}        id:sale_remaining
##############################################
# OTHER INFORMATION LOCATORS
##############################################
${COMPETITOR_LOCATOR}       id:competitors
${REMARK_LOCATOR}           id:sale_remark

*** Keywords ***

Launch AIS-CRM site
    Go to   ${URL}
    Get Title
    Title Should Be         MOAI-CRM - The Premium CRM Solution


Log-in Username and Password
    Wait Until Element Is Visible       ${LOGIN_FORM}
    Input Text      name:user_name  ruel.arb    clear=True
    Input Password  name:user_password  moaicrm     clear=True
    Click Element    ${SIGN_IN_TEXT}
    Log      Successfully logged-in
    Log To Console  Successfully logged-in

Select Sales Menu
    Wait Until Element Is Visible       ${HEADER_MENU_LOCATOR}
    Click Link       ${HEADER_MENU_LOCATOR}
    Wait Until Element Is Visible   ${SALES_VISIT_DROPDOWN_LOCATOR}
    Click Link   ${SALES_VISIT_DROPDOWN_LOCATOR}

Select Sales Visit Schedule Tab
    [Arguments]     ${duration}     ${sched}
    Run Keyword If  '${duration}'=='True'    Click Element   //td/a[contains(text(), '${sched}')]
    Run Keyword If  '${duration}'=='True'       Click Element   //td[contains(text(), '${sched}')]

View Sales Visit Form
    Wait Until Element Is Visible       ${SALES_VISIT_TAB}
    Mouse Over      ${CAL_ADD_BUTTON}
    Click Link   ${SALES_VISIT_OPTION}
    Log     Successfully entered ${OBJECTIVE_STRING}
    Log To Console      \nSuccessfull entered ${OBJECTIVE_STRING}


Sales Visit Information
    Wait Until Element Is Visible   ${OBJECTIVE_SELECT}
    Press Keys      ${START_DATE_LOCATOR}       CTRL+a+DELETE
    Input Text      ${START_DATE_LOCATOR}   ${START_DATE_STRING}
    Click Element   ${STATUS_LOCATOR}
    Log To Console      \nSuccessfully entered ${START_DATE_STRING}

    ################### This is start from Adding Account Name#####################################
    Click Element   ${ADD_ACCOUNT_NAME}
    Select Window   NEW              #To Focus Pop up Browser Window
    Verify Pop-up Window Header      ${ACCOUNT_HEADER}
    Verify and Set Drop Down From Search    ${ACCOUNT_OPTION_STRING}
    Input Text To Search    ${ACCOUNT_SEARCH_STRING}
    Click Search Button
    Select The List Found   ${ACCOUNT_SEARCH_STRING}
    Select Window              #To Focus back the main browser window
    Log To Console     \nSuccessfully entered ${ACCOUNT_SEARCH_STRING}

    ################## This is end from Start and End Time Account Name###################
    Press Keys      ${TIME_END_LOCATOR}        CTRL+a+DELETE
    Input Text      ${TIME_END_LOCATOR}     ${TIME_END_STRING}
    Press Keys      ${TIME_START_LOCATOR}       CTRL+a+DELETE
    Input Text      ${TIME_START_LOCATOR}       ${TIME_START_STRING}
    Log To Console  \nSuccessfully entered ${TIME_END_STRING}
    Log To Console  \nSuccessfully entered ${TIME_START_STRING}

    ################## This is start from Adding Contact Name###########################
    Click Element   ${ADD_CONTACT_NAME}
    Select Window   NEW                 #To Focus Pop up Browser Window
    Verify Pop-up Window Header   ${ACCOUNT_HEADER}
    Verify and Set Drop Down From Search        ${FIRST_NAME_OPTION_STRING}
    Input Text To Search    ${CONTACT_LIST_STRING}
    Click Search Button
    Select The List Found       ${CONTACT_LIST_STRING}
    Select Window
    Log To Console      \nSuccessfully entered ${CONTACT_LIST_STRING}

    ##################This is Email Textfield############################################
    Input Text      ${EMAIL_TEXT_LOCATOR}       ${EMAIL_TEXT_STRING}        clear=True
    Log To Console  \nSuccessfully entered ${EMAIL_TEXT_STRING}

    ##################This is Department Textfield####################################
    Input Text      ${DEPARTMENT_LOCATOR}       ${DEPARTMENT_STRING}        clear=True
    Log To Console  \nSuccessfully entered ${DEPARTMENT_STRING}

    ##################This is Position Textfield#########################################
    Input Text      ${POSITION_LOCATOR}     ${POSITION_STRING}      clear=True
    Log To Console  \nSuccessfully entered ${POSITION_STRING}

    ###################This is Project name field########################################
    Click Element       ${ADD_PROJECT_NAME}
    Select Window       NEW
    Verify Pop-up Window Header     ${ACCOUNT_HEADER}
    Verify and Set Drop Down From Search    ${PROJECT_DROP_DOWN}
    Input Text To Search  ${PROJECT_NAME_STRING}
    Click Search Button
    Select The List Found   ${PROJECT_NAME_STRING}
    Select Window
    Log To Console  \Successfully entered ${PROJECT_NAME_STRING}

    ###################This is Phone and Mobile textfield#####################################
    #Input Text      ${PHONE_LOCATOR}    ${PHONE_STRING}
    #Input Text      ${MOBILE_LOCATOR}   ${MOBILE_STRING}

Plan Information
    Input Text      ${PLAN_DETAIL_LOCATOR}      ${PLAN_DETAIL_STRING}
    Input Text      ${COMMENT_PLAN_LOCATOR}     ${COMMENT_STRING}

Report Information
    Input Text      ${REPORT_LOCATOR}       ${REPORT_STRING}
    Input Text      ${REMAINING_LOCATOR}    ${REMAINING_STRING}

Other Information
    Input Text      ${COMPETITOR_LOCATOR}       ${COMPETITOR_STRING}
    Input Text      ${REMARK_LOCATOR}           ${REMARK_STRING}






Verify Pop-up Window Header
    [Arguments]     ${header}
    Wait Until Element Is Visible   //td[@class="moduleName"][contains(text(), '${header}')]

Verify and Set Drop Down From Search
    [Arguments]  ${dropdown}
    Click Element       //select[@name="search_field"]//option[@label="${dropdown}"]

Input Text To Search
    [Arguments]     ${search_text}
    Input Text      name:search_text     ${search_text}

Click Search Button
    Click Element       name:search

Select The List Found
    [Arguments]     ${found_list}
    Click Link      //a[contains(text(), '${found_list}')]

Click Save Button
    Click Element   ${SAVE_BUTTON_LOCATOR}

No Alert Should Be Found
    Alert Should Not Be Present
