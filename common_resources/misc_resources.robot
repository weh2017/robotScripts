*** Settings ***
Documentation    This misc_resource is compiled the email login, add button, edit button, save button
...              and Delete button functions from the system.



*** Keywords ***
Launch Web System
    [Documentation]   Url of the web application
    [Arguments]     ${link}
    Go To   ${link}          # For the link. I saved it to user_login_resource.robot file
    Verify Title Page

Select Menu
    [Arguments]        ${menu}
    [Documentation]     Select Menu Header like Sales, Customer Service, Inventory
    Wait Until Element Is Visible      //td[@class="tabUnSelected"]/a[contains(text(), '${menu}')]
    Click Link      //td[@class="tabUnSelected"]/a[contains(text(), '${menu}')]

Select Dropdown Option From Menu
    [Arguments]     ${select}
    [Documentation]     Select Dropdown options from menu like sales visit, account,contacts, case.etc
    Wait Until Element Is Visible   //a[contains(text(), '${select}')]
    Click Link      //a[contains(text(), '${select}')]

Focus New Browser Window
    [Documentation]   To focus and execute new pop-up browser window
    Switch Window   NEW

Exit New Window And Focus Main Browser
    [Documentation]  To Exit pop-up browser window and go back to the main browser
    Switch Window

Select Data On Basic Search Mode
    [Documentation]  This Function is to Add some data. It has a plus button and erase Button
    [Arguments]        ${selector}     ${option}   ${string_reference}
    Select Option From Dropdown List   ${selector}   ${option}     # OTHER KEYWORD UNDER misc.resources
    Input Text To Search        ${string_reference}
    Click Search Button
    Wait Until Page Contains   ${string_reference}
    Select The List Found       ${string_reference}

Click Button To Create Page
    [Documentation]   This is specific button for creating Case, Jobs, Contacts, Leads, Documents, Projects.
    ...     cannot use in sales visit.
    [Arguments]     ${button_create}
    Wait Until Element Is Visible       //img[@title="Create ${button_create}..."]
    Click Image     //img[@title="Create ${button_create}..."]

Input Username
    [Documentation]     This is the  email username input text function.
    [Arguments]     ${user_name}
    Wait Until Element Is Visible       ${USERNAME_LOCATOR}
    Input Text      ${USERNAME_LOCATOR}      ${user_name}     clear=True

Input User's Password
    [Documentation]     This is the email password input text function.
    [Arguments]     ${user_pass}
    Wait Until Element Is Visible   ${PASSWORD_LOCATOR}
    Input Password   ${PASSWORD_LOCATOR}       ${user_pass}    clear=True

Scroll Down Page From The Browser
    [Documentation]     This function will perform to scroll down to bottom.
    #Execute Javascript      window.scrollTo(0, 1500)       # Can also use this to scroll down page
    Execute Javascript      window.scrollTo(0,document.body.scrollHeight)

Verify Error Message
    [Documentation]  This is to test the error message if prompted or not.
    [Arguments]     ${error_message}
    Wait Until Element Is Visible   ${error_message}
    Page Should Contain      Sign In


Click Login button
    [Documentation]  This is Sign In function from the system.
    Wait Until Element Is Visible    ${SIGNIN_LOCATOR}
    Click Element   ${SIGNIN_LOCATOR}
    #Wait Until Element Is Not Visible       ${SIGNIN_LOCATOR}
    #Log     Successfully entered credentials

Select The List Found
    [Documentation]  This function is to click the link element
    [Arguments]     ${found_list}
#    Click Link      //a[contains(text(), '${found_list}')]
    Click Link   //a[@href="javascript:window.close();"][contains(text(), '${found_list}')]

Click Button
    [Documentation]     Add Image Button
    [Arguments]         ${image}
    Click Element   //input[@value="${image}"]

Select Option From Dropdown List
    [Documentation]   Example in Status from Sales Visit : Plan, Complete, Cancel
    [Arguments]     ${selector}     ${option}
    Click Element   //select[@name="${selector}"]/option[@value="${option}"]

Alert Message Should Be Found
    [Documentation]     This is for Alert Message
    [Arguments]     ${alert}
    Alert Should Be Present     ${alert}        action=ACCEPT

Click Logout button
    [Documentation]  This is Log out function from the system.
    Wait Until Element Is Visible    ${LOGOUT_LOCATOR}
    Click Element   ${LOGOUT_LOCATOR}
    Wait Until Element Is Not Visible   ${LOGOUT_LOCATOR}
    Wait Until Element Is Visible       ${SIGNIN_LOCATOR}
    Log     Successfully Signed Out the system


Verify Title Page
    [Documentation]     Verify the title of the page after the login with username successfully entered.
    Get Title
    Title Should Be         MOAI-CRM - The Premium CRM Solution
    Log     Get Title

Verify Home Page
    [Documentation]     Verify if User successfully access the system home page.
    Wait Until Element Is Visible       ${HOME_PAGE_LOCATOR}        timeout=10
    Log     Home Page Found

Input Data To TextBox
    [Documentation]   This function is to locate the element of the textbox and Input the desired text in this location.
    [Arguments]     ${locator}      ${string}
    Wait Until Element Is Visible       ${locator}
    Input Text      ${locator}      ${string}
Click Erase Button
    [Documentation]  This function is to erase the added account name, contact name, etc. example in creating sales visit.
    [Arguments]     ${account_delete}
    Wait Until Element Is Visible   ${account_delete}
    Click Element   ${account_delete}
    Set Selenium Timeout    5 seconds

Click Plus Button
    [Documentation]  This function is to click the "+" button
    [Arguments]     ${plus_button}
    Click Element       ${plus_button}
Verify Added Information
    [Documentation]     This function is to check the added account name, contact name, project name.
    [Arguments]     ${expected}     ${variable}
    ${actual}=     Get Value       //input[@name="${variable}"]
#    Should Be Equal As Strings     ${actual}      ${expected}
    Log     Contains text ${actual}
Subtract Time Without Seconds
    [Documentation]     Subract Time From Time And Remove Seconds
    ${currrent_date}=   Get Current Date    result_format=%H:%M:%S
    Log     ${current_date}
    ${set_var}=     Set Variable    ${current_date}
    ${subtract}=    Subtract Time From Time     ${set_var}      1 hour  exlude_millis=true
    ${convert}=     Convert Time    ${subtract}     Timer
    ${set}=     Set Variable    ${convert}
    ${split}=   Split String From Right     ${set}  :   max_split=1
    ${list}=    Get From List   ${split}    0
    Log     ${list}

Input Text To Search
    [Documentation]  This function is to input keywords to search textbox.
    [Arguments]     ${search_text}
    Input Text      name:search_text     ${search_text}

Click Search Button
    Click Element       name:search

Swap String
    [Documentation]     This function is to replace from the original string to new string depending on the users.
    [Arguments]     ${string}   ${original}     ${new}
    Replace String      ${string}   ${original}     ${new}

Verify Deleted Information
    [Documentation]  This function is to check if successfull deleting account after clicking the erase button.
    [Arguments]     ${variable}
    ${actual}=     Get Value   //input[@name="${variable}"]
    Log     ${actual}
    Should Be Empty     ${actual}

Enter Date Calendar Text
    [Documentation]    Calendar Text for optional informations like Case module:("Case Open Date").
    [Arguments]     ${locator}  ${calendar_text}    ${clear}
    Click Element   ${locator}
#    Press Keys      ${locator}      CTRL+a+DELETE
    Input Text      ${locator}      ${calendar_text}    ${clear}
    ${replace}=     Replace String       ${calendar_text}   /    -
    Input Text      ${locator}      ${replace}      ${clear}

Click Save Footer Button
    [Documentation]     This function is the save button located at the footer area
    Click Element    ${SAVE_FOOTER_BTN}

*** Variables ***

${USERNAME_LOCATOR}         name:user_name
${PASSWORD_LOCATOR}         name:user_password
${HOME_PAGE_LOCATOR}        //td[@class="level2SelTab"]/a[contains(text(), "Home")]
${SIGNIN_LOCATOR}           //input[@value="Sign In"]
${LOGOUT_LOCATOR}           //td[@class="user-signout"]/a[contains(text(), "Sign Out")]
${MODIFIED_TIME_LOCATOR}    //td[@class="dvtCellInfo"][contains(text(), "21-01-2020 16:05:28")]
${LOGIN_ERROR_MSG}          //*[@id="form"]/div[5]/font
${ERROR_LOGIN_MSG}          //font[contains(text(),'i')
${SEARCH_FIELD}             //select[@name="search_field"]
${SAVE_FOOTER_BTN}          //tr[27]/td/div/input[@title="Save [Alt+S]"]

