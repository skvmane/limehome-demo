*** Settings ***
Resource         ../pages/Base_Page.robot
Library          SeleniumLibrary
Library          ../utils/DriverManagerLib.py
Suite Setup      Install Driver
Test Setup       Open Browser From Config
Test Teardown    Close Browser

*** Variables ***

*** Test Cases ***
Valid Title
    Title Should Be    Super Calculator

Addition Result Should Be Valid
    Input First Operand    4
    Input Second Operand    4
    Select Operator  ADDITION
    Execute An Operation
    Check The Result


