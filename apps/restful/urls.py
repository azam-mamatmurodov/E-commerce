from django.urls import path

from apps.restful import views

app_name = 'restful'

urlpatterns = [
    path('categories/', views.CategoryListView.as_view(), name='categories'),
    path('categories/<slug:slug>/', views.CategoryDetailView.as_view(), name='category_detail'),
    path('categories/<slug>/root/', views.CategoryTreeView.as_view(), name='category_root_detail'),
    path('brands/', views.BrandListView.as_view(), name='brands'),
    path('products/', views.ProductListView.as_view(), name='products'),
    path('products/<slug:slug>/', views.ProductDetailView.as_view(), name='product_detail'),
    path('products/<int:pk>/reviews/', views.ProductReviewsView.as_view(), name='product_reviews'),
]
