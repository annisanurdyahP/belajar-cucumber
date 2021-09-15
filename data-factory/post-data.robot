*** Settings ***
Library         Collections
Library         RequestsLibrary
Library         JSONLibrary
Library         OperatingSystem
Suite Setup    Create Session  AddData  https://jsonplaceholder.typicode.com

*** Variables ***
${base_url}           https://jsonplaceholder.typicode.com
${variable_title}         Recommendation
${variable_userId}        12
${variable_body}          motorcycle

*** Test Cases ***
Fill Valid Data Should Get Responses 201
    [Documentation]       Post Request
    ${body}=       Create Dictionary    title=${variable_title}   body=${variable_body}    userId=${variable_userId}
    ${header}=     Create Dictionary     Content-Type=application/json
    ${response}=   POST On Session     AddData    /posts  json=${body}
    Status Should Be      201    ${response}
