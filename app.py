import requests

data = {
    'email': 'irsyadmhdilham@gmail.com',
    'password': 'Irsyad89'
}

req = requests.post('http://localhost:8030/account/create-account', data=data)

print(req.text)