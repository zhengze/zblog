#coding:utf8

from django.shortcuts import get_object_or_404, render
from django.core.urlresolvers import reverse
from django.views.generic import ListView
from .models import Article, Classify, Photo, PhotoClassify

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
    context_object_name = 'article_list'
    template_name = 'zblog/article.html'
    paginate_by = 10
    def get_context_data(self, **kwargs):
        context = super(ArticleView, self).get_context_data(**kwargs)
        context['classifies'] = Classify.objects.all()
        return context
        
class ArticleDetailView(ListView):
    model = Article
    context_object_name = 'article_list'
    template_name = 'zblog/article_detail.html'
    def get_context_data(self, **kwargs):
        context = super(ArticleDetailView, self).get_context_data(**kwargs)
        context['classifies'] = Classify.objects.all()
        return context
    def get_queryset(self):
        article = Article.objects.get(pk=self.args[0])
        article.hits += 1
        article.save()
        return Article.objects.filter(pk=self.args[0])

class ArticleClassificationView(ListView):
    model = Classify
    context_object_name = 'article_list'
    template_name = 'zblog/article_classification.html'    
    paginate_by = 10
    def get_context_data(self, **kwargs):
        context = super(ArticleClassificationView, self).get_context_data(**kwargs)
        context['classifies'] = Classify.objects.all()
        return context
    def get_queryset(self):
        classification = Classify.objects.get(pk=self.args[0])
        return classification.article_set.all()


class PhotoView(ListView):
    model = Photo
    context_object_name = 'photo_list'
    template_name = 'zblog/photos.html'
    def get_context_data(self, **kwargs):
        context = super(PhotoView, self).get_context_data(**kwargs)
        context['photo_classifies'] = PhotoClassify.objects.all()
        return context

class MusicView(ListView):
    model = Article
    template_name = 'zblog/music.html'

class AboutView(ListView):
    model = Article
    template_name = 'zblog/aboutme.html'

