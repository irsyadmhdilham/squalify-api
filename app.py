import requests

data = {
    'email': 'irsyadmhdilham@squalify.com',
    'password': 'Irsyad89',
    'name': 'Irsyad Mhd Ilham',
    'designation': 'Group Agency Manager',
    'agency_name': 'Vision Victory Empire',
    'industry': 'Unit trust investment',
    'company': 'Public Mutual'
}

url = 'http://localhost:8030/api/v1/create-account'

req = requests.post(url, data=data)

print(req.json())