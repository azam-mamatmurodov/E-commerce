from django.db import models
from mptt.models import MPTTModel
from mptt.fields import TreeForeignKey


class Category(MPTTModel):
    title = models.CharField(max_length=250)
    slug = models.SlugField(max_length=255, null=True)
    parent = TreeForeignKey('self', null=True, blank=True, on_delete=models.CASCADE, related_name='children')
    tree = models.BooleanField(default=False, verbose_name='As tree ?')

    def __str__(self):
        return self.title

    class MPTTMeta:
        order_insertion_by = ['title']


class Brand(models.Model):
    title = models.CharField(max_length=250)
    category = TreeForeignKey(Category, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.title
