from django.db.models import Count
from django.shortcuts import render, redirect


# Create your views here.
from user.models import UserRegister_Model, UserFeedback_Model, UploadMessage_Model


def admin_loginpage(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        if email == 'admin' and password == 'admin' :
            return redirect('admin_viewpage')

    return render(request,'ADMINS/admin_loginpage.html')

def admin_viewpage(request):
    obj = UserRegister_Model.objects.all()
    return render(request,'ADMINS/admin_viewpage.html',{'object':obj})

def admin_viewfeedback(request):
    obj=UserFeedback_Model.objects.all()
    return render(request,'ADMINS/admin_viewfeedback.html',{'objects':obj})

def admin_viewtrending(request):
    topic = UploadMessage_Model.objects.values('topics').annotate(dcount=Count('topics')).order_by('-dcount')
    return  render(request,'ADMINS/admin_viewtrending.html',{'objects':topic})

def viewtreandingtopics(request,chart_type):
    chart = UploadMessage_Model.objects.values('topics').annotate(dcount=Count('topics')).order_by('-dcount')

    return render(request,'ADMINS/viewtreandingtopics.html', {'form':chart, 'chart_type':chart_type})

def admin_chart(request,admin_chart):
    chart = UploadMessage_Model.objects.values('topics').annotate(dcount=Count('topics'))
    return render(request,'ADMINS/admin_chart.html',{'admin_chart':admin_chart,'objects':chart})

def admin_diff_chart(request, admin_diff_chart):
    achart_type = UploadMessage_Model.objects.values('topics').annotate(dcount= Count('topics'))
    return render(request,'ADMINS/admin_diff_chart.html',{'admin_diff_chart':admin_diff_chart, 'objects':achart_type})

def user_message(request):
    obj = UploadMessage_Model.objects.all()
    return render(request,'ADMINS/user_message.html',{'object':obj})