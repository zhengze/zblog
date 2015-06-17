#coding:utf8

from django.shortcuts import get_object_or_404, render
from django.core.urlresolvers import reverse
from django.views import generic
from .models import Article, Classify

class IndexView(generic.ListView):
    model = Article
    context_object_name = 'article'
    template_name = 'zblog/index.html'
    paginate_by = 10
    def get_context_data(self, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        context['classifies'] = Classify.objects.all()
        return context
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

