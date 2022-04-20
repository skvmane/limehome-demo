*** Settings ***
Documentation      Basic keywords to for interacting with the calculator.
...                Operators supported: ADDITION(+), SUBTRACTION(-),
...                DIVISION(/), MODULO(%), MULTIPLICATION(*)
Library                   SeleniumLibrary
Library                   ../utils/ParserLib.py
Library                   ../utils/DriverManagerLib.py

*** Variables ***
${TIMEOUT}                3
#locators
${FIRST_NUMBER_FIELD}     //input[@ng-model='first']
${SECOND_NUMBER_FIELD}    //input[@ng-model='second']
${OPERATOR_LIST}          //select[@ng-model='operator']
${GO_BUTTON}              //button[@id='gobutton']
${RESULT_BLOCK}           //form/h2[not(starts-with(text(),"."))]    # workaround to end
                                                                     # of a result evaluating animation
${HISTORY_TABLE_ROW}      //tr[@ng-repeat='result in memory']

*** Keywords ***
Open Browser From Config
    ${URL}                           Parserlib.Get Url
    ${BROWSER}                       Parserlib.Get Browser
    ${DRIVER_PATH}                   DriverManagerLib.Get Driver Path
    Open Browser                     ${URL}                     ${BROWSER}    executable_path=${DRIVER_PATH}
    Maximize Browser Window

Input First Operand
    [Arguments]                      ${FIRST_NUMBER}
    Wait Until Element Is Visible    ${FIRST_NUMBER_FIELD}      ${TIMEOUT}
    Input Text                       ${FIRST_NUMBER_FIELD}      ${FIRST_NUMBER}
    Set Global Variable              ${FIRST_NUMBER}

Input Second Operand
    [Arguments]                      ${SECOND_NUMBER}
    Wait Until Element Is Visible    ${SECOND_NUMBER_FIELD}
    Input Text                       ${SECOND_NUMBER_FIELD}     ${SECOND_NUMBER}
    Set Global Variable              ${SECOND_NUMBER}

Select Operator
    [Arguments]    ${OPERATOR}
    Wait Until Element Is Visible    ${OPERATOR_LIST}           ${TIMEOUT}
    Select From List By Value        ${OPERATOR_LIST}           ${OPERATOR}

Execute An Operation
    Click Button                     ${GO_BUTTON}

Result Should Be
    [Arguments]                      ${RESULT}
    Wait Until Element Is Visible    ${RESULT_BLOCK}            ${TIMEOUT}
    Element Text Should Be           ${RESULT_BLOCK}            ${RESULT}

Add Two Numbers
    [Arguments]                      ${FIRST_NUMBER}            ${SECOND_NUMBER}
    Input First Operand              ${FIRST_NUMBER}
    Input Second Operand             ${SECOND_NUMBER}
    Select Operator                  ADDITION
    Execute An Operation

Multiply Two Numbers
    [Arguments]                      ${FIRST_NUMBER}            ${SECOND_NUMBER}
    Input First Operand              ${FIRST_NUMBER}
    Input Second Operand             ${SECOND_NUMBER}
    Select Operator                  MULTIPLICATION
    Execute An Operation

Divide Two Numbers
    [Arguments]                      ${FIRST_NUMBER}            ${SECOND_NUMBER}
    Input First Operand              ${FIRST_NUMBER}
    Input Second Operand             ${SECOND_NUMBER}
    Select Operator                  DIVISION
    Execute An Operation

Number Of Rows In History Should Be
    [Arguments]                      ${EXPECTED_ROW_COUNTER}
    Wait Until Element Is Visible    ${HISTORY_TABLE_ROW}       ${TIMEOUT}
    ${COUNTER}=                      Get Element Count          ${HISTORY_TABLE_ROW}
    Should Be True                   ${EXPECTED_ROW_COUNTER} == ${COUNTER}