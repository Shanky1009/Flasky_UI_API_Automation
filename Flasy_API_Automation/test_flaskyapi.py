import json

import pytest
import requests

from requests.auth import HTTPBasicAuth
from random import *


@pytest.fixture
def test_get_token():
    a = "Get Authentication API - Route /api/auth/token"
    print(a)

    url = 'http://127.0.0.1:8080/api/auth/token'

    headers = {'Content-Type': 'application/json'}

    response = requests.get(url, headers=headers, auth=HTTPBasicAuth('Demo1', 'Demo@1234'))

    assert (response.status_code == 200), "Status code does not match. Instead got : " + str(response.status_code)

    print("Basic Authentication Token is Generated:" + str(response.content))

    print(response.json())

    resp_body = response.json()

    assert resp_body['status'] == "SUCCESS", "Data does not matched! Expected : SUCCESS, but found : " + str(
        resp_body['status'])

    pytest.token = response.json()['token']

    print(pytest.token)


@pytest.fixture
def test_get_users(test_get_token):
    b = "2. Review users registered in system - Route /api/users"
    print(b)

    x = randint(1, 100)  # Pick a random number between 1 and 100.
    y = str(x)
    print(y)

    pytest.y = y
    pytest.x = x

    token = pytest.token
    print(token)

    url = 'http://127.0.0.1:8080/api/users'

    headers = {'Content-Type': 'application/json', 'Token': token}

    response = requests.get(url, headers=headers)

    assert (response.status_code == 200), "Status code does not match. Instead got : " + str(response.status_code)

    print(response.json())

    resp_body = response.json()

    assert resp_body['status'] == "SUCCESS", "Data does not matched! Expected : SUCCESS, but found : " + str(
        resp_body['status'])


@pytest.fixture
def test_post_users(test_get_users):
    c = "1. Register new users - Route /api/users"
    print(c)

    y = pytest.y
    print(y)

    x = pytest.x
    print(x)

    token = pytest.token
    print(token)

    url = 'http://127.0.0.1:8080/api/users'

    headers = {'Content-Type': 'application/json'}

    payload = {'username': 'Test{0}'.format(y), 'password': '1234{0}'.format(x), 'firstname': 'Testing{0}'.format(y),
               'lastname': 'Tes{0}'.format(y), 'phone': '98764532{0}'.format(x)}

    response = requests.post(url, headers=headers, data=json.dumps(payload, indent=4))

    assert (response.status_code == 201), "Status code does not match. Instead got : " + str(response.status_code)

    print(response.json())

    resp_body = response.json()

    assert resp_body['status'] == "SUCCESS", "Data does not matched! Expected : SUCCESS, but found : " + str(
        resp_body['status'])

    assert resp_body['message'] == "Created", "User not created! Expected : Created, but found : " + str(
        resp_body['message'])

    pytest.newUsername = 'Test{0}'.format(y)

    print(pytest.newUsername)


@pytest.fixture
def test_get_users_details(test_post_users):
    d = "3. If authenticated I can get personal information of users - Route /api/users/{username}"
    print(d)

    token = pytest.token
    print(token)

    username = pytest.newUsername
    print(username)

    url = 'http://127.0.0.1:8080/api/users/{0}'.format(username)

    headers = {'Content-Type': 'application/json', 'Token': token}

    response = requests.get(url, headers=headers)

    assert (response.status_code == 200), "Status code does not match. Instead got : " + str(response.status_code)

    print(response.json())

    resp_body = response.json()

    assert resp_body['status'] == "SUCCESS", "Data does not matched! Expected : SUCCESS, but found : " + str(
        resp_body['status'])

    assert resp_body['message'] == "retrieval succesful", "User details not retrieved! " \
                                                          "Expected : retrieval succesful, but found : " \
                                                          + str(resp_body['message'])

    pytest.putUsername = username

    print(pytest.putUsername)


@pytest.fixture
def test_put_users(test_get_users_details):
    e = "4. If authenticated I can update personal information of users - Route /api/users/{username}"
    print(e)

    y = pytest.y
    print(y)

    x = pytest.x
    print(x)

    token = pytest.token
    print(token)

    put_username = pytest.putUsername
    print(put_username)

    url = 'http://127.0.0.1:8080/api/users/{0}'.format(put_username)

    headers = {'Content-Type': 'application/json', 'Token': token}

    # payload = {'username': 'Test{0}'.format(y), 'password': '1234{0}'.format(x), 'firstname': 'Testing{0}'.format(y),
    #            'lastname': 'Yad{0}'.format(y), 'phone': '98764532{0}'.format(x)}

    payload = {'lastname': 'Yad{0}'.format(y)}

    response = requests.put(url, headers=headers, data=json.dumps(payload, indent=4))

    assert (response.status_code == 201), "Status code does not match. Instead got : " + str(response.status_code)

    print(response.json())

    resp_body = response.json()

    assert resp_body['status'] == "SUCCESS", "Field is not updated! Expected : SUCCESS, but found : " + str(
        resp_body['status'])

    assert resp_body['message'] == "Updated", "Field is not updated! " \
                                              "Expected : Updated, but found : " \
                                              + str(resp_body['message'])

    pytest.updatedUsername = put_username

    print(pytest.updatedUsername)


def test_get_updated_users_details(test_put_users):
    f = "Review Updated User Information - Route /api/users/{username}"
    print(f)

    token = pytest.token
    print(token)

    updated_username = pytest.updatedUsername
    print(updated_username)

    url = 'http://127.0.0.1:8080/api/users/{0}'.format(updated_username)

    headers = {'Content-Type': 'application/json', 'Token': token}

    response = requests.get(url, headers=headers)

    assert (response.status_code == 200), "Status code does not match. Instead got : " + str(response.status_code)

    print(response.json())

    resp_body = response.json()

    assert resp_body['status'] == "SUCCESS", "Data does not matched! Expected : SUCCESS, but found : " + str(
        resp_body['status'])

    assert resp_body['message'] == "retrieval succesful", "User details not retrieved! " \
                                                          "Expected : retrieval succesful, but found : " \
                                                          + str(resp_body['message'])
