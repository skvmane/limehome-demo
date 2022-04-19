from SeleniumLibrary.keywords import BrowserManagementKeywords
from ParserLib import ParserLib
# chrome
from webdriver_manager.chrome import ChromeDriverManager
# firefox
from webdriver_manager.firefox import GeckoDriverManager
# edge
from webdriver_manager.microsoft import EdgeChromiumDriverManager


class DriverManagerLib:
    driver_path = None
    parser = ParserLib()
    browser = parser.get_browser()

    @staticmethod
    def install_driver():
        if DriverManagerLib.browser == 'chrome':
            DriverManagerLib.driver_path = ChromeDriverManager().install()
        elif DriverManagerLib.browser == 'firefox':
            DriverManagerLib.driver_path = GeckoDriverManager().install()
        elif DriverManagerLib.browser == 'edge':
            DriverManagerLib.driver_path = EdgeChromiumDriverManager().install()
        else:
            raise ValueError('Browser {} is not supported'.format(DriverManagerLib.browser))

    @staticmethod
    def get_driver_path():
        return DriverManagerLib.driver_path

