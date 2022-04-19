import configparser


class ParserLib:

    def __init__(self):
        self.__parser = configparser.ConfigParser()
        self.__parser.read('../resources/config.ini')

    def get_browser(self):
        browser = self.__parser.get('DEFAULT', 'browser')
        return browser.lower()

    def get_url(self):
        url = self.__parser.get('DEFAULT', 'url')
        return url.lower()