*** Settings ***
Documentation     Keyword Step
Library          AppiumLibrary
Library          FakerLibrary
Resource         elementID.robot

*** Keywords ***
Click Button Register
    [Documentation]   Keyword to click button register
    Click Element     ${register_btn}

Input Data On Register Form
    [Documentation]   Keyword to input data register
    Input Text          ${input_name}       Annisa
    ${faker_name}=        FakerLibrary.email
    Input Text          ${input_email}      ${faker_name}
    Wait Until Element Is Visible        ${password}
    Input Text          ${password}         test123
    Input Text          ${edit_password}    test123
    Scroll Down Android To Element         ${submit_register}
    Click Element        ${submit_register}

Input Invalid Email On Register Form
    [Documentation]   Keyword to input invalid email data register
    Input Text          ${input_name}       Annisa
    Input Text          ${input_email}      testannisa
    Input Text          ${password}         test123
    Input Text          ${edit_password}    test123
    Scroll Down Android To Element         ${submit_register}
    Click Element        ${submit_register}

Input Empty Data On Field Name And Email
    [Documentation]       Empty Field Name And Email
    Input Text          ${password}         test123
    Input Text          ${edit_password}    test123
    Scroll Down Android To Element         ${submit_register}
    Click Element        ${submit_register}

Input Different Password
    [Documentation]     Password
    Input Text          ${input_name}       Annisa
    Input Text          ${input_email}      testannisa@test.com
    Input Text          ${password}         test
    Input Text          ${edit_password}    test123
    Scroll Down Android To Element         ${submit_register}
    Click Element        ${submit_register}

Register Before Login
    [Documentation]   Keyword to input data register
    [Arguments]         ${name}   ${email}    ${password_register}     ${editpassword_register}
    Input Text          ${input_name}       ${name}
    Input Text          ${input_email}      ${email}
    Wait Until Element Is Visible        ${password}
    Input Text          ${password}         ${password_register}
    Input Text          ${edit_password}     ${editpassword_register}
    Scroll Down Android To Element         ${submit_register}
    Click Element        ${submit_register}
    Scroll Down Android To Element          ${login_link}
    Wait Until Page Contains Element  ${login_link}
    Click Element        ${login_link}

Input Valid Data On Login Page
    [Documentation]     Login Page
    [Arguments]         ${email_login}    ${password_login}
    # Wait Until Page Contains Element  ${login_link}      timeout=10
    # Click Element        ${login_link}
    Input Text          ${input_email}     ${email_login}
    Input Text          ${password}        ${password_login}
    Click Element       ${login_button}

Input Field On Login Page
    [Documentation]     Login Wrong EMail and Password
    Input Text          ${input_email}     testannisa@test.com
    Input Text          ${password}         test123
    Click Element       ${login_button}

Input Invalid Email On Login Page
    [Documentation]     Login Page Invalid Email
    Input Text          ${input_email}     testannisa
    Input Text          ${password}         test123
    Click Element       ${login_button}

Validate Successfully Register
    [Documentation]       Register
    Page Should Contain Text               ${error_message_login}     Successfully Register

Validate Invalid Email
    [Documentation]     Keyword to validate invalid email
    Page Should Contain Text         ${layout_email}    Enter Valid Email

Validate Fill Empty Email And Name
    [Documentation]     Keyword to fill empty name and email
    Page Should Contain Text        ${layout_name}
    Page Should Contain Text        ${input_email}        ${empty}

Validate Successfully Login
    [Documentation]     Keyword To validate login button
    [Arguments]         ${name_user}     ${email_data}     ${password_data}
    Scroll Down Android To Element       ${textview_password}
    Page Should Contain Text           ${textview_name}       ${name_user}
    Page Should Contain Text           ${textview_email}      ${email_data}
    Page Should Contain Text           ${textview_password}   ${password_data}

Validate Password Does Not Match
    [Documentation]     Paswword Doesn't Match
    Page Should Contain Text    ${layout_confirm_password}      Password Does Not Matches

Validate Invalid Password And Email
    [Documentation]
    Page Should Contain Text               ${error_message_login}     Wrong Email or Password

Scroll Down Android To Element
    [Documentation]                   Scroll down android until element is visible (max retry 3 times)
    [Arguments]                       ${locator}
    ${width}                          Get Window Width
    ${height}                         Get Window Height
    ${start_x}=                       Evaluate             ${width} * 0.5
    ${start_y}=                       Evaluate             ${height} * 0.8
    ${end_x}=                         Evaluate             ${width} * 0.5
    ${end_y}=                         Evaluate             ${height} * 0.4
    Scroll Until Element Visible      ${locator}           ${start_x}          ${start_y}    ${end_x}    ${end_y}

Scroll Until Element Visible
    [Documentation]                   Scroll until element is visible
    [Arguments]                       ${locator}          ${start_x}     ${start_y}    ${end_x}     ${end_y}
    FOR    ${counter}  IN RANGE   3
        ${is_visible}=                Run Keyword And Return Status     Wait Until Element Is Visible      ${locator}    %{SHORT_TEST_TIMEOUT}
        Run Keyword If                ${is_visible}                     Exit For Loop
        Swipe                         ${start_x}                        ${start_y}                         ${end_x}      ${end_y}         500
        ${counter}=                   Set Variable                      ${counter}+1
        Sleep                         1500ms                            waiting scrolling action finish
    END