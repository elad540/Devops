import requests
import json
parameters = {
    "lat": 40.71,
    "lon": -74
}
response = requests.get("https://reqbin.com/echo/get/json", params=parameters)
#### show status code of the response ####
print(response.status_code)
#### show response in json ####
print(response.json())
#### parse response.json ####
y = (response.json())
#### the response value of a key ####
print(y["success"])