"""Detection_of_Depression URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from user import views as userviews
from admin import views as adminviews


urlpatterns = [
    url('admin/', admin.site.urls),

    url(r'^$',userviews.userlogin_page, name="userlogin_page"),

    url(r'^user_register/$',userviews.user_register, name="user_register"),
    url(r'^details/$',userviews.details, name="details"),
    url(r'^updatedetails/$',userviews.updatedetails, name="updatedetails"),
    url(r'^base/$', userviews.base,name="base"),
    url(r'^upload/$', userviews.upload,name="upload"),
    url(r'^feedback/$', userviews.feedback,name="feedback"),
    url(r'chart_page/(?P<chart_type>\w+)', userviews.chart_page, name="chart_page"),
    url(r'achart/(?P<achart>\w+)', userviews.achart, name="achart"),

    url(r'admin_loginpage/$', adminviews.admin_loginpage, name="admin_loginpage"),
    url(r'user_message/$', adminviews.user_message, name="user_message"),
    url(r'admin_viewpage/$', adminviews.admin_viewpage, name="admin_viewpage"),
    url(r'admin_viewfeedback/$', adminviews.admin_viewfeedback, name="admin_viewfeedback"),
    url(r'admin_viewtrending/$', adminviews.admin_viewtrending, name="admin_viewtrending"),
    url(r'admin_chart/(?P<admin_chart>\w+)', adminviews.admin_chart, name="admin_chart"),
    url(r'admin_diff_chart/(?P<admin_diff_chart>\w+)', adminviews.admin_diff_chart, name="admin_diff_chart"),





]
