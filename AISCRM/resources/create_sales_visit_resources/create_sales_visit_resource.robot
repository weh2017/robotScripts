*** Variables ***
${IMAGE_PATH}               C://Users/ruela/Documents/robotScripts/AISCRM/resources/images
#${IMAGE_PATH}               D://my_files/Robot_Framework/robotScripts/AISCRM/resources/images
${SIGN_IN_TEXT}             //input[@class="save"]
${LOGIN_FORM}               //div[@class="login-form"]
${HEADER_MENU_STRING}       Sales
${SALES_VISIT_STRING}               Sales Visit
${SALES_VISIT_TAB}                  //td[@class="dvtSelectedCell"][contains(text(), '${SALES_VISIT_STRING}')]
${CAL_ADD_BUTTON}           //td[@class="calAddButton"]
${SALES_VISIT_OPTION}       //a[@id="add${OBJECTIVE_STRING}"]
${SCHEDULE_LOCATOR}         //td[@class="calUnSel"]/a[contains(text(), '${SCHEDULE_STRING}')]
${SAVE_BUTTON_LOCATOR}      //input[@title="Save [Alt+S]"]
${NO_IMAGE_UPLOAD_LOCATOR}      link:include/images/noimage.gif
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
${ADD_PROJECT_NAME}         //td[@class='showPanelBg']//td[2]//table[1]//tbody[1]//tr[1]//td[3]//img[1]   #this is a project button.open new window
${CONTACT_LIST_LOCATOR}     //a[@href="javascript:window.close();"][contains(text(), '${FIRST_NAME_STRING}')]
${DEPARTMENT_LOCATOR}       id:con_department
${POSITION_LOCATOR}         id:con_position
${PHONE_LOCATOR}            id:phone
${MOBILE_LOCATOR}           id:mobile
${ADD_LEAD_NAME}            //td[4]//table[1]//tbody[1]//tr[1]//td[3]//img[1]   #this is adding lead information button
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
${PROJECT_CLEAR_BUTTON}     //td[@class='showPanelBg']//td[2]//table[1]//tbody[1]//tr[1]//td[4]//input[1]
${LEAD_CLEAR_BUTTON}        //td[4]//table[1]//tbody[1]//tr[1]//td[4]//input[1]
${ACCOUNT_VALUE}            account_name
${CONTACT_VALUE}            contact_name
${PROJECT_VALUE}            project_no
${LEAD_VALUE}               lead_name
##############################################
#  VERIFICATION LOCATORS
##############################################
${ASSIGNED_TO_VERIFY_LOCATOR}   //td[contains(text(), '${ASSIGNED_TO}')]
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
${UPLOAD_FILE_BUTTON}           //input[@type="file"]
${CHOOSE_FILE_BUTTON}           //form[@id="frmUpload"]
${END_TIME_WARN_MSG}            //div[contains(text(), 'End time is more than the start time.')]
${WARN_OK_BTN}                  //span[@class="l-btn-text"][contains(text(), 'Ok')]
${FILE_UPLOAD_CONFIRMATION}     //div[contains(text(), 'อัพโหลดไฟล์สำเร็จ')]
${UPLOAD_OK_BUTTON}             //span[@class="l-btn-text"][contains(text(), 'OK')]
##################################
#  CONTACT NAME OTHER
##################################
${CONTACT_NAME_OTHER_LOCATOR}    id:contactnameother



*** Keywords ***

Perform Create Sales Visit All Informations
    [Documentation]     This function is to call the csv file and distribute the contents.
    [Arguments]         ${data}     ${csv}
    ${contents}=    Get File        ${csv}
    @{read}=    Create List     ${contents}
    @{lines}=   Split To Lines      @{read}     1
    :FOR    ${line}     IN      @{lines}
    \   ${current_date}=   Get Current Date    result_format=%H:%M:%S
    \   ${end_variable}=   Set Variable    ${current_date}
    \   ${adjust}=      Add Time To Time    ${end_variable}     1 hour
    \   ${add_convert}=     Convert Time    ${adjust}   Timer
    \   ${add_set}=     Set Variable    ${add_convert}
    \   ${add_split}=       Split String From Right     ${add_set}      :   max_split=1
    \   ${add_get}=     Get From List       ${add_split}    0
    \   Log     Adding Time ${add_get} without seconds
    \   ${adj_subtract}=    Subtract Time From Time     ${adjust}     1 hour
    \   ${sub_convert}=     Convert Time    ${adj_subtract}     Timer
    \   ${sub_set}=     Set Variable    ${sub_convert}
    \   ${sub_split}=   Split String From Right     ${sub_set}      :   max_split=1
    \   ${sub_get}=     Get From List   ${sub_split}        0
    \   Log     Subracting Time ${sub_get} without seconds
    ##########################################################################
    \   @{bm}=  Split String    ${line}     |
    # schedule
    \   ${schedule}=    Set Variable    @{bm}[0]
    # presentation
    \   ${objective}=    Set Variable    @{bm}[1]
    # start date
    \   ${start_date}=  Set Variable    @{bm}[2]
    # status
    \   ${status}=  Set Variable    @{bm}[3]
    #   Account name
    \   ${account}=   Set Variable    @{bm}[4]
    #   First Contact name
    \   ${contact_name}=    Set Variable    @{bm}[5]
    #   Project name
    \   ${project_name}=    Set Variable    @{bm}[6]
    #   Time Start
    \   ${subtract}=        Set Variable    ${sub_get}
#       End Time
    \   ${add}=             Set Variable       ${add_get}
    #   Plan Detail
    \   ${plan}=            Set Variable    @{bm}[9]
#    #   Contact Other Name
#    \   ${contact_other}=   Set Variable    @{bm}[10]
    #   Email
    \   ${email}=           Set Variable    @{bm}[10]
    #   Mobile
    \   ${mobile}=          Set Variable    @{bm}[11]
    #   Phone
    \   ${phone}=           Set Variable    @{bm}[12]
    #   Department
    \   ${department}=      Set Variable    @{bm}[13]
    #   Position
    \   ${position}=        Set Variable    @{bm}[14]
    #   Comment
    \   ${comment}=         Set Variable    @{bm}[15]
    #   Report
    \   ${report}=          Set Variable    @{bm}[16]
    #   Remaining
    \   ${remaining}=       Set Variable    @{bm}[17]
    #   Competitor
    \   ${competitor}=      Set Variable    @{bm}[18]
    #   Remark
    \   ${remark}=          Set Variable    @{bm}[19]
    #   Lead No
    \   ${lead_no}=         Set Variable    @{bm}[20]
    #   Lead name
    \   ${lead_name}=       Set Variable    @{bm}[21]
    #   Image file
    \   ${image}=           Set Variable    @{bm}[22]
    \   Run Keyword If  '${data}'=='ALL'    Navigate Creating Sales Visit All        ${schedule}  ${objective}
    ...             ${start_date}      ${status}   ${account}  ${contact_name}
    ...             ${project_name}    ${add}  ${subtract}    ${department}   ${position}     ${email}    ${plan}
    ...             ${comment}  ${report}       ${remaining}    ${remark}   ${competitor}     ${lead_no}    ${lead_name}    ${mobile}   ${phone}
    ...             ${image}
    \   Run Keyword If  '${data}'=='REQUIRE'   Navigate Creating Sales Visit Required      ${schedule}  ${objective}
    ...             ${start_date}    ${status}   ${account}  ${contact_name}
    ...             ${project_name}      ${add}   ${subtract}      ${plan}     ${comment}    ${image}
    \   Run Keyword If  '${data}'=='OPTION'     Navigate Creating Sales Visit Optional Fields    ${schedule}    ${objective}
    ...              ${comment}  ${report}   ${remaining}    ${remark}  ${account}
    ...              ${competitor}  ${department}   ${position}     ${email}    ${mobile}   ${phone}
    ...              ${lead_no}     ${lead_name}    ${contact_name}     ${project_name}     ${plan}     ${contact_other}  ${image}
##################################################################################################################
Navigate Creating Sales Visit All
    [Documentation]     All functions
    [Arguments]    ${schedule}  ${objective}    ${start_date}    ${status}   ${account}  ${contact_name}
    ...    ${project_name}      ${add}   ${subtract}   ${department}   ${position}     ${email}    ${plan}
    ...    ${comment}   ${report}       ${remaining}    ${remark}   ${competitor}       ${lead_no}      ${lead_name}    ${mobile}   ${phone}
    ...             ${image}
#    Select Menu     ${HEADER_MENU_STRING}
    Select Dropdown Option From Menu    ${SALES_VISIT_STRING}
    Select Sales Visit Schedule Tab     ${schedule}
    View Sales Visit Form       ${objective}
    Start And End Date Informations     ${start_date}   ${objective}
    Status Information      ${status}
    ############################################################
    Get Registered Username
    Adding Account Information     ${account}
    Verify Added Account Information        ${account}
    Click Erase Button      ${ACCOUNT_CLEAR_BUTTON}
    Verify Erased Account Information
    Adding Account Information     ${account}
#    Adding Contact Name Other Information       ${contact_other}
    Start Time Information                 ${subtract}
    End Time Information   ${add}
#    Sleep    2
    #############################################################
    Adding Contact Name Information     ${contact_name}
    Verify Added Contact Information    ${contact_name}
    Click Erase Button      ${CONTACT_CLEAR_BUTTON}
    Verify Erased Contact Information
    Adding Contact Name Information     ${contact_name}
    Verify Added Contact Information    ${contact_name}
#    Sleep   2
    ##############################################################
    Adding Project Information      ${project_name}
    Verify Added Project Information    ${project_name}
    Click Erase Button      ${PROJECT_CLEAR_BUTTON}
    Verify Erased Project Information
    Adding Project Information      ${project_name}
    Verify Added Project Information    ${project_name}
#    Sleep  2
    ###############################################################
    Adding Lead Information     ${lead_no}
    Verify Added Lead Information       ${lead_name}
    Click Erase Button      ${LEAD_CLEAR_BUTTON}
    Verify Erased Lead Information
    Adding Lead Information     ${lead_no}
    Verify Added Lead Information       ${lead_name}
#    Sleep  2
    ###################################################################
    Department Information      ${department}
    Position Information        ${position}
#    Email Domain Remove     ${email}
#    Click Save Button
#    Email Text Alert
    Email Address Information   ${email}
    Phone And Mobile Contacts Information       ${mobile}   ${phone}
    Plan Information        ${plan}
    Comment Information     ${comment}
    Report Information      ${report}
    Remaining Information   ${remaining}
    Remark Information      ${remark}
    Competitor Information      ${competitor}
    Click Save Button
    Verify All Fields Informations      ${objective}    ${start_date}   ${status}   ${account}  ${email}    ${phone}    ${mobile}
    ...     ${add}      ${subtract}  ${contact_name}    ${department}   ${position}     ${project_name}     ${lead_name}
    ...     ${comment}  ${plan}     ${report}   ${remaining}    ${competitor}   ${remark}
    Click Add Image Button      ${image}    ${account}  ${objective}    ${schedule}
    Check In Results Sales Visit Page       ${objective}     ${start_date}     ${add}    ${start_date}   ${subtract}
    ...         ${status}   ${account}  ${plan}
Navigate Creating Sales Visit Required
    [Documentation]     This Function is compiled with required informations only to automate.Other fields that do not
    ...     are ignored.
    [Arguments]    ${schedule}  ${objective}
    ...             ${start_date}    ${status}   ${account}  ${contact_name}
    ...             ${project_name}      ${add}   ${subtract}      ${plan}     ${comment}
    ...             ${image}
    #    Select Menu     ${HEADER_MENU_STRING}
    Select Dropdown Option From Menu    ${SALES_VISIT_STRING}
    Select Sales Visit Schedule Tab     ${schedule}
    View Sales Visit Form       ${objective}
    Start And End Date Informations     ${start_date}   ${objective}
    Status Information      ${status}
    ############################################################
    Get Registered Username
    Adding Account Information     ${account}
    Verify Added Account Information        ${account}
    Click Erase Button      ${ACCOUNT_CLEAR_BUTTON}
    Verify Erased Account Information
    Adding Account Information     ${account}
    Start Time Information                 ${subtract}
    End Time Information   ${add}
    Sleep    2
    #############################################################
    Adding Contact Name Information      ${contact_name}
    Verify Added Contact Information     ${contact_name}
    Click Erase Button      ${CONTACT_CLEAR_BUTTON}
    Verify Erased Contact Information
    Adding Contact Name Information      ${contact_name}
    Verify Added Contact Information     ${contact_name}

    Sleep   2
    ##############################################################
    Adding Project Information      ${project_name}
    Verify Added Project Information    ${project_name}
    Click Erase Button      ${PROJECT_CLEAR_BUTTON}
    Verify Erased Project Information
    Adding Project Information      ${project_name}
    Verify Added Project Information    ${project_name}
    Plan Information        ${plan}

    Sleep  2
    ###################################################################
    Click Save Button
    Verify Required Field Informations      ${objective}
    ...             ${start_date}    ${status}   ${account}  ${contact_name}
    ...             ${project_name}      ${add}   ${subtract}      ${plan}
    Click Add Image Button      ${image}    ${account}  ${objective}    ${schedule}
    Check In Results Sales Visit Page       ${objective}     ${start_date}     ${add}    ${start_date}   ${subtract}
    ...         ${status}   ${account}  ${plan}

Navigate Creating Sales Visit Optional Fields
    [Arguments]      ${schedule}    ${objective}    ${comment}  ${report}   ${remaining}    ${remark}   ${account}
    ...              ${competitor}  ${department}   ${position}     ${email}    ${mobile}   ${phone}
    ...              ${lead_no}     ${lead_name}    ${contact_name}     ${project_name}     ${plan}
    ...              ${image}
    Select Dropdown Option From Menu    ${SALES_VISIT_STRING}
    Select Sales Visit Schedule Tab     ${schedule}
    View Sales Visit Form       ${objective}
    Get Registered Username
    Comment Information     ${comment}
    Report Information      ${report}
    Remaining Information   ${remaining}
    Remark Information      ${remark}
    Competitor Information      ${competitor}
    Department Information      ${department}
    Position Information        ${position}
    Adding Lead Information     ${lead_no}
    Verify Added Lead Information       ${lead_name}
    Click Erase Button      ${LEAD_CLEAR_BUTTON}
    Verify Erased Lead Information
    Adding Lead Information     ${lead_no}
    Verify Added Lead Information       ${lead_name}
    #######################################################################
    Click Save Button
    Sleep  3
    Alert Message Should Be Found       Contact Name cannot be none
    Sleep  3
    #######################################################################
    Adding Account Information     ${account}
    Verify Added Account Information        ${account}
    Click Erase Button      ${ACCOUNT_CLEAR_BUTTON}
    Verify Erased Account Information
    Adding Account Information     ${account}
    #######################################################################
    Adding Contact Name Information     ${contact_name}
    Verify Added Contact Information    ${contact_name}
    Click Erase Button      ${CONTACT_CLEAR_BUTTON}
    Verify Erased Contact Information
    Adding Contact Name Information     ${contact_name}
    Verify Added Contact Information    ${contact_name}
    Click Save Button
    Sleep  3
    ########################################################################
    Alert Message Should Be Found       Project Name cannot be none
    Adding Project Information      ${project_name}
    Verify Added Project Information    ${project_name}
    Click Erase Button      ${PROJECT_CLEAR_BUTTON}
    Verify Erased Project Information
    Adding Project Information      ${project_name}
    Verify Added Project Information    ${project_name}
    ###########################################################################
    Click Save Button
    Sleep  3
    #######################################################################
    Alert Message Should Be Found   Plan Detail cannot be none
    ########################################################################
#    Adding Contact Name Other Information       ${contact_other}
    Phone And Mobile Contacts Information       ${mobile}   ${phone}
    Email Address Information   ${email}
    Department Information      ${department}
    Position Information        ${position}
    Plan Information        ${plan}
    Click Save Button
    Verify Optional Fields Informations     ${objective}    ${account}  ${phone}    ${mobile}    ${contact_name}   ${contact_name}     ${department}
    ...             ${position}     ${project_name}     ${lead_name}  ${comment}     ${report}  ${plan}
    ...             ${report}    ${remaining}   ${competitor}   ${remark}   ${email}
    Click Add Image Button      ${image}    ${account}  ${objective}    ${schedule}
    Check In Results Sales Visit Page       ${objective}     ${start_date}     ${add}    ${start_date}   ${subtract}
    ...         ${status}   ${account}  ${plan}

Select Sales Visit Schedule Tab
    [Arguments]         ${schedule}=${TRUE}
    Run Keyword If  "${schedule}"=="${TRUE}"       Click Element     //td[@class="calUnSel"]/a[contains(text(), '${schedule}')]
    Run Keyword If    "${schedule}"=="${TRUE}"     Wait Until Element Is Visible   //td[@class="calSel"][contains(text(), '${schedule}')]
    Log    ${schedule} has been selected

View Sales Visit Form
    [Arguments]     ${objective}
    Wait Until Element Is Visible       ${SALES_VISIT_TAB}
    Mouse Over      ${CAL_ADD_BUTTON}
    #Scroll Down Page From The Browser
    #Scroll Element Into View    ${SALES_VISIT_OPTION}
    Execute Javascript      window.scrollTo(0,document.body.scrollHeight)
    Click Link   //a[@id="add${objective}"]
    Log     Successfully entered ${objective}


Get Registered Username
    [Documentation]  This function is to check the registered username when creating the sales visit
    Verify Username Result

Start And End Date Informations
    [Arguments]     ${start_date}   ${objective}
    Wait Until Element Is Visible   //option[@value="${objective}"]
    Press Keys      ${START_DATE_LOCATOR}       CTRL+a+DELETE
    Input Text      ${START_DATE_LOCATOR}       ${start_date}
    Press Keys      ${START_DATE_LOCATOR}       TAB
    Alert Should Be Present     Date format is incorrect (dd-mm-yyyy)    action=ACCEPT
    Press Keys      ${START_DATE_LOCATOR}       CTRL+a+DELETE
    ${replace}=     Replace String    ${start_date}   /   -
    Input Text      ${START_DATE_LOCATOR}   ${replace}


Status Information
    [Documentation]     Plan, Cancel, Completed
    [Arguments]     ${status}
    Select Option From Dropdown List    eventstatus  ${status}


Adding Account Information
    [Arguments]     ${account}
    Click Element   ${ADD_ACCOUNT_NAME}
    Select Window   NEW              #To Focus Pop up Browser Window
    Verify Pop-up Window Header      ${ACCOUNT_HEADER}
    Verify and Set Drop Down From Search    ${ACCOUNT_OPTION_STRING}
    Input Text To Search    ${account}
    Click Search Button
    Select The List Found   ${account}
    Select Window              #To Focus back the main browser window

Verify Added Account Information
    [Arguments]     ${account}
    Verify Added Information        ${account}        ${ACCOUNT_VALUE}

Verify Erased Account Information
    [Documentation]     Erased the specific value from account field
    Verify Deleted Information     ${ACCOUNT_VALUE}

Start Time Information
    [Arguments]     ${subtract}
    Press Keys      ${TIME_START_LOCATOR}       CTRL+a+DELETE
    Input Text      ${TIME_START_LOCATOR}       ${subtract}

End Time Information
    [Documentation]     Time Start and End Time Settings
    [Arguments]                ${add}
    ${current_date}=   Get Current Date    result_format=%H:%M:%S
    Log     ${current_date}
    ${set_var}=     Set Variable    ${current_date}
    ${subtract}=    Subtract Time From Time     ${set_var}      1 hour  #exlude_millis=true
    ${convert}=     Convert Time    ${subtract}     Timer
    ${set}=     Set Variable    ${convert}
    ${split}=   Split String From Right     ${set}  :   max_split=1
    ${list}=    Get From List   ${split}    0
    Log     ${list}
    Press Keys      ${TIME_END_LOCATOR}        CTRL+a+DELETE
    Input Text      ${TIME_END_LOCATOR}         ${list}
    Press Keys      ${TIME_END_LOCATOR}         ENTER
    Sleep  2
    ${warning}=     Run Keyword And Return Status   Wait Until Element Is Visible   ${END_TIME_WARN_MSG}
    Run Keyword If   ${warning}   Run Keywords    Click Element       ${WARN_OK_BTN}
    ...     AND     Wait Until Element Is Not Visible   ${END_TIME_WARN_MSG}
    Sleep   2
    Press Keys      ${TIME_END_LOCATOR}        CTRL+a+DELETE
    Input Text      ${TIME_END_LOCATOR}         ${add}


Adding Contact Name Information
    [Documentation]     This is start from Adding Contact Name
    [Arguments]     ${contact_name}
    Click Element   ${ADD_CONTACT_NAME}
    Select Window   NEW                 #To Focus Pop up Browser Window
#    Verify Pop-up Window Header   ${ACCOUNT_HEADER}
    Verify and Set Drop Down From Search        ${FIRST_NAME_OPTION_STRING}
    ${right}=   Split String From Right    ${contact_name}  -
    ${remove}=      Set Variable   ${right}[0]
    ${space_right}=   Split String From Right     ${remove}   ${SPACE}
    ${right}=   Set Variable    ${space_right}[0]
    Input Text To Search    ${right}
    Click Search Button
    Select The List Found       ${right}
    Select Window

Verify Added Contact Information
    [Documentation]     Contact Name Verification
    [Arguments]     ${contact_name}
    Verify Added Information        ${contact_name}         ${CONTACT_VALUE}

Verify Erased Contact Information
    [Documentation]     Contact Deleted Information
    Verify Deleted Information      ${CONTACT_VALUE}

Email Address Information
    [Documentation]     This is Valid Email Address
    [Arguments]     ${email}
    Input Text      ${EMAIL_TEXT_LOCATOR}       ${email}

Email Domain Remove
    [Documentation]     Email Domain Remove
    [Arguments]     ${email}
    ${remove}=  Set Variable    ${email}
    ${split}=   Split String From Right     ${remove}   @
    ${get}=     Get From List       ${split}    0
    Input Text      ${EMAIL_TEXT_LOCATOR}       ${split}
    Set Selenium Timeout   5 seconds

Email Text Alert
    [Documentation]   Email Text Alert
    Handle Alert  timeout=2
#    Alert Should Be Present     Please enter a valid E-mail (E-MAIL)    action=ACCEPT

Adding Contact Name Other Information
    [Arguments]     ${contact_other}
    Input Text      ${CONTACT_NAME_OTHER_LOCATOR}   ${contact_other}


Department Information
    [Documentation]     Department Information
    [Arguments]     ${department}
    Input Text      ${DEPARTMENT_LOCATOR}       ${department}

Position Information
    [Documentation]     Position Information
    [Arguments]     ${position}
    Input Text      ${POSITION_LOCATOR}     ${position}

Adding Project Information
    [Documentation]     Project Name Information
    [Arguments]     ${project_name}
    Click Element       ${ADD_PROJECT_NAME}
    Select Window       NEW
    Verify Pop-up Window Header     ${ACCOUNT_HEADER}
    Verify and Set Drop Down From Search    ${PROJECT_DROP_DOWN}
    Input Text To Search  ${project_name}
    Click Search Button
    Select The List Found   ${project_name}
    Select Window

Verify Added Project Information
    [Documentation]     Project Name verification
    [Arguments]     ${project_name}
    Verify Added Information        ${project_name}      ${PROJECT_VALUE}

Verify Erased Project Information
    [Documentation]     Deleted Project Name Verification
    Verify Deleted Information     ${PROJECT_VALUE}

Adding Lead Information
    [Documentation]     Lead Information
    [Arguments]     ${lead_no}=${EMPTY}
    Run Keyword If      "${lead_no}"!="${EMPTY}"   Run Keywords
    ...     Wait Until Element Is Visible   ${ADD_LEAD_NAME}
    ...     AND     Click Element       ${ADD_LEAD_NAME}
    ...     AND     Select Window       NEW
    ...     AND     Verify Pop-up Window Header     ${LEAD_HEADER}
    ...     AND     Verify and Set Drop Down From Search        ${LEAD_DROPDOWN}
    ...     AND     Input Text To Search        ${lead_no}
    ...     AND     Click Search Button
    ...     AND     Select The List Found       ${lead_no}
    ...     AND     Select Window

Verify Added Lead Information
    [Documentation]     Added Lead Information
    [Arguments]     ${lead_name}
    Verify Added Information        ${lead_name}      ${LEAD_VALUE}

Verify Erased Lead Information
    [Documentation]     Deleted Lead Information
    Verify Deleted Information      ${LEAD_VALUE}

Phone And Mobile Contacts Information
    [Documentation]   Phone And Mobile Contacts Information
    [Arguments]     ${mobile}       ${phone}
    Input Text      ${PHONE_LOCATOR}    ${phone}     clear=True
    Input Text      ${MOBILE_LOCATOR}   ${mobile}    clear=True
    ${actual}=      Get Value       //input[@id="mobile"]
    Should Be Equal     ${mobile}   ${actual}
    ${actual_phone}=    Get Value   //input[@id="phone"]
    Should Be Equal    ${actual_phone}      ${phone}
#    ${mobile}=      Get Value       //input[@id="mobile"]
#    Log     ${mobile}
#    ${phone}=    Get Value   //input[@id="phone"]
#    Log   ${phone}
#    Input Text      ${PHONE_LOCATOR}    ${phone}     clear=True
#    Input Text      ${MOBILE_LOCATOR}   ${mobile}    clear=True

Plan Information
    [Arguments]     ${plan}
    Input Text      ${PLAN_DETAIL_LOCATOR}      ${plan}

Comment Information
    [Arguments]     ${comment}
    Input Text      ${COMMENT_PLAN_LOCATOR}     ${comment}

Report Information
    [Arguments]     ${report}
    Input Text      ${REPORT_LOCATOR}       ${report}

Remaining Information
    [Arguments]     ${remaining}
    Input Text      ${REMAINING_LOCATOR}    ${remaining}

Remark Information
    [Arguments]     ${remark}
    Input Text      ${REMARK_LOCATOR}           ${remark}

Competitor Information
    [Arguments]     ${competitor}
    Input Text      ${COMPETITOR_LOCATOR}       ${competitor}


Verify Pop-up Window Header
    [Arguments]     ${header}
    Wait Until Element Is Visible   //td[@class="moduleName"][contains(text(), '${header}')]

Verify and Set Drop Down From Search
    [Arguments]  ${dropdown}
    Click Element       //select[@name="search_field"]//option[@label="${dropdown}"]





Click Save Button
    Click Element   ${SAVE_BUTTON_LOCATOR}

No Alert Should Be Found
    Alert Should Not Be Present

Alert Should Be Found
    Sleep   3
    Alert Should Be Present
#    Handle Alert    timeout= 5 s
    Capture Page Screenshot     filename= check if required fields are empty.png
    Wait Until Element Is Visible   ${SAVE_BUTTON_LOCATOR}

Verify All Fields Informations
    [Documentation]     To verify the created required informations
    [Arguments]     ${objective}    ${start_date}   ${status}   ${account}  ${email}    ${phone}    ${mobile}
    ...     ${add}      ${subtract}  ${contact_name}    ${department}   ${position}     ${project_name}     ${lead_name}
    ...     ${comment}  ${plan}     ${report}   ${remaining}    ${competitor}   ${remark}

    Verify Modified Time Result
    Verify Created Time Result
    Verify Objective Result                 ${objective}
    Verify User Full Name Result
    Verify Start Date Result                ${start_date}
    Verify End Date Result                  ${start_date}
    Verify Status Result                    ${status}
    Verify Account Name Result              ${account}
    Verify E-mail Result                    ${email}
    Verify Phone Result                     ${phone}
    Verify Mobile Result                    ${mobile}
    Verify End Time Result                  ${add}
    Verify Start Time Result                ${subtract}
    Verify Contact Name Result              ${contact_name}
    Verify Department Result                ${department}
    Verify Position Result                  ${position}
    Verify Project Name Result              ${project_name}
    Verify Lead Name Result                 ${lead_name}
    Verify Comment Result                   ${comment}
    Verify Plan Detail Result               ${plan}
    Verify Report Detail Result             ${report}
    Verify Remaining Detail Result          ${remaining}
    Verify Competitor Detail Result         ${competitor}
    Verify Remark Detail Result             ${remark}


Verify Required Field Informations
    [Arguments]      ${objective}
    ...             ${start_date}    ${status}   ${account}  ${contact_name}
    ...             ${project_name}      ${add}   ${subtract}      ${plan}
    Verify Modified Time Result
    Verify Created Time Result
    Verify Objective Result                 ${objective}
    Verify User Full Name Result
    Verify Start Date Result                ${start_date}
    Verify End Date Result                  ${start_date}
    Verify Status Result                    ${status}
    Verify Account Name Result              ${account}
    Verify Contact Name Result              ${contact_name}
    Verify Project Name Result              ${project_name}
    Verify Plan Detail Result               ${plan}
    Verify End Time Result                  ${add}
    Verify Start Time Result                ${subtract}

Verify Optional Fields Informations
    [Arguments]     ${objective}    ${account}  ${phone}    ${mobile}    ${contact_name}   ${contact_name}     ${department}
    ...             ${position}     ${project_name}     ${lead_name}  ${comment}     ${report}  ${plan}
    ...             ${report}    ${remaining}   ${competitor}   ${remark}   ${email}
    Verify Modified Time Result
    Verify Created Time Result
    Verify User Full Name Result
    Verify Objective Result                 ${objective}
    Verify Account Name Result              ${account}
    Verify Phone Result                     ${phone}
    Verify Mobile Result                    ${mobile}
    Verify Contact Name Result              ${contact_name}
    Verify Department Result                ${department}
    Verify Position Result                  ${position}
    Verify Project Name Result              ${project_name}
    Verify Lead Name Result                 ${lead_name}
    Verify Comment Result                   ${comment}
    Verify Plan Detail Result               ${plan}
    Verify Report Detail Result             ${report}
    Verify Remaining Detail Result          ${remaining}
    Verify Competitor Detail Result         ${competitor}
    Verify Remark Detail Result             ${remark}
    Verify E-mail Result                    ${email}


Verify //font Attribute Check Result
    [Documentation]     This function is to verify the result that contains text only from the system
    [Arguments]        ${expected}
    ${font}=    Get Text    //font[contains(text(), "${expected}")]
    Log     ${font}


Verify //td Attribute Check Result
    [Documentation]     This function is to verify the result that contains text only from the system
    [Arguments]     ${expected}
    ${font}=    Get Text    //td[contains(text(), "${expected}")]
    Log     ${font}

Verify Username Result
    [Documentation]  Verify the username registerd
    ${get_user}=    Get Text    //select[@name="assigned_user_id"]
    ${convert_user}=    Convert To String   ${get_user}
    Wait Until Element Contains     //select[@name="assigned_user_id"]      ${USER_FULL_NAME}
    Log     ${convert_user}

Verify //a Attribute Check Result
    [Documentation]     This function is to verify the result that contains text only from the system
    [Arguments]     ${expected}
    ${font}=    Get Text    //a[contains(text(), "${expected}")]
    Log     ${font}



Verify Objective Result
    [Arguments]     ${objective}
    Verify //font Attribute Check Result     ${objective}

Verify User Full Name Result
    [Documentation]     The Assigned Sale Visit Full Name of the user
    Wait Until Page Contains      ${USER_FULL_NAME}

Verify Start Date Result
    [Arguments]     ${start_date}
    ${replace}=     Replace String    ${start_date}   /   -

Verify End Date Result
    [Arguments]     ${start_date}
    ${replace}=     Replace String    ${start_date}   /   -
    Element Should Contain      //body[@class='small']//tr//tr//tr//tr//tr//tr[3]//td[2]     ${replace}
Verify Status Result
    [Arguments]     ${status}
    Verify //font Attribute Check Result      ${status}

Verify Lead Name Result
    [Arguments]     ${lead_name}
    Verify //td Attribute Check Result      ${lead_name}

Verify Account Name Result
    [Arguments]     ${account}
    Verify //td Attribute Check Result  ${account}

Verify E-mail Result
    [Arguments]     ${email}
    ${email_verify}=    Get Text    //span[@id="dtlview_E-mail"][contains(text(), '${email}')]
    Should Be Equal As Strings     ${email_verify}     ${email}
    Log     ${email_verify}

Verify Phone Result
    [Arguments]     ${phone}
    ${phone_text}=      Get Text    //span[@id="dtlview_Phone"][contains(text(),'${phone}')]
    Should Be Equal     ${phone_text}   ${phone}
Verify Mobile Result
    [Arguments]     ${mobile}
    ${mobile_text}=     Get Text    //span[@id="dtlview_Mobile"][contains(text(),'${mobile}')]
    Should Be Equal     ${mobile_text}      ${mobile}
Verify Start Time Result
    [Arguments]     ${subtract}
    Verify //td Attribute Check Result      ${subtract}

Verify End Time Result
    [Arguments]     ${add}
    Verify //td Attribute Check Result   ${add}


Verify Contact Name Result
    [Arguments]     ${contact_name}
    Verify //a Attribute Check Result   ${contact_name}
Verify Department Result
    [Arguments]     ${department}
    ${dept_text}=     Get Text    //span[@id="dtlview_Department"][contains(text(), '${department}')]
    Should Be Equal     ${dept_text}      ${department}
    Log     ${dept_text}
Verify Position Result
    [Arguments]     ${position}
    Element Should Contain     //span[@id="dtlview_Position"][contains(text(), '${position}')]  ${position}
Verify Project Name Result
    [Arguments]     ${project_name}
    Element Should Contain     //td[@id="mouseArea_Project Name"]/a[contains(text(), '${project_name}')]   ${project_name}

Verify Modified Time Result
    ${today}=       Get Current Date    result_format=%d-%m-%Y      #%H:%M
    Wait Until Element Is Visible       //tr[9]/td[4][@class="dvtCellInfo"][contains(text(), '${today}')]         timeout=60
    Element Should Contain      //tr[9]/td[4][@class="dvtCellInfo"][contains(text(), '${today}')]  ${today}
Verify Created Time Result
    ${today}=       Get Current Date    result_format=%d-%m-%Y      #%H:%M
    Wait Until Element Is Visible   //tr[10]/td[2][@class="dvtCellInfo"][contains(text(), '${today}')]          timeout=60
    Element Should Contain      //tr[10]/td[2][@class="dvtCellInfo"][contains(text(), '${today}')]    ${today}
Verify Comment Result
    [Arguments]     ${comment}=${None}
    ${today}=   Get Current Date    result_format=%Y-%m-%d      #%H:%M
    ${xpath}=   Get Element Count   //div[@class="dataField"][contains(text(), '${comment}')]
    Run Keyword And Return If   ${xpath}    Run Keywords    Element Should Contain      //div[@class="dataField"][contains(text(), '${comment}')]       ${comment}
    ...     AND     Element Should Contain      //div[@class="dataLabel"]/font[contains(text(), ': ${USER} on ${today}')]
    ...         : ${USER} on ${today}

Verify Plan Detail Result
    [Arguments]  ${plan}
    Element Should Contain     //div[@id='tblStep1PlanInformation']//tr[1]//td[2]       ${plan}
Verify Report Detail Result
    [Arguments]     ${report}
    Element Should Contain      //div[@id='tblStep2ReportInformation']//tr[1]//td[2]       ${report}
Verify Remaining Detail Result
    [Arguments]     ${remaining}
    Element Should Contain      //div[@id='tblStep2ReportInformation']//tr[2]//td[2]         ${remaining}
Verify Competitor Detail Result
    [Arguments]     ${competitor}
    Element Should Contain      //div[@id='tblStep3OtherInformation']//tr[1]//td[2]        ${competitor}
Verify Remark Detail Result
    [Arguments]     ${remark}
    Element Should Contain      //div[@id='tblStep3OtherInformation']//tr[2]//td[2]            ${remark}


Click Add Image Button
    [Documentation]     This Function is to upload images
    [Arguments]     ${image}        ${account}      ${objective}    ${schedule}
    Scroll Down Page From The Browser
    @{img}=     Split String From Right     ${image}    ;
    :FOR    ${img_line}     IN   @{img}
    \   ${string_convert}=      Convert To String   ${img_line}
    \   Exit For Loop If      "${string_convert}"=="${empty}"
    \   Click Element   ${ADD_IMAGE_BUTTON}
    \   Select Window   NEW
    \   Choose File     ${UPLOAD_FILE_BUTTON}        ${IMAGE_PATH}/${img_line}
    \   Click Button    UPLOAD
    \   Wait Until Element Is Visible   ${FILE_UPLOAD_CONFIRMATION}     60
    \   Click Element       ${UPLOAD_OK_BUTTON}
    \   Select Window
    \   ${count}=   Get Element Count   //button[@class="crmbutton small edit"][contains(text(), 'Remove')]
    \   Run Keyword If      ${count} > 1    Log     ${count}
#    \   ${file_exist}=  Capture Page Screenshot     filename=${schedule}-${objective}-${account}/screenshot image from ${objective}-${account}.png
#    \   File Should Exist       ${file_exist}

Check In Results Sales Visit Page
    [Documentation]   This function is to verify if all created information are successfully saved or not
    ...               in the schedule
    [Arguments]         ${objective}     ${start_date}     ${add}    ${start_date}   ${subtract}
    ...         ${status}   ${account}  ${plan}

    Select Dropdown Option From Menu    ${SALES_VISIT_STRING}
    Click Element     //td[@class="dvtUnSelectedCell"]/a[contains(text(), "All Events")]

    @{create}=      Create List         ${objective}    ${USER}     ${start_date}     ${add}    ${start_date}   ${subtract}
    ...         ${status}   ${account}  ${plan}
    :FOR   ${index}     ${item}     IN ENUMERATE     @{create}
    \  Run Keyword If    "${index}"=="${TRUE}"    Table Row Should Contain    //tr[@class="lvtColData"][1]/td[${index}][contains(text(), "${item}")]
    ...     ${index}    ${item}
    \  Run Keyword If    "${index}"=="${TRUE}"    Table Row Should Contain  //tr[@class="lvtColData"][1]/td[${index}]/a[contains(text(), "${item}")]
    ...     ${index}    ${item}
    \   Log    ${item}

Click Delete Button
    Sleep  2
    Click Button        Delete
    Alert Should Be Present     Are you sure you want to delete this record?    action=ACCEPT














