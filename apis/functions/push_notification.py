from django.utils import timezone
from oauth2client.service_account import ServiceAccountCredentials
from .._models.google import GoogleApi
from datetime import timedelta
import requests
import asyncio

class SendNotification:

    url = 'https://fcm.googleapis.com/v1/projects/squalify-119ee/messages:send'
    scope = 'https://www.googleapis.com/auth/firebase.messaging'
    service_account = 'service-account.json'
    message = None
    sound = False
    data = None
    access_token = None

    def __init__(self, message, data, sound=False):
        self.message = message
        self.sound = sound
        self.data = data
        self.get_access_token()

    def get_access_token(self):
        def request_token():
            credentials = ServiceAccountCredentials.from_json_keyfile_name(self.service_account, self.scope)
            access_token_info = credentials.get_access_token()
            return access_token_info.access_token

        """check whether access token had been saved or not"""
        if GoogleApi.objects.count() == 1:
            instance = GoogleApi.objects.get(pk=1)
            access_token = None
            if instance.token_expiry <= timezone.now():
                access_token = instance.access_token
            else:
                expire_on = timezone.now() + timedelta(hours=1)
                instance.access_token = request_token()
                instance.token_expiry = expire_on
                instance.save()
                access_token = instance.access_token
            self.access_token = access_token
        
        access_token = request_token()
        expire_on = timezone.now() + timedelta(hours=1)
        GoogleApi.objects.create(access_token=access_token, token_expiry=expire_on)
        self.access_token = access_token

    def headers(self):
        return {
            'Authorization': 'Bearer ' + self.access_token,
            'Content-Type': 'application/json; UTF-8'
        }
    
    def body(self, token):
        body = {
            'message': {
                'token': token,
                'notification': {
                    'title': 'New post',
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
    
    def send(self, token):
        send = requests.post(self.url, json=self.body(token), headers=self.headers())
        print(send.json())
    
    def send_group(self, members):
        tasks = []
        async def send_notif(token):
            send = await requests.post(self.url, json=self.body(token), headers=self.headers())
            print(send)
        for member in members:
            token = member.fcm_token
            tasks.append(asyncio.ensure_future(send_notif(token)))
        event_loop = asyncio.get_event_loop()
        gather = asyncio.gather(*tasks)
        event_loop.run_until_complete(gather)
        event_loop.close()
