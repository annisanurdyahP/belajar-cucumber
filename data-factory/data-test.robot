*** Settings ***
Library         Collections
Library         RequestsLibrary
Library         JSONLibrary
Library         OperatingSystem
Suite Setup     Create Session  GetData  https://jsonplaceholder.typicode.com

*** Test Cases ***
Successfully Get Type Data Integer
      ${response}=    Get On Session   GetData     /posts
      FOR     ${i}     IN     @{response.json()}
          ${user_passed}=     Evaluate           type(${i['userId']})
          ${type}=            Run Keyword If     ${user_passed}    Evaluate            type(${i['userId']})
          ${id_passed}=       Evaluate           type(${i['id']})
          ${type_id}=         Run Keyword If     ${id_passed}    Evaluate            type(${i['id']})
      END

Successfully Get Type Data String
      ${response}=    Get On Session   GetData     /posts
      FOR       ${x}      IN    @{response.json()}
          ${title_passed}=    Evaluate            type($x["title"])
          ${type_title}=      Run Keyword If     ${title_passed}    Evaluate           type($x["title"])
          ${body_passed}=     Evaluate           type($x["body"])
          ${type_body}=       Run Keyword If     ${body_passed}    Evaluate           type($x["body"])
      END
