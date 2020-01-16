Launch Browser
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --disable-infobars #ปิด mode การทดสอบ
    Call Method  ${options}  add_argument  --start-fullscreen #full screen mode
    Call Method  ${options}  add_argument  --disable-gpu\=true #ปิดการใช้งาน gpu

    ${options.prefs}=  Create Dictionary  credentials_enable_service  false
    Call Method  ${options}  add_experimental_option  prefs   ${options.prefs}

    Create WebDriver  Chrome  chrome_options=${options}