import requests

token = '36e12f12588bea1b2714239efd1b268819601b2c'

headers = {
    'Authorization': f'Token {token}',
    'Accept': 'application/json; version=1.0'
}

get = requests.get('http://localhost:8030/v1/profile/2/', headers=headers)
print(get.json())