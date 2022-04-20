# Limehome-demo
## Project details:
Limehome-demo is the E2E Automation framework written with [Robot Framework](https://robotframework.org/) and the corresponding [SeleniumLibrary](SeleniumLibrary/). The framework also supports using [WebDriverManager](https://github.com/SergeyPirogov/webdriver_manager) which is an open-source library that carries out the management (i.e., download, setup) of the drivers required by SeleniumLibrary
## Project structure:
- ***[main_page.robot](https://github.com/skvmane/limehome-demo/blob/master/pages/main_page.robot)*** - a resource file with reusable keywords and variables for the "Super Calculator" page
- ***[calc_demo_suite.robot](https://github.com/skvmane/limehome-demo/blob/master/test_suites/calc_demo_suite.robot)*** - a test suite containing tests related to "Super Calculator". This test has a workflow that is created using keywords in the imported resource file.
- ***[ParserLib.py](https://github.com/skvmane/limehome-demo/blob/master/utils/ParserLib.py)*** - a library for parsing configuration file
- ***[DriverManagerLib.py ](https://github.com/skvmane/limehome-demo/blob/master/utils/DriverManagerLib.py)*** - a library for installing desired web browser's driver
- ***[config.ini](https://github.com/skvmane/limehome-demo/blob/master/resources/config.ini)*** - used to configure the system under test url ([Super Calculator](http://juliemr.github.io/protractor-demo/)) and desired browser
## Preconditions
A precondition for running the tests is having [Robot Framework](https://robotframework.org/) and [SeleniumLibrary](SeleniumLibrary/) installed, and they in turn require [Python](https://www.python.org/). Robot Framework [installation instructions](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst) cover both Robot and Python installations, and SeleniumLibrary has its own [installation instructions](https://github.com/robotframework/SeleniumLibrary#installation).

In practice it is easiest to install Robot Framework and SeleniumLibrary along with its dependencies using pip package manager. Once you have pip installed, all you need to do is running these commands:
>pip install -r requirements.txt
## Run tests
The test cases are located in the `test_suites` directory. They can be executed from terminal using `robot` command:
>robot calc_demo_suite.robot
