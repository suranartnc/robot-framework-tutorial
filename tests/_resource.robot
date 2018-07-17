*** Settings ***
Library    Selenium2Library
Library    BuiltIn
Library    String

*** Variable ***
${url_lotto}                        https://news.sanook.com/lotto/
${title_lotto}                      ตรวจสลากกินแบ่งรัฐบาล ตรวจหวย งวด 16 กรกฎาคม 2561
${input_target}                     //*[@id="lotto-checkbox"]/input[1]
${btn_submit}                       //*[@id="lotto-checkbox"]/button

*** Keywords ***
Open Browser To Lotto Page
    Open Browser                    about:blank    chrome
    Go To                           ${url_lotto}
    Title Should Be                 ${title_lotto}

Input Lotto Number
    [Arguments]                     ${number}
    Element Should Be Visible       ${input_target}
    Input Text                      ${input_target}       ${number}
    Sleep                           1s
    
Submit Form
    Element Should Be Visible       ${btn_submit}
    Click Element                   ${btn_submit}