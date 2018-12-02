from django.contrib import admin
from apps.app import models as app_models


class CategoryAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('title', )}


admin.site.register(app_models.Category, CategoryAdmin)
admin.site.register(app_models.Brand)
