from rest_framework import serializers
from .models import *
from django.contrib.auth.models import User

class OrderItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderItem
        fields = ['id', 'product', 'quantity']

class OrderSerializer(serializers.ModelSerializer):
    orderitem_set = OrderItemSerializer(many=True, read_only=True)

    class Meta:
        model = Order
        fields = ['id', 'orderitem_set']

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'
      
class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField(style={'input_type': 'password'})

    def validate(self, data):
        username = data.get('username')
        password = data.get('password')
        return data

class SearchSerializer(serializers.Serializer):
    searched = serializers.CharField(max_length=100,required=True)

class ShippingAddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShippingAddress
        fields = ['email', 'address', 'mobile', 'state', 'name']
class RegisterSerializer(serializers.ModelSerializer):
    username = serializers.CharField()
    email = serializers.CharField()
    first_name = serializers.CharField()
    last_name = serializers.CharField()
    password1 = serializers.CharField(write_only=True)
    password2 = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name', 'password1', 'password2']
    def validate(self, attrs):
        # Kiểm tra xem hai trường mật khẩu có giống nhau không
        if attrs['password1'] != attrs['password2']:
            raise serializers.ValidationError("Passwords do not match")
        return attrs

    def create(self, validated_data):
        # Loại bỏ trường mật khẩu thứ hai khi tạo người dùng mới
        del validated_data['password2']
        # Tạo người dùng mới với mật khẩu được mã hóa
        password = validated_data.pop('password1')
        user = User.objects.create_user(password=password,**validated_data)
        return user


