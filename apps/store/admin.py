from django.contrib import admin
from django.utils.text import slugify
from import_export import admin as ie_admin
from import_export import resources as ie_resources
from import_export import fields as ie_fields
from import_export import widgets as ie_widgets
from import_export.formats import base_formats as ie_formats

from apps.store import models as store_models
from apps.app import models as app_models


class ProductResource(ie_resources.ModelResource):
    id = ie_fields.Field(
        attribute='id',
        column_name='id',
        widget=ie_widgets.IntegerWidget()
    )
    title = ie_fields.Field(
        attribute='title',
        column_name='title',
        widget=ie_widgets.CharWidget()
    )
    price = ie_fields.Field(
        attribute='price',
        column_name='price',
        widget=ie_widgets.FloatWidget()
    )
    quantity = ie_fields.Field(
        attribute='quantity',
        column_name='quantity',
        widget=ie_widgets.IntegerWidget()
    )

    class Meta:
        model = store_models.Product
        fields = ['id', 'title', 'price', 'quantity', ]

    def after_import_instance(self, instance, new, **kwargs):
        instance.slug = slugify(instance.slug)
        instance.save()


class ProductSpecificationInline(admin.TabularInline):
    model = store_models.Specification
    fields = ['specification_type', 'info']


class ProductImageInline(admin.StackedInline):
    model = store_models.ProductImage
    fields = ['image', ]


class ProductAdmin(ie_admin.ImportExportModelAdmin):
    resource_class = ProductResource
    formats = [ie_formats.XLS, ]
    list_display = ['title', 'quantity', 'price', 'category', 'brand', 'featured', 'new', 'top_rated', ]
    search_fields = ['title', 'slug', 'description', ]
    list_filter = ['category', 'brand', 'featured', 'new', 'top_rated', ]
    inlines = [ProductImageInline, ProductSpecificationInline]
    prepopulated_fields = {'slug': ('title',), }


class CartItemInlineAdmin(admin.StackedInline):
    model = store_models.CartItem


class OrderAdmin(admin.ModelAdmin):
    inlines = [CartItemInlineAdmin, ]


admin.site.register(store_models.Product, ProductAdmin)
admin.site.register(store_models.Review, )
admin.site.register(store_models.SpecificationType, )
admin.site.register(store_models.Order, OrderAdmin)
