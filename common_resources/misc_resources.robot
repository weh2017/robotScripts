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


Verify Error Message
    [Documentation]  This is to test the error message if prompted or not.
    [Arguments]     ${error_message}
    Wait Until Page Contains    ${error_message}


Click Login button
    [Documentation]  This is Sign In function from the system.
    Wait Until Element Is Visible    ${SIGNIN_LOCATOR}
    Click Element   ${SIGNIN_LOCATOR}
    Wait Until Element Is Not Visible       ${SIGNIN_LOCATOR}
    Log     Successfully entered credentials



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
    Wait Until Element Is Visible   ${ACCOUNT_CLEAR_BUTTON}
    Click Element   ${ACCOUNT_CLEAR_BUTTON}

Verify Added Information
    [Documentation]     This function is to check the added account name, contact name, project name.
    ${get}=     Get Value       ${DISPLAY_ACCOUNT_NAME}
    ${output}=  Convert To String    ${get}
    Should Not Be Empty     ${output}



Verify Deleting Information
    [Documentation]  This function is to check if successfull deleting account after clicking the erase button.
    ${get}=     Get Value   ${DISPLAY_ACCOUNT_NAME}
    ${output}=  Convert To String    ${get}
    Should Be Empty     ${output}


*** Variables ***

${USERNAME_LOCATOR}         name:user_name
${PASSWORD_LOCATOR}         name:user_password
${HOME_PAGE_LOCATOR}        //td[@class="level2SelTab"]/a[contains(text(), "Home")]
${SIGNIN_LOCATOR}           //input[@value="Sign In"]
${LOGOUT_LOCATOR}           //td[@class="user-signout"]/a[contains(text(), "Sign Out")]
${ACCOUNT_CLEAR_BUTTON}     //td[@class='showPanelBg']//td[2]//table[1]//tbody[1]//tr[1]//td[3]//input[1]                  #this is an clear button of add account
${ADD_ACCOUNT_NAME}         //table/tbody/tr[7]/td[2]/table/tbody/tr/td[2]/img     #this is an add account button.opens new window
${DISPLAY_ACCOUNT_NAME}     //input[@name="account_name"]       #this is account name displayed