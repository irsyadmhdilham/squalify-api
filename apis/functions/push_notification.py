import requests
from oauth2client.service_account import ServiceAccountCredentials

class SendNotification:

    url = 'https://fcm.googleapis.com/v1/projects/squalify-119ee/messages:send'
    scope = 'https://www.googleapis.com/auth/firebase.messaging'
    service_account = 'service-account.json'
    token = None
    message = None
    sound = False
    data = None

    def __init__(self, token, message, data, sound=False):
        self.token = token
        self.message = message
        self.sound = sound
        self.data = data

    def get_access_token(self):
        credentials = ServiceAccountCredentials.from_json_keyfile_name(self.service_account, self.scope)
        access_token_info = credentials.get_access_token()
        access_token = access_token_info.access_token
        return access_token

    def headers(self):
        return {
            'Authorization': 'Bearer ' + self.get_access_token(),
            'Content-Type': 'application/json; UTF-8'
        }
    
    def body(self):
        body = {
            'message': {
                'token': self.token,
                'notification': {
                    'title': 'Squalify',
                    'body': self.message
                },
                'data': self.data
            }
        }
        if self.sound:
            body['message']['android'] = {
                'notification': {
                    'sound': 'default'
                }
            }
            body['message']['apns'] = {
                'payload': {
                    'aps': {
                        'sound': 'default'
                    }
                }
            }
        return body
    
    def send(self):
        send = requests.post(self.url, json=self.body(), headers=self.headers())
        print(send.json())