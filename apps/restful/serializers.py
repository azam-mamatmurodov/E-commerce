from django.urls import reverse
from django.template.defaultfilters import floatformat
from django.contrib.humanize.templatetags.humanize import intcomma
from django.contrib.auth.models import User
from rest_framework import serializers
from rest_framework_recursive.fields import RecursiveField

from apps.app import models as app_models
from apps.store import models as store_models


class SpecificationSerializer(serializers.ModelSerializer):

    class Meta:
        model = store_models.Specification
        fields = ['name', ]


class ProductImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = store_models.ProductImage
        fields = ['image']


class ProductSerializer(serializers.ModelSerializer):
    brand = serializers.SerializerMethodField()
    category = serializers.CharField(source='category.title')
    category_id = serializers.CharField(source='category.id')
    category_slug = serializers.CharField(source='category.slug')
    category_root = serializers.SerializerMethodField()
    specifications = serializers.SerializerMethodField()
    price_with_currency = serializers.SerializerMethodField()
    qty_rev = serializers.SerializerMethodField()
    images = serializers.SerializerMethodField()

    reviews = serializers.SerializerMethodField()
    short_description = serializers.SerializerMethodField()

    class Meta:
        model = store_models.Product
        fields = '__all__'
        extra_fields = ['url', 'category_root', 'category_slug', ]

    def get_reviews(self, obj):
        return self.context['request'].build_absolute_uri(reverse('restful:product_reviews', args=[obj.pk]))

    @staticmethod
    def get_specifications(obj):
        return [{"specification_type": item.specification_type.name, "info": item.info} for item in obj.specifications.all()]

    @staticmethod
    def get_price_with_currency(obj):
        return "{} сўм".format(str(intcomma(floatformat(obj.price))).replace(',', ' '))

    @staticmethod
    def get_qty_rev(obj):
        return obj.reviews.count()

    @staticmethod
    def get_short_description(obj):
        return obj.description[0:50]

    def get_images(self, obj):
        return [self.context['request'].build_absolute_uri(image_instance.image.url) for image_instance in obj.colors.all()]

    @staticmethod
    def get_category_root(obj):
        return [
            {
                'id': cat.id,
                'slug': cat.slug,
                'title': cat.title
            }
            for cat in obj.category.get_family()
        ]

    @staticmethod
    def get_brand(obj):
        return {
            'title': obj.brand.title,
            'id': obj.brand.id
        } or None


class CategorySerializer(serializers.ModelSerializer):
    children = RecursiveField(many=True, required=False, )

    class Meta:
        model = app_models.Category
        fields = ['id', 'title', 'slug', 'icon', 'tree', 'parent', 'children', 'is_url', 'url', ]


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


class SliderSerializer(serializers.ModelSerializer):

    class Meta:
        model = app_models.Slider
        fields = ['image']


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name', ]


class CartItemSerializer(serializers.ModelSerializer):

    class Meta:
        model = store_models.CartItem
        fields = ['product', 'quantity', 'total_price', ]

    def to_representation(self, instance):
        result = super().to_representation(instance)
        result['product'] = instance.product.title
        return result


class OrderSerializer(serializers.ModelSerializer):
    cart_items = CartItemSerializer(many=True)
    order_status = serializers.SerializerMethodField(read_only=True)

    @staticmethod
    def get_order_status(obj):
        return obj.get_order_status(obj.order_status)

    def create(self, validated_data):
        cart_items = validated_data.pop('cart_items')
        validated_data['customer'] = self.context['request'].user
        order = store_models.Order.objects.create(**validated_data)
        for cart_item in cart_items:
            store_models.CartItem.objects.create(**cart_item, order=order)
        return order

    class Meta:
        model = store_models.Order
        exclude = ['customer', ]
