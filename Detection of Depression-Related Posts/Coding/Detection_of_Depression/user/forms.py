from django import forms

from user.models import UserRegister_Model


class UserRegister_Form(forms.ModelForm):
    class Meta:
        model :UserRegister_Model
        fields = ['firstname','lastname','password','gender','email','Phone','question','answer']