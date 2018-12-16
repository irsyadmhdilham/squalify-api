import requests
from oauth2client.service_account import ServiceAccountCredentials

PROJECT_ID = 'squalify-119ee'
BASE_URL = 'https://fcm.googleapis.com'
SCOPE = 'https://www.googleapis.com/auth/firebase.messaging'


def get_access_token():
    credentials = ServiceAccountCredentials.from_json_keyfile_name('service-account.json', SCOPE)
    access_token_info = credentials.get_access_token()
    return access_token_info.access_token

url = 'https://fcm.googleapis.com/v1/projects/squalify-119ee/messages:send'
headers = {
    'Authorization': 'Bearer ' + get_access_token(),
    'Content-Type': 'application/json; UTF-8'
}
body = {
    "message": {
        "token": "fY1JR86nGe4:APA91bHCHWTmO2j_D_YJ_UA6EPyMO8ODRlC0MBkWQBenIJir54_WkXLZo16LVHFLv44ZMWYlrCeW8f_awLQAAVjc7ei7vv_md1l2bKCMfZ8sSa79aP2WUmWEYzhq2G2-vQdAboh8x0AW",
        "notification": {
            "title": "Squalify",
            "body": "This is a test notification"
        },
        "data": {
            "story_id": "story_12345"
        }
    }
}

send = requests.post(url, json=body, headers=headers)
print(send.json())