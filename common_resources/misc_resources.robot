*** Settings ***
Documentation    This misc_resource is compiled the email login, add button, edit button, save button
...              and Delete button functions from the system.



*** Keywords ***
Launch Web System
    [Documentation]   Url of the web application
    [Arguments]     ${link}
    Go To   ${link}
    Verify Title Page

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

Click Button
    [Documentation]     Add Image Button
    [Arguments]         ${image}
    Click Element   //input[@value="${image}"]



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


Click Erase Button
    [Documentation]  This function is to erase the added account name, contact name, etc. example in creating sales visit.
    [Arguments]     ${account_delete}
    Wait Until Element Is Visible   ${account_delete}
    Click Element   ${account_delete}


Verify Added Information
    [Documentation]     This function is to check the added account name, contact name, project name.
    [Arguments]     ${expected}     ${variable}
    ${actual}=     Get Value       //input[@name="${variable}"]
    Should Be Equal As Strings     ${actual}      ${expected}
    Log     ${actual} and ${expected} are both the same


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


Verify Deleted Information
    [Documentation]  This function is to check if successfull deleting account after clicking the erase button.
    [Arguments]     ${variable}
    ${actual}=     Get Value   //input[@name="${variable}"]
    Log     ${actual}
    Should Be Empty     ${actual}


*** Variables ***

${USERNAME_LOCATOR}         name:user_name
${PASSWORD_LOCATOR}         name:user_password
${HOME_PAGE_LOCATOR}        //td[@class="level2SelTab"]/a[contains(text(), "Home")]
${SIGNIN_LOCATOR}           //input[@value="Sign In"]
${LOGOUT_LOCATOR}           //td[@class="user-signout"]/a[contains(text(), "Sign Out")]
${MODIFIED_TIME_LOCATOR}    //td[@class="dvtCellInfo"][contains(text(), "21-01-2020 16:05:28")]
${LOGIN_ERROR_MSG}          //*[@id="form"]/div[5]/font
${ERROR_LOGIN_MSG}          //font[contains(text(),'i')


