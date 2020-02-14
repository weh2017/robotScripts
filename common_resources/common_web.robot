*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Open Chrome Browser
    [Documentation]   Open the Chrome Browser with maximize view, no infobars notification and no pop-ups.
    ${chrome_options} =   Evaluate   sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver
    ${prefs}   Create Dictionary   credentials_enable_service=${false}
    Call Method   ${chrome_options}   add_experimental_option    prefs    ${prefs}
    Call Method   ${chrome_options}   add_argument   --start-maximized
    Call Method   ${chrome_options}   add_argument   --disable-infobars
    Call Method   ${chrome_options}   add_argument   --disable-popup-blocking
    Create WebDriver   Chrome   chrome_options=${chrome_options}


#Open Headless Browser
#    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
#    ${options.prefs}=  Create Dictionary  credentials_enable_service  false
#    Call Method  ${options}  add_argument  --disable-infobars #ปิด mode การทดสอบ
#    Call Method  ${options}  add_argument  --start-fullscreen #full screen mode
#    Call Method  ${options}  add_argument  --disable-gpu\=true #ปิดการใช้งาน gpu
#    Call Method  ${options}  add_experimental_option  prefs   ${options.prefs}
#    Create WebDriver  Chrome  chrome_options=${options}
Close All Chrome Browsers
    [Documentation]     Close the Chrome Browser
        Close All Browsers 