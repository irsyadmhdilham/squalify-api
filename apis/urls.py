from django.urls import path, include

app_name = 'apis'
urlpatterns = [
    path('v1/', include('apis.v1.urls', namespace='v1'))
]