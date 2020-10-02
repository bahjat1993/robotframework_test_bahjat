# Author: Bahjat Murrad
# Date: 01/10/2020
# Description: This file contains all the keywords that are used for Robot Framework

import datetime
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait     # Would use this if given more time
from selenium.webdriver.support import expected_conditions as EC    # Would use this if given more time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys     # Used to send keys like ESC
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver import ActionChains     # For actions
import selenium.common.exceptions



import time
from selenium import webdriver
from robot.libraries.BuiltIn import BuiltIn


def click_accept_google_terms(driver):
    """
    @brief:     This method checks to see if a pop up box has appeared and if it has, it accepts it. If it hasn't it
                returns a -1

    """
    try:
        driver.switch_to.frame(0)       # Switching to the pop up window
        driver.find_element_by_css_selector("#introAgreeButton > span > span").click()   # Clicking the accept box
        driver.switch_to.default_content()
    except selenium.common.exceptions.NoSuchFrameException:
        # TO DO, have a catch scenario for if the agree button is not their
        return -1


def setup_function():
    """
    @brief:     Setups up the chrome driver
                TO DO, if given more time i would pass the argument for where chromedriver.exe is stored
    """
    return webdriver.Chrome("python_methods\\chromedriver.exe")


def switch_to_frame_via_number(driver, name_of_frame):
    """
    @Brief:         This method switches the frame of the screen to the specified name
                    I haven't used a try and except
    """
    driver.switch_to.frame(int(name_of_frame))       # Switching to the pop up window

def send_keys_to_css_selector(driver, css_selector, text):
    """
    @brief:             This method sends keys to a selected css selector
    """
    css_selector = str(css_selector).replace("\"", "")
    text = str(text).replace("\"", "")
    driver.find_element_by_css_selector(css_selector).send_keys(text)


def find_specific_css_selector_and_click(driver, css_selector):
    """
    @brief:     This method finds the specific CSS selector and clicks it.
    """
    # try:
    css_selector = str(css_selector).replace("\"", "")
    BuiltIn().log_to_console(css_selector)
    BuiltIn().log_to_console(type(css_selector))
    driver.find_element_by_css_selector(css_selector).click()


def get_current_url(driver):
    """
    @brief:     This method gets the current url of the page and returns it
    """
    return driver.current_url


def visit_website(driver, website_name):
    website_name = str(website_name).replace("\"", "")  # Replacing the speech marks
    # BuiltIn().log_to_console("Last line")
    # BuiltIn().log_to_console(website_name)
    driver.get(website_name)


def maximize_window(driver):
    """
    @brief:         This method just maximizes the window
    """
    driver.maximize_window()


def read_css_selector(driver, css_selector):
    """
    @brief:         This method reads the text that is stored in the css_selector
    """
    css_selector = str(css_selector).replace("\"", "")
    return driver.find_element_by_css_selector(css_selector).text

