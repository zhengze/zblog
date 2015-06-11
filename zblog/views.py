#coding:utf8

from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.views import generic
from .models import Article

class IndexView(generic.ListView):
    model = Article
    template_name = 'zblog/index.html'

def hello(request):
    return HttpResponse("hello world")

