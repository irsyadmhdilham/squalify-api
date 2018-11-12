from django.urls import path, include
from apis.v1.urls import router

urlpatterns = [
    path('v1/', include(router.urls))
]