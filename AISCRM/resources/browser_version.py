from selenium import webdriver




#@keyword
#def get_browser_version(self):
browser = webdriver.Firefox()
browser.get('http://www.google.com')
print (browser.capabilities['version'])