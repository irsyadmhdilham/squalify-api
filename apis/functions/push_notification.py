from django.utils import timezone
from oauth2client.service_account import ServiceAccountCredentials
from .._models.google import GoogleApi
from datetime import timedelta
import requests
import asyncio
from functools import partial

class NotificationInit:

    url = 'https://fcm.googleapis.com/v1/projects/squalify-119ee/messages:send'
    scope = 'https://www.googleapis.com/auth/firebase.messaging'
    service_account = 'service-account.json'
    message = None
    title = None
    sound = False
    data = None
    access_token = None

    def __init__(self, title, message, data, sound=False):
        self.message = message
        self.title = title
        self.sound = sound
        self.data = data
        self.get_access_token()

    def get_access_token(self):
        def request_token():
            credentials = ServiceAccountCredentials.from_json_keyfile_name(self.service_account, self.scope)
            access_token_info = credentials.get_access_token()
            return access_token_info.access_token

        """check whether access token had been saved or not"""
        if GoogleApi.objects.count() > 0:
            instance = GoogleApi.objects.all()[0]
            access_token = None
            if instance.token_expiry <= timezone.now():
                expire_on = timezone.now() + timedelta(hours=1)
                instance.access_token = request_token()
                instance.token_expiry = expire_on
                instance.save()
                access_token = instance.access_token
            else:
                access_token = instance.access_token
            self.access_token = access_token
        else:
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
                    'title': self.title,
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
    
    def send(self, fcm_token):
        event_loop = asyncio.new_event_loop()
        asyncio.set_event_loop(event_loop)
        async def send_notif(token):
            loop = asyncio.get_event_loop()
            data = {
                'url': self.url,
                'json': self.body(token),
                'headers': self.headers()
            }
            return await loop.run_in_executor(None, partial(requests.post, **data))
        tasks = []
        for fcm in fcm_token.all():
            tasks.append(asyncio.ensure_future(send_notif(fcm.token)))
        gather = asyncio.gather(*tasks)
        event_loop.run_until_complete(gather)
        event_loop.close()
    
    def send_group(self, members):
        event_loop = asyncio.new_event_loop()
        asyncio.set_event_loop(event_loop)
        tasks = []
        async def send_notif(token):
            loop = asyncio.get_event_loop()
            data = {
                'url': self.url,
                'json': self.body(token),
                'headers': self.headers()
            }
            return await loop.run_in_executor(None, partial(requests.post, **data))

        for member in members:
            for fcm in member.fcm_token.all():
                tasks.append(asyncio.ensure_future(send_notif(fcm.token)))
        gather = asyncio.gather(*tasks)
        event_loop.run_until_complete(gather)
        event_loop.close()
