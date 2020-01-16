*** Settings ***
Documentation   This is a simple test script for Creating Case Scenario
#Library     SeleniumLibrary
Library     Selenium2Library
Resource    ../../common_resources/web_common.robot
Resource    ../resources/case_resources.robot
Suite Setup     Run Keywords    Open Chrome Browser  AND     Access URL
#Test Teardown   Close Window
Suite Teardown   Close Browser






*** Test Cases ***
#Valid Login
    #Open Browser To Login Page

UserName and Password
    [Tags]      This is test 1
    Enter Valid Username and Password

Select Customer Service
    [Tags]      This is test 2
    Navigate to Customer Service 

Input Create Information Form
    [Tags]      This is test 3
    Creating Case Scenario











    
    

