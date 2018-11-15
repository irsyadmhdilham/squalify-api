from django.urls import include
from django.conf.urls import url

app_name = 'apis'

urlpatterns = [
    url(r'^v1/', include('apis.v1.urls', namespace='v1'))
]