from django.urls import path, include
from account.urls import router as userRouter
from .v1 import urls

urlpatterns = [
    path('', include(userRouter.urls)),
    path('v1/', include(urls))
]