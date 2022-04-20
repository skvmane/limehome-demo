### E2E Automation Project
## Project details:
E2E Automation Project is the framework written with [Robot Framework](https://robotframework.org/) and the corresponding [SeleniumLibrary](SeleniumLibrary/)
## Project structure:
- ***[main_page.robot](https://github.com/skvmane/limehome-demo/blob/master/pages/main_page.robot)*** - a resource file with reusable keywords and variables for the "Super Calculator" page
- ***[calc_demo_suite.robot](https://github.com/skvmane/limehome-demo/blob/master/test_suites/calc_demo_suite.robot)*** - a test suite containing tests related to "Super Calculator". This test has a workflow that is created using keywords in the imported resource file.
- ***[config.ini](https://github.com/skvmane/limehome-demo/blob/master/resources/config.ini)*** - used to configure the system under test url ([Super Calculator](http://juliemr.github.io/protractor-demo/)) and desired browser
- 
