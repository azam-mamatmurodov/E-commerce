from django.db import models
from django.contrib.auth.models import User
from mptt.fields import TreeForeignKey

from apps.app import models as app_models


class Product(models.Model):
    title = models.CharField(max_length=250)
    price = models.FloatField(verbose_name='Price')
    image = models.ImageField(verbose_name='Main image')
    category = TreeForeignKey(app_models.Category, on_delete=models.CASCADE)
    slug = models.SlugField(max_length=254)
    brand = models.ForeignKey(app_models.Brand, null=True, blank=True, on_delete=models.CASCADE, related_name='products')
    description = models.TextField(null=True, blank=True)
    quantity = models.IntegerField(default=1)

    featured = models.BooleanField(default=False)
    new = models.BooleanField(default=False)
    top_rated = models.BooleanField(default=False)

    def __str__(self):
        return self.title


class ProductImage(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='colors')
    image = models.ImageField()

    def __str__(self):
        return "{}".format(self.product.title)


class SpecificationType(models.Model):
    name = models.CharField(max_length=254)

    def __str__(self):
        return "{}".format(self.name)


class Specification(models.Model):
    specification_type = models.ForeignKey(SpecificationType, null=True, on_delete=models.CASCADE)
    info = models.CharField(max_length=250, null=True)
    product = models.ForeignKey('Product', on_delete=models.CASCADE, related_name='specifications')

    def __str__(self):
        return "{}".format(self.info)


class Review(models.Model):
    comment = models.TextField()
    rate = models.PositiveIntegerField(default=5)
    data_of_created = models.DateTimeField(auto_now_add=True)
    author = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, related_name='reviews')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='reviews')
