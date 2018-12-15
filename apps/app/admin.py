from django.contrib import admin

from apps.app import models as app_models

from mptt.admin import DraggableMPTTAdmin


class CategoryAdmin(DraggableMPTTAdmin):
    list_display = ('tree_actions', 'indented_title', )  # Sane defaults.
    list_display_links = ('indented_title',)  # Sane defaults.
    prepopulated_fields = {'slug': ('title', )}


class ContentAdmin(admin.ModelAdmin):
    list_display = ['title', ]
    prepopulated_fields = {'slug': ('title', )}


admin.site.register(app_models.Category, CategoryAdmin)
admin.site.register(app_models.Brand)
admin.site.register(app_models.Slider)
admin.site.register(app_models.Content, ContentAdmin)
