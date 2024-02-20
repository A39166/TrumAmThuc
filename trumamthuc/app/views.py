from django.shortcuts import render,redirect
from django.http import HttpResponse,JsonResponse
from .models import *
import json
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.
def home(request):
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
    context = {'active_category':active_category,'categories':categories,'products': products,'cartItems':cartItems,'user_not_login':user_not_login,'user_login':user_login}
    return render(request, 'app/home.html',context)

def cart(request):
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
    context = {'active_category':active_category,'categories':categories,'items':items,'order':order,'cartItems':cartItems,'user_not_login':user_not_login,'user_login':user_login}
    return render(request, 'app/cart.html', context)

def checkout(request):
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
    context = {'active_category':active_category,'categories':categories,'items':items,'order':order,'cartItems':cartItems,'user_not_login':user_not_login,'user_login':user_login}
    return render(request, 'app/checkout.html', context)

def search(request):
    if request.method == "POST":
        searched = request.POST["searched"]
        keys = Product.objects.filter(name__contains = searched)
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
    context = {'active_category':active_category,'categories':categories,'searched':searched,'keys':keys,'products': products,'cartItems':cartItems,'user_not_login':user_not_login,'user_login':user_login}
    return render(request, 'app/search.html',context)

def updateItem(request):
    data = json.loads(request.body)
    productId=data['productId']
    action=data['action']
    customer = request.user
    product = Product.objects.get(id=productId)
    order, created = Order.objects.get_or_create(customer=customer,complete=False)
    orderItem, created = OrderItem.objects.get_or_create(order=order,product=product)
    if action =='add':
        orderItem.quantity +=1
    elif action =='remove':
        orderItem.quantity -=1
    orderItem.save()
    if orderItem.quantity<=0:
        orderItem.delete()
    return JsonResponse('added', safe=False)

def register(request):
    form = CreateUserForm()
    
    if request.method == "POST":
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
        return redirect('login')
    user_not_login = "show"
    user_login = "hidden"
    categories = Category.objects.filter(is_sub = False)
    active_category = request.GET.get('category','')
    context = {'active_category':active_category,'categories':categories,'form':form,'user_not_login':user_not_login,'user_login':user_login}
    return render(request,'app/register.html',context)

def loginPage(request):
    if request.user.is_authenticated:
        return redirect('home')
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request,username=username,password=password)
        if user is not None:
            login(request,user)
            return redirect('home')
        else: messages.info(request,'Tên đăng nhập hoặc Mật khẩu không đúng')
    user_not_login = "show"
    user_login = "hidden"
    categories = Category.objects.filter(is_sub = False)
    active_category = request.GET.get('category','')
    context = {'active_category':active_category,'categories':categories,'user_not_login':user_not_login,'user_login':user_login}
    return render(request,'app/login.html',context)

def logoutPage(request):
    logout(request)
    return redirect('login')

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

def category(request):
    categories = Category.objects.filter(is_sub=False)
    active_category = request.GET.get('category', '')
    if active_category:
        products = Product.objects.filter(category__slug=active_category)
    else:
        products = Product.objects.all()

    # Phân trang
    paginator = Paginator(products, 4)  # Số sản phẩm trên mỗi trang
    page = request.GET.get('page')

    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        # Nếu page không phải là số nguyên, hiển thị trang đầu tiên.
        products = paginator.page(1)
    except EmptyPage:
        # Nếu page lớn hơn số trang có sẵn, hiển thị trang cuối cùng.
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
    context = {'categories': categories, 'products': products, 'active_category': active_category,
               'cartItems': cartItems, 'user_not_login': user_not_login, 'user_login': user_login}
    return render(request, 'app/category.html', context)
