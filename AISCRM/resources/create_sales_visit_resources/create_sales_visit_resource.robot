*** Variables ***
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
${LEAD_DROPDOWN}            Lead No
${ACCOUNT_HEADER}           Accounts
${LEAD_HEADER}              Leads
${OBJECTIVE_SELECT}         //option[@value="${OBJECTIVE_STRING}"]
${START_DATE_LOCATOR}       //input[@name="date_start"]
${STATUS_LOCATOR}           //option[@value="${STATUS_STRING}"]

${ACCOUNT_POPUP_WINDOW}     //td[@class="moduleName"][contains(text(), 'Accounts')]
${EMAIL_TEXT_LOCATOR}       id:email
${TIME_START_LOCATOR}       //tbody/tr[4]/td/span/input[1]         #this is a start time locator
${TIME_END_LOCATOR}         //tbody/tr[5]/td[4]/span/input[1]      #this is an end time locator
${ADD_CONTACT_NAME}         //table/tbody/tr[6]/td[4]/table/tbody/tr/td[2]/img     #this is a contact button.opens new window
${ADD_PROJECT_NAME}         //tr[9]//td[4]//table[1]//tbody[1]//tr[1]//td[3]//img[1]    #this is a project button.open new window
${CONTACT_LIST_LOCATOR}     //a[@href="javascript:window.close();"][contains(text(), '${FIRST_NAME_STRING}')]
${DEPARTMENT_LOCATOR}       id:con_department
${POSITION_LOCATOR}         id:con_position
${PHONE_LOCATOR}            id:phone
${MOBILE_LOCATOR}           id:mobile
${ADD_LEAD_NAME}            //tr[10]//td[4]//table[1]//tbody[1]//tr[1]//td[3]//img[1]   #this is adding lead information button
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
${ADD_IMAGE_BUTTON}         //input[@value="Add Image"]
${CHOOSE_FILE_BUTTON}       //form[@id="frmUpload"]
${ACCOUNT_CLEAR_BUTTON}     //td[@class='showPanelBg']//td[2]//table[1]//tbody[1]//tr[1]//td[3]//input[1]                  #this is an clear button of add account
${ADD_ACCOUNT_NAME}         //table/tbody/tr[7]/td[2]/table/tbody/tr/td[2]/img     #this is an add account button.opens new window
${CONTACT_CLEAR_BUTTON}     //td[4]//table[1]//tbody[1]//tr[1]//td[3]//input[1]
${PROJECT_CLEAR_BUTTON}     //tr[9]//td[4]//table[1]//tbody[1]//tr[1]//td[4]//input[1]
${LEAD_CLEAR_BUTTON}        //tr[10]//td[4]//table[1]//tbody[1]//tr[1]//td[4]//input[1]
${ACCOUNT_VALUE}            account_name
${CONTACT_VALUE}            contact_name
${PROJECT_VALUE}            project_no
${LEAD_VALUE}               lead_name
##############################################
#  VERIFICATION LOCATORS
##############################################
${OBJECTIVE_VERIFY_LOCATOR}     //font[contains(text(), "${OBJECTIVE_STRING}")]
${STATUS_VERIFY_LOCATOR}        //font[contains(text(), '${STATUS_STRING}')]
${ACCOUNT_NAME_VERIFY_LOCATOR}  //td[contains(text(), '${ACCOUNT_SEARCH_STRING}')]
${ASSIGNED_TO_VERIFY_LOCATOR}   //td[contains(text(), '${ASSIGNED_TO}')]
${TIME_START_VERIFY_LOCATOR}    //td[contains(text(), '${TIME_START_STRING}')]
${TIME_END_VERIFY_LOCATOR}      //td[contains(text(), '${TIME_END_STRING}')]
${PLAN_DETAIL_VERIFY_LOCATOR}   //div[@id='tblStep1PlanInformation']//tr[1]//td[2]
${LEAD_VERIFY_LOCATOR}          //td[contains(text(), '${CUSTOMER_NAME_STRING}')]            #Not
${REPORT_VERIFY_LOCATOR}        //div[@id='tblStep2ReportInformation']//tr[1]//td[2]      #Not
${REMAINING_VERIFY_LOCATOR}     //div[@id='tblStep2ReportInformation']//tr[2]//td[2]   #Not
${COMPETITOR_VERIFY_LOCATOR}    //div[@id='tblStep3OtherInformation']//tr[1]//td[2]  #Not
${REMARK_VERIFY_LOCATOR}        //div[@id='tblStep3OtherInformation']//tr[2]//td[2]    #Not
${START_DATE_VERIFY_LOCATOR}    //div[@id='tblSalesVisitInfomation']//tr[2]//td[2]
${END_DATE_VERIFY_LOCATOR}       //body[@class='small']//tr//tr//tr//tr//tr//tr[3]//td[2]
${EMAIL_VERIFY_LOCATOR}         //a[contains(text(), '${EMAIL_TEXT_STRING}')]   #Not
${CONTACT_NAME_VERIFY_LOCATOR}  //a[contains(text(), '${FIRST_NAME_STRING}')]
${PHONE_VERIFY_LOCATOR}         //span[@id="dtlview_Phone"][contains(text(),'${PHONE_STRING}')]  # Not
${MOBILE_VERIFY_LOCATOR}        //span[@id="dtlview_Mobile"][contains(text(),'${MOBILE_STRING}')]  # Not
${DEPT_VERIFY_LOCATOR}          //span[@id="dtlview_Department"][contains(text(), '${DEPARTMENT_STRING}')]  #Not
${POSITION_VERIFY_LOCATOR}      //span[@id="dtlview_Position"][contains(text(), '${POSITION_STRING}')]  #Not
${PROJECT_NAME_LOCATOR}          //td[@id="mouseArea_Project Name"]/a[contains(text(), '${PROJECT_NAME_STRING}')]
${COMMENT_VERIFY_LOCATOR}       //div[@class="dataField"][contains(text(), '${COMMENT_STRING}')]
${CHOOSE_FILE_BUTTON}           id:frmUpload



*** Keywords ***

Select Sales Menu
    Wait Until Element Is Visible       ${HEADER_MENU_LOCATOR}
    Click Link       ${HEADER_MENU_LOCATOR}
    Wait Until Element Is Visible   ${SALES_VISIT_DROPDOWN_LOCATOR}
    Click Link   ${SALES_VISIT_DROPDOWN_LOCATOR}

Select Sales Visit Schedule Tab
    [Arguments]         ${sched}
    ${selected}=    Run Keyword And Return Status   Wait Until Element Is Visible       //td/a[contains(text(), '${sched}')]
    Run Keyword If      ${selected}       Click Element     //td/a[contains(text(), '${sched}')]

View Sales Visit Form
    Wait Until Element Is Visible       ${SALES_VISIT_TAB}
    Mouse Over      ${CAL_ADD_BUTTON}
    #Scroll Down Page From The Browser
    #Scroll Element Into View    ${SALES_VISIT_OPTION}
    Execute Javascript      window.scrollTo(0,document.body.scrollHeight)
    Click Link   ${SALES_VISIT_OPTION}
    Log     Successfully entered ${OBJECTIVE_STRING}


Start And End Date Informations
    Wait Until Element Is Visible   ${OBJECTIVE_SELECT}
    Press Keys      ${START_DATE_LOCATOR}       CTRL+a+DELETE
    Input Text      ${START_DATE_LOCATOR}   ${START_DATE_STRING}
    Click Element   ${STATUS_LOCATOR}


Adding Account Information
    Click Element   ${ADD_ACCOUNT_NAME}
    Select Window   NEW              #To Focus Pop up Browser Window
    Verify Pop-up Window Header      ${ACCOUNT_HEADER}
    Verify and Set Drop Down From Search    ${ACCOUNT_OPTION_STRING}
    Input Text To Search    ${ACCOUNT_SEARCH_STRING}
    Click Search Button
    Select The List Found   ${ACCOUNT_SEARCH_STRING}
    Select Window              #To Focus back the main browser window

Verify Added Account Information
    Verify Added Information        ${ACCOUNT_SEARCH_STRING}        ${ACCOUNT_VALUE}



Verify Erased Account Information
    Verify Deleted Information     ${ACCOUNT_VALUE}

Start Time and End Time Information
    [Documentation]     Time Start and End Time Settings
    Press Keys      ${TIME_END_LOCATOR}        CTRL+a+DELETE
    Input Text      ${TIME_END_LOCATOR}     ${TIME_END_STRING}
    Press Keys      ${TIME_START_LOCATOR}       CTRL+a+DELETE
    Input Text      ${TIME_START_LOCATOR}       ${TIME_START_STRING}

Adding Contact Name Information
    [Documentation]     This is start from Adding Contact Name
    Click Element   ${ADD_CONTACT_NAME}
    Select Window   NEW                 #To Focus Pop up Browser Window
    Verify Pop-up Window Header   ${ACCOUNT_HEADER}
    Verify and Set Drop Down From Search        ${FIRST_NAME_OPTION_STRING}
    Input Text To Search    ${FIRST_NAME_STRING}
    Click Search Button
    Select The List Found       ${FIRST_NAME_STRING}
    Select Window

Verify Added Contact Information
    [Documentation]     Contact Name Verification
    Verify Added Information        ${FIRST_NAME_STRING} ${LAST_NAME_STRING}      ${CONTACT_VALUE}

Verify Erased Contact Information
    [Documentation]     Contact Deleted Information
    Verify Deleted Information      ${CONTACT_VALUE}

Email Address Information
    [Documentation]     This is Valid Email Address
    Input Text      ${EMAIL_TEXT_LOCATOR}       ${EMAIL_TEXT_STRING}
    #Should Not Be Empty     ${EMAIL_TEXT_STRING}

Department Information
    [Documentation]     Department Information
    Input Text      ${DEPARTMENT_LOCATOR}       ${DEPARTMENT_STRING}
    #Should Not Be Empty     ${DEPARTMENT_STRING}

Position Information
    [Documentation]     Position Information
    Input Text      ${POSITION_LOCATOR}     ${POSITION_STRING}
    #Should Not Be Empty     ${POSITION_STRING}

Adding Project Information
    [Documentation]     Project Name Information
    Click Element       ${ADD_PROJECT_NAME}
    Select Window       NEW
    Verify Pop-up Window Header     ${ACCOUNT_HEADER}
    Verify and Set Drop Down From Search    ${PROJECT_DROP_DOWN}
    Input Text To Search  ${PROJECT_NAME_STRING}
    Click Search Button
    Select The List Found   ${PROJECT_NAME_STRING}
    Select Window

Verify Added Project Information
    [Documentation]     Project Name verification
    Verify Added Information        ${PROJECT_NAME_STRING}      ${PROJECT_VALUE}

Verify Erased Project Information
    [Documentation]     Deleted Project Name Verification
    Verify Deleted Information     ${PROJECT_VALUE}

Adding Lead Information
    [Documentation]     Lead Information
    Click Element       ${ADD_LEAD_NAME}
    Select Window       NEW
    Verify Pop-up Window Header     ${LEAD_HEADER}
    Verify and Set Drop Down From Search        ${LEAD_DROPDOWN}
    Input Text To Search        ${LEAD_STRING}
    Click Search Button
    Select The List Found       ${LEAD_STRING}
    Select Window

Verify Added Lead Information
    [Documentation]     Added Lead Information
    Verify Added Information        ${CUSTOMER_NAME_STRING}      ${LEAD_VALUE}

Verify Erased Lead Information
    [Documentation]     Deleted Lead Information
    Verify Deleted Information      ${LEAD_VALUE}

Phone And Mobile Contacts Information
    [Documentation]   Phone And Mobile Contacts Information
    ${contacts}=    Run Keyword And Return Status       Element Should Be Visible   ${PHONE_LOCATOR}
    Run Keyword If      ${contacts}     Pag
    Input Text      ${PHONE_LOCATOR}    ${PHONE_STRING}
    Input Text      ${MOBILE_LOCATOR}   ${MOBILE_STRING}

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

Verify All Fields Informations
    [Documentation]     To verify the created required informations
    #Objective
    Element Should Contain      ${OBJECTIVE_VERIFY_LOCATOR}         ${OBJECTIVE_STRING}

    #Start Date
    Element Should Contain      ${START_DATE_VERIFY_LOCATOR}        ${START_DATE_STRING}

    #End Date
    Element Should Contain      ${END_DATE_VERIFY_LOCATOR}          ${START_DATE_STRING}
    #Status
    Element Should Contain      ${STATUS_VERIFY_LOCATOR}            ${STATUS_STRING}
    #Account name
    Element Should Contain      ${ACCOUNT_NAME_VERIFY_LOCATOR}      ${ACCOUNT_SEARCH_STRING}
    #Email
    Element Should Contain      ${EMAIL_VERIFY_LOCATOR}             ${EMAIL_TEXT_STRING}
    #Phone
    Element Should Contain      ${PHONE_VERIFY_LOCATOR}             ${PHONE_STRING}
    #Mobile
    Element Should Contain      ${MOBILE_VERIFY_LOCATOR}            ${MOBILE_STRING}
    #Time Start
    Element Should Contain      ${TIME_START_VERIFY_LOCATOR}        ${TIME_START_STRING}
    #Time End
    Element Should Contain      ${TIME_END_VERIFY_LOCATOR}          ${TIME_END_STRING}
    #Contact Name
    Element Should Contain      ${CONTACT_NAME_VERIFY_LOCATOR}      ${FIRST_NAME_STRING}
    #Department
    Element Should Contain      ${DEPT_VERIFY_LOCATOR}              ${DEPARTMENT_STRING}
    #Position
    Element Should Contain      ${POSITION_VERIFY_LOCATOR}          ${POSITION_STRING}
    #Project
    Element Should Contain      ${PROJECT_NAME_LOCATOR}              ${PROJECT_NAME_STRING}
    ${today}=       Get Current Date    result_format=%d-%m-%Y %H:%M
    #Modified Time
    Element Should Contain      //tr[8]//td[4][contains(text(), '${today}')]  ${today}
    #Created Time
    Element Should Contain      //tr[9]//td[2][contains(text(), '${today}')]    ${today}
    #Comment
    Element Should Contain      ${COMMENT_VERIFY_LOCATOR}       ${COMMENT_STRING}
    ${today}=   Get Current Date    result_format=%Y-%m-%d %H:%M
    Element Should Contain      //div[@class="dataLabel"]/font[contains(text(), ': ${USER} on ${today}')]
    ...         : ${USER} on ${today}
    #Plan Detail
    Element Should Contain      ${PLAN_DETAIL_VERIFY_LOCATOR}       ${PLAN_DETAIL_STRING}
    Element Should Contain      ${REPORT_VERIFY_LOCATOR}            ${REPORT_STRING}
    Element Should Contain      ${REMAINING_VERIFY_LOCATOR}         ${REMAINING_STRING}
    Element Should Contain      ${COMPETITOR_VERIFY_LOCATOR}        ${COMPETITOR_STRING}
    Element Should Contain      ${REMARK_VERIFY_LOCATOR}            ${REMARK_STRING}


Click Add Image Button
    Scroll Down Page From The Browser
    Click Button    Add Image
    Click Button    ${CHOOSE_FILE_BUTTON}







