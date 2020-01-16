*** Variables ***
${LOGIN_URL}            http://aisystem.dyndns.biz:8090/aistcrm_uat/index.php?module=Users&action=Logout
#${BROWSER}          chrome
${HEADER}               //div[@class="login-form"]/h1[contains(text(), 'Sign In')]
${SIGN_BUTTON}          //input[@value="Sign In"]
${CUSTOMER_TAB}         //td[@class="tabUnSelected"]/a[contains(text(), 'Customer Service')]
${CASE_TAB}             //a[@class="drop_down"][contains(text(), 'Case')]
${HOME_SCREEN}          //td[@class="level2SelTab"]/a[contains(text(), 'Home')]
${CREATE_CASE}          //img[@title="Create Case..."]
${CASE_NAME}            id:ticket_title
${CASE_NAME_STRING}     Wel_automation
${PRIORITY}             //select[@name="ticket_important"]
${DROPDOWN_PRIORITY}    //option[@value="${DROPDOWN_PRIORITY_STRING}"]
${DROPDOWN_PRIORITY_STRING}     Urgent
${COMPLETE_PRIORITY}    
${SAVE_BUTTON}          //input[@title="Save [Alt+S]"]
${SIGN_OUT_BUTTON}      //a[contains(text(), 'Sign Out')]


*** Keywords ***

Access URL
    Go to   ${LOGIN_URL}

Enter Valid Username and Password
    #Sleep   3
    Input Text      name:user_name    ruel.arb    clear=True
    Input Password      name:user_password    moaicrm     clear=True
    Click Button        ${SIGN_BUTTON}

Navigate to Customer Service
    Wait Until Element Is Visible       ${HOME_SCREEN}      timeout=30 
    Mouse Over    ${CUSTOMER_TAB}
    Click Link    ${CASE_TAB}

Creating Case Scenario
    Click Element   ${CREATE_CASE}
    Input Text      ${CASE_NAME}    ${CASE_NAME_STRING}
    Page Should Contain Element     ${PRIORITY}
    Click Element   ${DROPDOWN_PRIORITY}
    Sleep  3
    Click Link      ${SIGN_OUT_BUTTON}
    Wait Until Page Contains       Sign In      
    #Sleep  2
    #Click Button    ${SAVE_BUTTON}
