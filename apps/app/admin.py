from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User
from apps.app import models as app_models

from mptt.admin import DraggableMPTTAdmin


class CategoryAdmin(DraggableMPTTAdmin):
    list_display = ('tree_actions', 'indented_title', )  # Sane defaults.
    list_display_links = ('indented_title',)  # Sane defaults.
    prepopulated_fields = {'slug': ('title', )}


class ContentAdmin(admin.ModelAdmin):
    list_display = ['title', ]
    prepopulated_fields = {'slug': ('title', )}


class ProfileAdmin(admin.StackedInline):
    model = app_models.Profile
    can_delete = False


class UserAdmin(BaseUserAdmin):
    inlines = [ProfileAdmin, ]


admin.site.register(app_models.Category, CategoryAdmin)
admin.site.register(app_models.Brand)
admin.site.register(app_models.Slider)
admin.site.register(app_models.Content, ContentAdmin)
admin.site.unregister(User)
admin.site.register(User, UserAdmin)