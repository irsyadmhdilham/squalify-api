from django.contrib import admin

from ._models.agency import Agency
from ._models.company import Company
from ._models.industry import Industry
from ._models.group import Group
from ._models.inbox import Inbox, Conversation
from ._models.notification import Notification, NotificationType
from ._models.point import Point, PointField
from ._models.profile import Profile, Designation
from ._models.contact import Contact, ContactStatus, ContactType
from ._models.schedule import Schedule
from ._models.sales import Sales, SalesType, Surcharge, SalesStatus
from ._models.post import Post, PostType

admin.site.register(Industry)
admin.site.register(Company)
admin.site.register(Agency)

admin.site.register(Group)

admin.site.register(Conversation)
admin.site.register(Inbox)

admin.site.register(NotificationType)
admin.site.register(Notification)

admin.site.register(PointField)
admin.site.register(Point)

admin.site.register(Designation)
admin.site.register(Profile)

admin.site.register(ContactStatus)
admin.site.register(Contact)
admin.site.register(ContactType)

admin.site.register(Schedule)

admin.site.register(SalesType)
admin.site.register(Sales)
admin.site.register(Surcharge)
admin.site.register(SalesStatus)

admin.site.register(PostType)
admin.site.register(Post)