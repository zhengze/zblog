#coding:utf8

from django.shortcuts import get_object_or_404, render
from django.core.urlresolvers import reverse
from django.views.generic import ListView
from .models import Article, Classify

class IndexView(ListView):
    model = Article
    context_object_name = 'article_list'
    template_name = 'zblog/index.html'
    paginate_by = 10
    def get_context_data(self, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        context['classifies'] = Classify.objects.all()
        return context

class ArticleView(ListView):
    model = Article
    template_name = 'zblog/article.html'

class ArticleDetailView(ListView):
    model = Article
    context_object_name = 'article_list'
    template_name = 'zblog/article_detail.html'
    def get_context_data(self, **kwargs):
        context = super(ArticleDetailView, self).get_context_data(**kwargs)
        context['classifies'] = Classify.objects.all()
        return context
    def get_queryset(self):
        return Article.objects.filter(pk=self.args[0])

class PictureView(ListView):
    model = Article
    template_name = 'zblog/picture.html'

class MusicView(ListView):
    model = Article
    template_name = 'zblog/music.html'

class AboutView(ListView):
    model = Article
    template_name = 'zblog/aboutme.html'

