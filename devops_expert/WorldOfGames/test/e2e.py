import os
import sys
from selenium.webdriver.common.by import By
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from webdriver_manager.chrome import ChromeDriverManager


def test_scores_service():
    if os.getenv("url_score"):
        url_score = str(os.getenv("url_score"))
    else:
        url_score = input("enter the url of the score: ")
    driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()))
    driver.get(url_score)
    score = int(driver.find_element(By.ID, "score").text)
    if 0 <= score <= 1000:
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
