from django.urls import path
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView
)
from apps.restful import views

app_name = 'restful'

urlpatterns = [
    path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('token/verify/', TokenVerifyView.as_view(), name='token_verify'),
    path('categories/', views.CategoryListView.as_view(), name='categories'),
    path('categories/<slug:slug>/', views.CategoryDetailView.as_view(), name='category_detail'),
    path('categories/<slug>/root/', views.CategoryTreeView.as_view(), name='category_root_detail'),
    path('brands/', views.BrandListView.as_view(), name='brands'),
    path('products/', views.ProductListView.as_view(), name='products'),
    path('products/<slug:slug>/', views.ProductDetailView.as_view(), name='product_detail'),
    path('products/<int:pk>/reviews/', views.ProductReviewsView.as_view(), name='product_reviews'),
    path('sliders/', views.SlidersView.as_view(), name='sliders'),
    path('user/', views.UserDetailView.as_view(), name='user_detail'),
    path('orders/', views.OrdersView.as_view(), name='order_list'),
]
