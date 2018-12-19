import requests
from datetime import datetime
from oauth2client.service_account import ServiceAccountCredentials

def get_access_token():
    SCOPE = 'https://www.googleapis.com/auth/firebase.messaging'
    credentials = ServiceAccountCredentials.from_json_keyfile_name('service-account.json', SCOPE)
    access_token_info = credentials.get_access_token()
    return access_token_info.access_token

url = 'https://fcm.googleapis.com/v1/projects/squalify-119ee/messages:send'
headers = {
    'Authorization': 'Bearer ' + get_access_token(),
    'Content-Type': 'application/json; UTF-8'
}
body = {
    'message': {
        'token': 'dcjNL6n5gEo:APA91bFT8gCtQEKQee8tUtFNTsUfxS7X-7qPZ1ZVFiezVgWpb4A2wDalMr87igWGDLU6SDhd3AbQIw5fIps0SYOSVQ6WO4k2lIv3JsRYfjH_pKRVMqvQN_KeCLxa_K-5fsvJe-OLh3Es',
        'notification': {
            'title': 'Squalify',
            'body': 'This is a test notification'
        },
        'android': {
            'notification': {
                'sound': 'default'
            }
        },
        'apns': {
            'payload': {
                'aps': {
                    'sound': 'default'
                }
            }
        },
        'data': {
            'story_id': 'story_12345'
        }
    }
}

# send = requests.post(url, json=body, headers=headers)
# print(send.json())