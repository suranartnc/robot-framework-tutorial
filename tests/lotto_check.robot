*** Settings ***
Resource          _resource.robot
Suite Teardown     Close Browser

*** Variable ***
${input_value}                      596324
${win_target}                       //*[@id="lotto_result_win"]

*** Keywords ***
Verify Check Success
    Element Should Be Visible       ${win_target}
    Sleep                           2s

*** Test Cases ***
Check lotto - Success
    Open Browser To Lotto Page
    Input Lotto Number              ${input_value}
    Submit Form             
    Verify Check Success