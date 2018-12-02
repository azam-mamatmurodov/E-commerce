from django.contrib import admin

from apps.store import models as store_models


class ProductSpecificationInline(admin.TabularInline):
    model = store_models.Specification
    fields = ['specification_type', 'info']


class ProductImageInline(admin.StackedInline):
    model = store_models.ProductImage
    fields = ['image', ]


class ProductAdmin(admin.ModelAdmin):
    list_display = ['title', 'quantity']
    inlines = [ProductImageInline, ProductSpecificationInline]
    prepopulated_fields = {'slug': ('title',), }


admin.site.register(store_models.Product, ProductAdmin)
admin.site.register(store_models.Review, )
admin.site.register(store_models.SpecificationType, )
