#coding:utf8

from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.views import generic
from .models import Article
from django.shortcuts import render_to_response

def index(request):
    return render_to_response('zblog/index.html')
class IndexView(generic.ListView):
    model = Article
    template_name = 'zblog/index.html'

class ArticleView(generic.ListView):
    model = Article
    template_name = 'zblog/article.html'

class PictureView(generic.ListView):
    model = Article
    template_name = 'zblog/picture.html'

class MusicView(generic.ListView):
    model = Article
    template_name = 'zblog/music.html'

class AboutView(generic.ListView):
    model = Article
    template_name = 'zblog/aboutme.html'

