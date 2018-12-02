from django.urls import reverse
from django.template.defaultfilters import floatformat
from django.contrib.humanize.templatetags.humanize import intcomma
from rest_framework import serializers
from rest_framework_recursive.fields import RecursiveField

from apps.app import models as app_models
from apps.store import models as store_models


class SpecificationSerializer(serializers.ModelSerializer):

    class Meta:
        model = store_models.Specification
        fields = ['name', ]


class ProductSerializer(serializers.ModelSerializer):
    brand = serializers.CharField(source='brand.title')
    category = serializers.CharField(source='category.title')
    category_id = serializers.CharField(source='category.id')
    specifications = serializers.SerializerMethodField()
    cost = serializers.SerializerMethodField()
    real_cost = serializers.FloatField(source='cost')
    qty_rev = serializers.SerializerMethodField()

    url = serializers.HyperlinkedIdentityField(view_name='restful:product_detail', lookup_url_kwarg='slug')
    reviews = serializers.SerializerMethodField()
    short_description = serializers.SerializerMethodField()

    class Meta:
        model = store_models.Product
        fields = '__all__'
        extra_fields = ['url']

    def get_reviews(self, obj):
        return self.context['request'].build_absolute_uri(reverse('restful:product_reviews', args=[obj.pk]))

    @staticmethod
    def get_specifications(obj):
        return [item.name for item in obj.specifications.all()]

    @staticmethod
    def get_cost(obj):
        return "{} so'm".format(str(intcomma(floatformat(obj.cost))).replace(',', ' '))

    @staticmethod
    def get_qty_rev(obj):
        return obj.reviews.count()

    @staticmethod
    def get_short_description(obj):
        return obj.description[0:50]


class CategorySerializer(serializers.ModelSerializer):
    children = RecursiveField(many=True, required=False, )

    class Meta:
        model = app_models.Category
        fields = '__all__'
        extra_fields = ['children']


class BrandSerializer(serializers.ModelSerializer):
    category = serializers.CharField(source='category.title')
    products_count = serializers.SerializerMethodField()

    class Meta:
        model = app_models.Brand
        fields = '__all__'
        extra_fields = ['products_count', ]

    @staticmethod
    def get_products_count(obj):
        return obj.products.count()


class ReviewSerializer(serializers.ModelSerializer):
    author = serializers.CharField(source='author.get_full_name')
    date_of_created = serializers.DateTimeField(source='data_of_created', format='%Y-%m-%d, %H:%I')

    class Meta:
        model = store_models.Review
        fields = ['author', 'date_of_created', 'rate', 'comment']
