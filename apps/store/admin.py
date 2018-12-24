from django.contrib import admin
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
    image = ie_fields.Field(
        attribute='image',
        column_name='image',
        widget=ie_widgets.CharWidget()
    )
    category = ie_fields.Field(
        attribute='category',
        column_name='category',
        widget=ie_widgets.ForeignKeyWidget(app_models.Category, )
    )
    slug = ie_fields.Field(
        attribute='slug',
        column_name='slug',
        widget=ie_widgets.CharWidget()
    )
    brand = ie_fields.Field(
        attribute='brand',
        column_name='brand',
        widget=ie_widgets.ForeignKeyWidget(app_models.Brand, )
    )
    description = ie_fields.Field(
        attribute='description',
        column_name='description',
        widget=ie_widgets.CharWidget()
    )
    quantity = ie_fields.Field(
        attribute='quantity',
        column_name='quantity',
        widget=ie_widgets.IntegerWidget()
    )
    featured = ie_fields.Field(
        attribute='featured',
        column_name='featured',
        widget=ie_widgets.BooleanWidget()
    )
    new = ie_fields.Field(
        attribute='new',
        column_name='new',
        widget=ie_widgets.BooleanWidget()
    )
    top_rated = ie_fields.Field(
        attribute='top_rated',
        column_name='top_rated',
        widget=ie_widgets.BooleanWidget()
    )

    class Meta:
        model = store_models.Product
        # fields = ['category', ]


class ProductSpecificationInline(admin.TabularInline):
    model = store_models.Specification
    fields = ['specification_type', 'info']


class ProductImageInline(admin.StackedInline):
    model = store_models.ProductImage
    fields = ['image', ]


class ProductAdmin(ie_admin.ImportExportModelAdmin):
    resource_class = ProductResource
    formats = [ie_formats.XLS, ]
    list_display = ['title', 'quantity']
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
