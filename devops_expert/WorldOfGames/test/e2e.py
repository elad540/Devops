import os
import sys
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By


def test_scores_service():
    url_score = str(os.getenv("url_score"))
    if len(url_score) == 0:
        url_score = input("enter the url of the score: ")
    service = Service('./chromedriver')
    service.start()
    driver = webdriver.Remote(service.service_url)
    driver.get(url_score)
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
