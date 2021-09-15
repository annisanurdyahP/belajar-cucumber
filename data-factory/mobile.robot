*** Settings ***
Library          AppiumLibrary
Library          FakerLibrary
Resource         ${CURDIR}/page-objects/step.robot
Test Setup      Launch Mobile Application
Test Teardown     Close Application

*** Variables ***
${appium_server}       http://localhost:4723/wd/hub
${platform_name}        Android
${device_name}          Pixel_2_API_30
${app}              ${CURDIR}/apk/Sample Android App Login Test_v4.0_apkpure.com.apk
${app_package}      com.loginmodule.learning
${app_activity}     com.loginmodule.learning.activities.LoginActivity

*** Test Case ***
User Succsessfully Register With Valid Data
    [Documentation]   Register
    [Tags]        test_case=C01
    Click Button Register
    Input Data On Register Form
    Validate Successfully Register

User Unsuccessfully Register When Input Invalid Email
    [Documentation]   register invalid email
    [Tags]        test_case=C02
    Click Button Register
    Input Invalid Email On Register Form
    Validate Invalid Email

User Unsuccessfully Register When Fill Empty Field Name And Email
    [Documentation]  fill empty
    [Tags]        test_case=C03
    Click Button Register
    Input Empty Data On Field Name And Email
    Validate Fill Empty Email And Name

User Unsuccessfully Register When Input Different Text On Confirm Password
    [Documentation]    different password
    [Tags]        test_case=C04
    Click Button Register
    Input Different Password
    Validate Password Does Not Match

User Login Successfully With Valid Data
    [Documentation]
    [Tags]        test_case=C05
    ${faker_email}=      FakerLibrary.email
    Click Button Register
    Register Before Login      name=Annisa   email=${faker_email}    password_register=test123     editpassword_register=test123
    Input Valid Data On Login Page    email_login=${faker_email}    password_login=test123
    Validate Successfully Login   name_user=Annisa      email_data=${faker_email}    password_data=test123


User Unsuccsessfully Login
    [Documentation]   login with valid data
    [Tags]        test_case=C06
    Input Field On Login Page
    Validate Invalid Password And Email

User Unsuccessfully Login With Invalid Email
    [Documentation]     Login with invalid email
    [Tags]        test_case=C07
    Input Invalid Email On Login Page
    Validate Invalid Email

*** Keywords ***
Launch Mobile Application
    Open Application    ${appium_server}
    ...    platformName=${platform_name}
    ...    deviceName=${device_name}
    ...    app=${app}
    ...    appPackage=${app_package}
    ...    appActivity=${app_activity}
    ...    noReset=true
