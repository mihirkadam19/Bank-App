from django.contrib import admin
from django.urls import path
from rootApp.views import home, user_profile
from empApp.views import emp_login, mgr_login, user_logout, create_customer, delete_customer, delete_employee, create_employee, customer_login, open_account, delete_account, send_money, withdraw, deposit, open_loan, pay_loan, loan_status, list_all_customer, cust_list_all_account

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',home,name='home'),
    path('user-profile/', user_profile, name='user-profile'),
    path('emp-login/',emp_login,name='emp-login'),
    path('mgr-login/',mgr_login,name='mgr-login'),
    path('cust-login/', customer_login, name='cust-login'),
    path('user-logout/',user_logout, name='user-logout'),
    path('emp/create-customer/', create_customer, name = 'create-customer'),
    path('emp/open-acc/', open_account, name = 'open-acc'),
    path('emp/del-acc/', delete_account, name = 'del-account'),
    path('mgr/create-emp/', create_employee, name='create-emp' ),
    path('emp/del-customer/',delete_customer, name = 'del-customer'),
    path('mgr/del-employee/',delete_employee, name = 'del-employee'),
    path('cust/send-money/', send_money, name='send-money'),
    path('cust/withdraw/', withdraw, name='withdraw'),
    path('cust/deposit/', deposit, name='deposit'),
    path('emp/open-loan/', open_loan, name='open-loan'),
    path('emp/pay-loan/', pay_loan, name='pay-loan' ),
    path('emp/loan-status/', loan_status, name = 'loan-status'),
    path('emp/ls-all-cust/', list_all_customer, name='ls-cust'),
    path('cust/ls-all-acc/',cust_list_all_account, name='cust-ls-acc')
]
