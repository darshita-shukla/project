import re
from django.db.models import Q, Count

from django.shortcuts import render, redirect, get_object_or_404

# Create your views here.
from odf import chart

from user.forms import UserRegister_Form
from user.models import UserRegister_Model, UploadMessage_Model, UserFeedback_Model


def base(request):
    return render(request,'USERS/base.html')

def user_register(request):
    if request.method == "POST":
        firstname= request.POST.get('firstname')
        lastname= request.POST.get('lastname')
        password= request.POST.get('password')
        gender= request.POST.get('gender')
        email= request.POST.get('email')
        Phone= request.POST.get('Phone')
        question= request.POST.get('question')
        answer= request.POST.get('answer')
        UserRegister_Model.objects.create(firstname=firstname,lastname=lastname,password=password,gender=gender,email=email,Phone=Phone,question=question,answer=answer)
        return redirect('userlogin_page')


    return render(request,'USERS/user_register.html')

def userlogin_page(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            check = UserRegister_Model.objects.get(email=email, password=password)
            request.session['name']= check.id
            return redirect("updatedetails")
        except:
            pass

    return render(request,'USERS/userlogin_page.html')

def details(request):
    name = request.session['name']
    obj= UserRegister_Model.objects.get(id=name)



    return render(request,'USERS/details.html',{'object':obj})

def updatedetails(request):
    name = request.session['name']
    objects = UserRegister_Model.objects.get(id=name)
    if request.method =="POST":
        firstname = request.POST.get('firstname')
        lastname = request.POST.get('lastname')
        password = request.POST.get('password')
        email = request.POST.get('email')


        obj= get_object_or_404(UserRegister_Model, id=name)
        obj.firstname = firstname
        obj.lastname = lastname
        obj.password = password
        obj.email = email

        obj.save(update_fields=['firstname','lastname','password','email'])
        return redirect('details')



    return render(request,'USERS/updatedetails.html',{'obj':objects})

def upload(request):
    name = request.session['name']
    obj = UserRegister_Model.objects.get(id=name)
    detect1=[]
    detect2,detect3,detect4,detect5,detect6,detect7,detect8 = [],[],[],[],[],[],[]

    ans = ''

    if request.method == "POST":
        message= request.POST.get('message')

        splt = (re.findall(r"[\w']+", str(message)))

        for f in splt:
            if f in ('boss','boring','broke','company','fired','handjob','jobless','pay','money','quit','stress','left','time','unemployed','unhappy','want','work','year'):
                detect1.append(f)
            elif f in ('alwasy','better','die','depressed','feeling','hate','isolate','long','mind','meaning','guilt','myself','negative','over', 'month','pain','suffer','something','thoughts',):
                detect2.append(f)
            elif f in ('abusive','bullied','burden','cant','hurt','ill','live','loneliness','mentally','myself','neg', 'thought','sleep','started','time','think','wrong', 'one','world','wanted'):
                detect3.append(f)
            elif f in ('best','date','dude','chill','care','encourage','happy','help','insecure','relationships','spend','support','no friends','roommate','request','unflow','worthlsess',):
                detect4.append(f)
            elif f in ('find','help','heartbroken','emotional','inside' ,'lost','love','marriage','often','relationship','rejected','spouse','together','sex','problems','ugly'):
                detect5.append(f)
            elif f in ('break','death','drunk','damn','die','done','exercise','long','lonely','pain','kill' ,'me','removed','phone','stupid','shit','school','sleep','suck','text','treatment'):
                detect6.append(f)
            elif f in ('alone','break','blame','depressed','deserve', 'better','deserve', 'unhappy','die','escape','distraction','nobody','feel','alone','feel','depressed','felt' ,'pain','fuck' ,'dont','hate','hurt','loneliness','mine','myself','reject' ,'love','safe','shit','sucks','no' ,'job','painful','pressure','too', 'worried','unsuccessful','ugly','uncomfortable','winter','worry','worth','wrong' ,'life'):
                detect7.append(f)
            elif f in ('awesome','aunts','believe','beautiful','close','advice','cooking','cousins','dont' ,'care','encourage','family','logical', 'person','got' ,'married','i' ,'do','better','mom','peace','parents','spend' ,'time','new' 'friends','right','funny','need','thankfully','uncles','soul','friends','work','weekend','movie','potential','texted','me','too','good',):
                detect8.append(f)

        if len(detect1) > len(detect2) and len(detect1) > len(detect3) and len(detect1) > len(detect4) and len(detect1) > len(detect5) and len(detect1) > len(detect6) and len(detect1) > len(detect7) and len(detect1) > len(detect8):
            ans = "Job"
        elif len(detect2) > len(detect1) and len(detect2) > len(detect3) and len(detect2) > len(detect4) and len(detect2) > len(detect5) and len(detect2) > len(detect6) and len(detect2) > len(detect7) and len(detect2) > len(detect8):
            ans = "Depression"
        elif len(detect3) > len(detect2) and len(detect3) > len(detect1) and len(detect3) > len(detect4) and len(detect3) > len(detect5) and len(detect3) > len(detect6) and len(detect3) > len(detect7) and len(detect3) > len(detect8):
            ans ="Tired"
        elif len(detect4) > len(detect2) and len(detect4) > len(detect3) and len(detect4) > len(detect1) and len(detect4) > len(detect5) and len(detect4) > len(detect6) and len(detect4) > len(detect7) and len(detect4) > len(detect8):
            ans = "Friends"
        elif len(detect5) > len(detect2) and len(detect5) > len(detect3) and len(detect5) > len(detect4) and len(detect5) > len(detect1) and len(detect5) > len(detect6) and len(detect5) > len(detect7) and len(detect5) > len(detect8):
            ans = "Broke"
        elif len(detect6) > len(detect2) and len(detect6) > len(detect3) and len(detect6) > len(detect4) and len(detect6) > len(detect5) and len(detect6) > len(detect1) and len(detect6) > len(detect7) and len(detect6) > len(detect8):
            ans ="Free"
        elif len(detect7) > len(detect2) and len(detect7) > len(detect3) and len(detect7) > len(detect4) and len(detect7) > len(detect5) and len(detect7) > len(detect6) and len(detect7) > len(detect1) and len(detect7) > len(detect8):
            ans = "Depression-Indicative Posts"
        elif len(detect8) > len(detect2) and  len(detect8) > len(detect3) and len(detect8) > len(detect4) and len(detect8) > len(detect5) and len(detect8) > len(detect6) and len(detect8) > len(detect7) and len(detect8) > len(detect1):
            ans = "Standard Posts"
        else:
            ans = "indicative Posts"
        UploadMessage_Model.objects.create(userId=obj,message=message,topics=ans,sentiment="default")



    return render(request,'USERS/upload.html')

def chart_page(request,chart_type):
    chart = UploadMessage_Model.objects.values('topics').annotate(dcount=Count('topics'))
    return render(request,'Users/chart_page.html',{'chart_type':chart_type,'objects':chart})

def achart(request, achart):
    achart_type = UploadMessage_Model.objects.values('topics').annotate(dcount= Count('topics'))
    return render(request,'USERS/achart.html',{'achart':achart, 'objects':achart_type})

def feedback(request):
    if request.method == "POST":
        name = request.POST.get('name')
        mobilenumber = request.POST.get('mobilenumber')
        feedback = request.POST.get('feedback')
        UserFeedback_Model.objects.create(name=name,mobilenumber=mobilenumber,feedback=feedback)

    return render(request,'USERS/feedback.html')
