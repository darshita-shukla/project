from django.db import models

# Create your models here.
from django.db.models import CASCADE


class UserRegister_Model(models.Model):
    firstname = models.CharField(max_length=20)
    lastname = models.CharField(max_length=20)
    password = models.CharField(max_length=20)
    gender = models.CharField(max_length=1)
    email = models.EmailField(max_length=50)
    Phone = models.IntegerField(max_length=10)
    question = models.CharField(max_length=1)
    answer = models.CharField(max_length=50)

class UploadMessage_Model(models.Model):
    userId = models.ForeignKey(UserRegister_Model, on_delete=CASCADE)
    message = models.CharField(max_length=500)
    topics = models.CharField(max_length=300)
    sentiment = models.CharField(max_length=300)

class UserFeedback_Model(models.Model):
    name = models.CharField(max_length=100)
    mobilenumber = models.CharField(max_length=100)
    feedback = models.CharField(max_length=300)


