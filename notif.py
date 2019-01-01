from apis.functions.push_notification import SendNotification

token = 'd2RAkFxyAyo:APA91bFH_3R913wvXXuXoKThM-cDjyGAlyryeaCv6swTqkUxe1UAoMlp0uC_D_jMyFG5kjdiUO2ORgMJmb7SWbgDtqbHz2LFoX03_ppcEr8tcx0ExRZtWT1H9CP6R36ud46_0yiRoAbW'
data = {
    'title': 'like post',
    'post_id': '3',
    'notif_id': '119'
}

notification = SendNotification(token, 'Ramlan liked your post', data, True)