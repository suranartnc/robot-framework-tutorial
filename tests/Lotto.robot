*** Settings ***
Library    Selenium2Library
Library    BuiltIn
Library    String
Suite Teardown     Close Browser

*** Variable ***
${url_lotto}                        https://news.sanook.com/lotto/
${title_lotto}                      ตรวจสลากกินแบ่งรัฐบาล ตรวจหวย งวด 16 กรกฎาคม 2561
${input_target}                     //*[@id="lotto-checkbox"]/input[1]
${input_value}                      596324
${btn_submit}                       //*[@id="lotto-checkbox"]/button
${win_target}                       //*[@id="lotto_result_win"]

*** Keywords ***
Verify Lotto Page
    [Arguments]                     ${title}
    Title Should Be                 ${title}
Input Lotto Number
    [Arguments]                     ${number}
    Element Should Be Visible       ${input_target}
    Input Text                      ${input_target}       ${number}
Click Button Submit
    [Arguments]                     ${btn}
    Element Should Be Visible       ${btn}
    Click Element                   ${btn}
Verify Check Success
    [Arguments]                     ${xpath}
    Element Should Be Visible       ${xpath}

*** Test Cases ***
Check lotto - Success
    [tags]    Success
    Open Browser                    about:blank    chrome
    Go To                           ${url_lotto}
    Verify Lotto Page               ${title_lotto}
    Input Lotto Number              ${input_value}
    Sleep                           1s
    Click Button Submit             ${btn_submit}
    Verify Check Success            ${win_target}
    Sleep                           2s