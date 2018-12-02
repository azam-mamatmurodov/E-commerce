import django_filters
from mptt.forms import TreeNodeMultipleChoiceField, TreeNodeChoiceField

from apps.app import models as app_models
from apps.store import models as store_models


class ProductFilter(django_filters.FilterSet):
    min_price = django_filters.rest_framework.NumberFilter(field_name="cost", lookup_expr='gte')
    max_price = django_filters.rest_framework.NumberFilter(field_name="cost", lookup_expr='lte')

    class Meta:
        model = store_models.Product
        fields = ['available_in_stock',
                  'brand',
                  'featured',
                  'new',
                  'top_rated',
                  'min_price',
                  'max_price'
                  ]

    @property
    def qs(self):
        _qs = super().qs
        cat = self.request.GET.get('cat', None)
        if cat:
            category = app_models.Category.objects.get(pk=cat)
            cats = [cat]
            if category.children:
                for child_category in category.children.all():
                    cats.append(child_category.pk)
            _qs = _qs.filter(category_id__in=cats)
        return _qs
