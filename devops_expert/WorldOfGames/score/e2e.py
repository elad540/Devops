from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import sys, os


def test_scores_service():
    url = input("enter the url of the score: ")
    service = Service('/home/shahar/Downloads/chromedriver_linux64/chromedriver')
    service.start()
    driver = webdriver.Remote(service.service_url)
    driver.get(url)
    score = int(driver.find_element(By.ID, "score").text)
    if 1 < score < 1000:
        return True
    else:
        return False


def main_function():
    n = 0
    if test_scores_service():
        return sys.exit(n)
    else:
        n = "-1"
        return sys.exit(n)


main_function()
