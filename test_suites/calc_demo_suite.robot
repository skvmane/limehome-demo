*** Settings ***
Resource         ../pages/main_page.robot
Library          SeleniumLibrary
Library          ../utils/DriverManagerLib.py
Suite Setup      Install Driver
Test Setup       Open Browser From Config
Test Teardown    Close Browser

*** Test Cases ***
Valid Title
    [Documentation]    Checking that the main page title should be valid
    Title Should Be    Super Calculator

Addition Result Should Be Valid
    [Documentation]    Checking that addition result should be valid
    Add Two Numbers     8    8
    Result Should Be    16

Multiplication And Substraction Result Should Be Valid
    [Documentation]    Checking that multiplication and substraction result should be valid
    ...                as well as history should contain corresponding expressions
    Divide Two Numbers                     16    4
    Result Should Be                       4
    Multiply Two Numbers                   4     4
    Result Should Be                       16
    Number Of Rows In History Should Be    2