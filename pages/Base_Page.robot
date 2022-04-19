*** Settings ***
Library                   SeleniumLibrary
Library                   ../utils/ParserLib.py
Library                   ../utils/DriverManagerLib.py

*** Variables ***
${TIMEOUT}                5
#locators
${FIRST_NUMBER_FIELD}     //input[@ng-model='first']
${SECOND_NUMBER_FIELD}    //input[@ng-model='second']
${OPERATOR_LIST}          //select[@ng-model='operator']
${GO_BUTTON}              //button[@id='gobutton']
${RESULT_BLOCK}           //form/h2[not(starts-with(text(),"."))]    # workaround to end
                                                                     # for result evaluating animation

*** Keywords ***
Open Browser From Config
    ${URL}     Parserlib.Get Url
    ${BROWSER}    Parserlib.Get Browser
    ${DRIVER_PATH}    DriverManagerLib.Get Driver Path
    Open Browser    ${URL}    ${BROWSER}    executable_path=${DRIVER_PATH}
    Maximize Browser Window

Input First Operand
    [Arguments]    ${FIRST_NUMBER}
    Wait Until Element Is Visible    ${FIRST_NUMBER_FIELD}
    Input Text    ${FIRST_NUMBER_FIELD}    ${FIRST_NUMBER}
    set global variable   ${FIRST_NUMBER}

Input Second Operand
    [Arguments]    ${SECOND_NUMBER}
    Wait Until Element Is Visible    ${SECOND_NUMBER_FIELD}
    Input Text    ${SECOND_NUMBER_FIELD}    ${SECOND_NUMBER}
    set global variable   ${SECOND_NUMBER}

Select Operator
    [Arguments]    ${OPERATOR}
    Wait Until Element Is Visible    ${OPERATOR_LIST}
    Select From List By Value    ${OPERATOR_LIST}    ${OPERATOR}

Execute An Operation
    Click Button    ${GO_BUTTON}

Check The Result
    Wait Until Element Is Visible    ${RESULT_BLOCK}
    ${RESULT}=    Evaluate    ${FIRST_NUMBER}+${SECOND_NUMBER}
    Element Text Should Be    ${RESULT_BLOCK}    ${RESULT}

