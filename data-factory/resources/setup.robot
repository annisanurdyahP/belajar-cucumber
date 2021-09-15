*** Settings ***
Documentation   Setup app
Library           AppiumLibrary

*** Variables ***
${appium_server}       http://localhost:4723/wd/hub
${platform_name}        Android
${device_name}          Pixel_2_API_30
${app}              ${CURDIR}/apk/Sample Android App Login Test_v4.0_apkpure.com.apk
${app_package}      com.loginmodule.learning
${app_activity}     com.loginmodule.learning.activities.LoginActivity

*** Keywords ***
Launch Mobile Application
    Open Application    ${appium_server}
    ...    platformName=${platform_name}
    ...    deviceName=${device_name}
    ...    app=${app}
    ...    appPackage=${app_package}
    ...    appActivity=${app_activity}

Close Application
    Quit Application

# *** Settings ***
# Library      AppiumLibrary

# *** Variables ***
# ${appium_server}       http://localhost:4723/wd/hub
# ${platform_name}        Android
# ${device_name}          Pixel_2_API_30
# ${app}              ${CURDIR}/apk/Sample Android App Login Test_v4.0_apkpure.com.apk
# ${app_package}      com.loginmodule.learning
# ${app_activity}     com.loginmodule.learning.activities.LoginActivity

# *** Keywords ***
# Launch Mobile Application
#     Open Application    ${appium_server}
#     ...    platformName=${platform_name}
#     ...    deviceName=${device_name}
#     ...    app=${app}
#     ...    appPackage=${app_package}
#     ...    appActivity=${app_activity}
