from django.shortcuts import render,redirect
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import *
from .serializers import *
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
import json
# Create your views here.

# def home_api(request):
#     if request.user.is_authenticated:
#         customer = request.user
#         order, created = Order.objects.get_or_create(customer=customer,complete=False)
#         items = order.orderitem_set.all()
#         cartItems = order.get_cart_items
#         user_not_login = "hidden"
#         user_login = "show"
#     else:
#         items = []
#         order = {'get_cart_items':0,'get_cart_totalprice':0}
#         cartItems = order['get_cart_items']
#         user_not_login = "show"
#         user_login = "hidden"
#     categories = Category.objects.filter(is_sub = False)
#     active_category = request.GET.get('category','')
#     products = Product.objects.all()
#     context = {'active_category':active_category,'categories':categories,'products': products,'cartItems':cartItems,'user_not_login':user_not_login,'user_login':user_login}
#     return render(request, 'app/home.html',context)
# def cart_api(request):
#     if request.user.is_authenticated:
#         customer = request.user
#         order, created = Order.objects.get_or_create(customer=customer,complete=False)
#         items = order.orderitem_set.all()
#         cartItems = order.get_cart_items
#         user_not_login = "hidden"
#         user_login = "show"
#     else:
#         items = []
#         order = {'get_cart_items':0,'get_cart_totalprice':0}
#         cartItems = order['get_cart_items']
#         user_not_login = "show"
#         user_login = "hidden"
#     categories = Category.objects.filter(is_sub = False)
#     active_category = request.GET.get('category','')
#     context = {'active_category':active_category,'categories':categories,'items':items,'order':order,'cartItems':cartItems,'user_not_login':user_not_login,'user_login':user_login}
#     return render(request, 'app/cart.html', context)

# def checkout_api(request):
#     bill = ShippingAddress()
#     if request.user.is_authenticated:
#         customer = request.user
#         order, created = Order.objects.get_or_create(customer=customer,complete=False)
#         items = order.orderitem_set.all()
#         cartItems = order.get_cart_items
#         user_not_login = "hidden"
#         user_login = "show"
#         if request.method == "POST":
#             bill = ShippingAddress(request.POST)
#             bill.customer=request.user
#             bill,create = ShippingAddress.objects.get_or_create(customer=customer,order=order)
#             bill.email = request.POST['email1']
#             bill.address = request.POST['address1']
#             bill.mobile = request.POST['mobile1']
#             bill.state = request.POST['state1']
#             bill.name = request.POST['name1']
#             bill.save()
#     else:
#         items = []
#         order = {'get_cart_items':0,'get_cart_totalprice':0}
#         cartItems = order['get_cart_items']
#         user_not_login = "show"
#         user_login = "hidden"
        
#     categories = Category.objects.filter(is_sub = False)
#     active_category = request.GET.get('category','')
#     context = {'bill':bill,'active_category':active_category,'categories':categories,'items':items,'order':order,'cartItems':cartItems,'user_not_login':user_not_login,'user_login':user_login}
#     return render(request, 'app/checkout.html', context)

# def search_api(request):
#     if request.method == "POST":
#         searched = request.POST["searched"]
#         keys = Product.objects.filter(name__contains = searched)
#     if request.user.is_authenticated:
#         customer = request.user
#         order, created = Order.objects.get_or_create(customer=customer,complete=False)
#         items = order.orderitem_set.all()
#         cartItems = order.get_cart_items
#         user_not_login = "hidden"
#         user_login = "show"
#     else:
#         items = []
#         order = {'get_cart_items':0,'get_cart_totalprice':0}
#         cartItems = order['get_cart_items']
#         user_not_login = "show"
#         user_login = "hidden"
#     categories = Category.objects.filter(is_sub = False)
#     active_category = request.GET.get('category','')
#     products = Product.objects.all()
#     context = {'active_category':active_category,'categories':categories,'searched':searched,'keys':keys,'products': products,'cartItems':cartItems,'user_not_login':user_not_login,'user_login':user_login}
#     return render(request, 'app/search.html',context)

# def updateItem_api(request):
#     data = json.loads(request.body)
#     productId=data['productId']
#     action=data['action']
#     customer = request.user
#     product = Product.objects.get(id=productId)
#     order, created = Order.objects.get_or_create(customer=customer,complete=False)
#     orderItem, created = OrderItem.objects.get_or_create(order=order,product=product)
#     if action =='add':
#         orderItem.quantity +=1
#     elif action =='remove':
#         orderItem.quantity -=1
#     orderItem.save()
#     if orderItem.quantity<=0:
#         orderItem.delete()
#     return JsonResponse('added', safe=False)

# def register_api(request):
#     form = CreateUserForm()
#     if request.method == "POST":
#         form = CreateUserForm(request.POST)
#         if form.is_valid():
#             form.save()
#         return redirect('login')
#     user_not_login = "show"
#     user_login = "hidden"
#     categories = Category.objects.filter(is_sub = False)
#     active_category = request.GET.get('category','')
#     context = {'active_category':active_category,'categories':categories,'form':form,'user_not_login':user_not_login,'user_login':user_login}
#     return render(request,'app/register.html',context)

# def loginPage_api(request):
#     if request.user.is_authenticated:
#         return redirect('home')
#     if request.method == "POST":
#         username = request.POST.get('username')
#         password = request.POST.get('password')
#         user = authenticate(request,username=username,password=password)
#         if user is not None:
#             login(request,user)
#             return redirect('home')
#         else: messages.info(request,'Tên đăng nhập hoặc Mật khẩu không đúng')
#     user_not_login = "show"
#     user_login = "hidden"
#     categories = Category.objects.filter(is_sub = False)
#     active_category = request.GET.get('category','')
#     context = {'active_category':active_category,'categories':categories,'user_not_login':user_not_login,'user_login':user_login}
#     return render(request,'app/login.html',context)

# def logoutPage_api(request):
#     logout(request)
#     return redirect('login')

# from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

# def category_api(request):
#     categories = Category.objects.filter(is_sub=False)
#     active_category = request.GET.get('category', '')
#     if active_category:
#         products = Product.objects.filter(category__slug=active_category)
#     else:
#         products = Product.objects.all()

#     # Phân trang
#     paginator = Paginator(products, 8)  # Số sản phẩm trên mỗi trang
#     page = request.GET.get('page')

#     try:
#         products = paginator.page(page)
#     except PageNotAnInteger:
#         # Nếu page không phải là số nguyên, hiển thị trang đầu tiên.
#         products = paginator.page(1)
#     except EmptyPage:
#         # Nếu page lớn hơn số trang có sẵn, hiển thị trang cuối cùng.
#         products = paginator.page(paginator.num_pages)

#     if request.user.is_authenticated:
#         customer = request.user
#         order, created = Order.objects.get_or_create(customer=customer, complete=False)
#         items = order.orderitem_set.all()
#         cartItems = order.get_cart_items
#         user_not_login = "hidden"
#         user_login = "show"
#     else:
#         items = []
#         order = {'get_cart_items': 0, 'get_cart_totalprice': 0}
#         cartItems = order['get_cart_items']
#         user_not_login = "show"
#         user_login = "hidden"
#     context = {'categories': categories, 'products': products, 'active_category': active_category,
#                'cartItems': cartItems, 'user_not_login': user_not_login, 'user_login': user_login}
#     return render(request, 'app/category.html', context)


# api
@api_view(['GET'])
def home_api(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        items = order.orderitem_set.all()
        cartItems = order.get_cart_items
        user_not_login = "hidden"
        user_login = "show"
    else:
        items = []
        order = {'get_cart_items': 0, 'get_cart_totalprice': 0}
        cartItems = order['get_cart_items']
        user_not_login = "show"
        user_login = "hidden"

    categories = Category.objects.filter(is_sub=False)
    active_category = request.GET.get('category', '')
    products = Product.objects.all()

    category_serializer = CategorySerializer(categories, many=True)
    product_serializer = ProductSerializer(products, many=True)

    # Trả về response tương ứng
    if request.accepted_renderer.format == 'json':
         # Nếu client yêu cầu dữ liệu JSON, trả về dữ liệu được serialize
        data = {
            'active_category': active_category,
            'categories': category_serializer.data,
            'products': product_serializer.data,
            'cartItems': cartItems,
            'user_not_login': user_not_login,
            'user_login': user_login
        }
        return Response(data)
    else:
       # Nếu client yêu cầu HTML, trả về trang HTML
        context = {
            'active_category': active_category,
            'categories': categories,
            'products': products,
            'cartItems': cartItems,
            'user_not_login': user_not_login,
            'user_login': user_login
        }
        return render(request, 'app/home.html', context)

@api_view(['GET'])
def cart_api(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        items = order.orderitem_set.all()
        cartItems = order.get_cart_items
        user_not_login = "hidden"
        user_login = "show"
    else:
        items = []
        order = {'get_cart_items': 0, 'get_cart_totalprice': 0}
        cartItems = order['get_cart_items']
        user_not_login = "show"
        user_login = "hidden"

    categories = Category.objects.filter(is_sub=False)
    active_category = request.GET.get('category', '')

    order_serializer = OrderSerializer(order)
    items_serializer = OrderItemSerializer(items, many=True)
    category_serializer = CategorySerializer(categories, many=True)

    if request.accepted_renderer.format == 'json':
         # Nếu client yêu cầu dữ liệu JSON, trả về dữ liệu được serialize
        data = {
            'active_category': active_category,
            'categories': category_serializer.data,
            'items': items_serializer.data,
            'order': order_serializer.data,
            'cartItems': cartItems,
            'user_not_login': user_not_login,
            'user_login': user_login
        }
        return Response(data)
    else:
       # Nếu client yêu cầu HTML, trả về trang HTML
        context = {
            'active_category': active_category,
            'categories': categories,
            'items': items,
            'order': order,
            'cartItems': cartItems,
            'user_not_login': user_not_login,
            'user_login': user_login
        }
        return render(request, 'app/cart.html', context)
    
@api_view(['POST', 'GET'])
def checkout_api(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        items = order.orderitem_set.all()
        cartItems = order.get_cart_items
        user_not_login = "hidden"
        user_login = "show"

        if request.method == "POST":
            serializer = ShippingAddressSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save(customer=customer, order=order)
                return redirect('checkout')  # Chuyển hướng sau khi lưu thành công

        else:  # request.method == "GET"
            serializer = ShippingAddressSerializer()  # Tạo một instance của serializer nếu method là GET

    else:  # Người dùng chưa đăng nhập
        items = []
        order = {'get_cart_items': 0, 'get_cart_totalprice': 0}
        cartItems = order['get_cart_items']
        user_not_login = "show"
        user_login = "hidden"
        serializer = None

    categories = Category.objects.filter(is_sub=False)
    active_category = request.GET.get('category', '')
    context = {
        'active_category': active_category,
        'categories': categories,
        'items': items,
        'order': order,
        'cartItems': cartItems,
        'user_not_login': user_not_login,
        'user_login': user_login,
        'serializer': serializer
    }
    return render(request, 'app/checkout.html', context)

@api_view(['POST'])
def search_api(request):
    if request.method == "POST":
        # Deserialize dữ liệu gửi lên từ form HTML bằng Serializer
        serializer = SearchSerializer(data=request.data)
        if serializer.is_valid():
            # Lấy dữ liệu đã được validate từ serializer
            searched = serializer.validated_data.get("searched")
            # Tìm kiếm sản phẩm trong cơ sở dữ liệu
            keys = Product.objects.filter(name__contains=searched)
            if request.user.is_authenticated:
                    customer = request.user
                    order, created = Order.objects.get_or_create(customer=customer,complete=False)
                    items = order.orderitem_set.all()
                    cartItems = order.get_cart_items
                    user_not_login = "hidden"
                    user_login = "show"
            else:
                items = []
                order = {'get_cart_items':0,'get_cart_totalprice':0}
                cartItems = order['get_cart_items']
                user_not_login = "show"
                user_login = "hidden"
            categories = Category.objects.filter(is_sub = False)
            active_category = request.GET.get('category','')
            products = Product.objects.all()
            context = {'active_category':active_category,'categories':categories,'searched':searched,'keys':keys,'products': products,
                       'cartItems':cartItems,'user_not_login':user_not_login,'user_login':user_login}
            return render(request, 'app/search.html', context)
        else:
            # Nếu dữ liệu không hợp lệ, trả về một phản hồi lỗi
            return Response(serializer.errors, status=400)
    else:
        # Nếu request không phải là phương thức POST, trả về phản hồi lỗi
        return Response({"error": "Method not allowed"}, status=405)

def updateItem_api(request):
    data = json.loads(request.body)
    productId = data['productId']
    action = data['action']
    customer = request.user
    product = Product.objects.get(id=productId)
    order, created = Order.objects.get_or_create(customer=customer, complete=False)
    orderItem, created = OrderItem.objects.get_or_create(order=order, product=product)
    if action == 'add':
        orderItem.quantity += 1
    elif action == 'remove':
        orderItem.quantity -= 1
    orderItem.save()
    if orderItem.quantity <= 0:
        orderItem.delete()
    return JsonResponse('added', safe=False)

@api_view(['POST', 'GET'])
def register_api(request):
    if request.method == "POST":
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            # Lưu dữ liệu vào cơ sở dữ liệu nếu dữ liệu hợp lệ
            serializer.save()
            return redirect('login')  # Chuyển hướng sau khi đăng ký thành công
    else:
        serializer = RegisterSerializer()  # Tạo một instance của serializer nếu method là GET
    user_not_login = "show"
    user_login = "hidden"
    categories = Category.objects.filter(is_sub=False)
    active_category = request.GET.get('category', '')
    context = {'active_category': active_category, 'categories': categories,'serializer': serializer,
               'user_not_login': user_not_login, 'user_login': user_login}
    return render(request, 'app/register.html', context)

@api_view(['POST', 'GET'])
def loginPage_api(request):
    if request.method == "POST":
        serializer = LoginSerializer(data=request.data)
        if serializer.is_valid():
            username = serializer.validated_data.get('username')
            password = serializer.validated_data.get('password')
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('home') 
            else:
                messages.info(request, 'Tên đăng nhập hoặc Mật khẩu không đúng')
    else:
        serializer = LoginSerializer()
    categories = Category.objects.filter(is_sub=False)
    active_category = request.GET.get('category', '')
    context = {'active_category': active_category, 'categories': categories, 'serializer': serializer}
    return render(request, 'app/login.html', context)

def logoutPage_api(request):
    logout(request)
    return redirect('login')

@api_view(['GET'])
def category_api(request):
    categories = Category.objects.filter(is_sub=False)
    active_category = request.GET.get('category', '')
    if active_category:
        products = Product.objects.filter(category__slug=active_category)
    else:
        products = Product.objects.all()

    paginator = Paginator(products, 8)
    page = request.GET.get('page')

    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        items = order.orderitem_set.all()
        cartItems = order.get_cart_items
        user_not_login = "hidden"
        user_login = "show"
    else:
        items = []
        order = {'get_cart_items': 0, 'get_cart_totalprice': 0}
        cartItems = order['get_cart_items']
        user_not_login = "show"
        user_login = "hidden"
    
    products_serializer = ProductSerializer(products, many=True)
    category_serializer = CategorySerializer(categories, many=True)
    if request.accepted_renderer.format == 'json':
         # Nếu client yêu cầu dữ liệu JSON, trả về dữ liệu được serialize
        data = {
            'active_category': active_category,
            'categories': category_serializer.data,
            'products': products_serializer.data,
            'cartItems': cartItems,
            'user_not_login': user_not_login,
            'user_login': user_login
        }
        return Response(data)
    else:
       # Nếu client yêu cầu HTML, trả về trang HTML
        context = {
            'active_category': active_category,
            'categories': categories,
            'products': products,
            'cartItems': cartItems,
            'user_not_login': user_not_login,
            'user_login': user_login
        }
        return render(request, 'app/category.html', context)