*** Settings ***
Library     browser_version.py




***Test Cases***

Get the browser
    ${VERSION} = Get Browser Version
    Log   ${VERSION}


***Variables***

