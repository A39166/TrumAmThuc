from django.contrib import admin
from django.urls import path
from . import views
urlpatterns = [
    # REST API endpoints
    path('', views.home_api, name="home"),
    path('cart/', views.cart_api, name="cart"),
    path('checkout/', views.checkout_api, name="checkout"),
    path('search/', views.search_api, name="search"),
    path('update_item/', views.updateItem_api, name="update_item"),
    path('register/', views.register_api, name="register"),
    path('login/', views.loginPage_api, name="login"),
    path('logout/', views.logoutPage_api, name="logout"),
    path('category/', views.category_api, name="category"),
]
