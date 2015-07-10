#coding:utf8

from django.shortcuts import get_object_or_404, render
from django.core.urlresolvers import reverse
from django.db.models import F, Count
from django.views.generic import ListView
from .models import Article, Classify, Photo, PhotoClassify

class IndexView(ListView):
    model = Article
    context_object_name = 'article_list'
    template_name = 'zblog/index.html'
    paginate_by = 10
    def get_context_data(self, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        context['classifies'] = Classify.objects.extra(select={\
            'article_count':'select COUNT(zblog_article.title) from zblog_article \
                where zblog_classify.id = zblog_article.classify_id'
                #join zblog_classify as c \
                #on a.classify_id = c.id \
                #group by c.name'
        })
            
        context['hot_articles'] = Article.objects.order_by('-hits')[:10]
        return context       

class ArticleView(IndexView):
    template_name = 'zblog/article.html'
    #model = Article
    #context_object_name = 'article_list'
    #paginate_by = 10
    #def get_context_data(self, **kwargs):
    #    context = super(ArticleView, self).get_context_data(**kwargs)
    #    context['classifies'] = Classify.objects.extra(select={\
    #        'article_count':'select COUNT(zblog_article.title) from zblog_article \
    #            where zblog_classify.id = zblog_article.classify_id'
    #    })
    #    context['hot_articles'] = Article.objects.order_by('-hits')[:10]
    #    return context
        
class ArticleDetailView(IndexView):
    template_name = 'zblog/article_detail.html'
    #model = Article
    #context_object_name = 'article_list'
    #def get_context_data(self, **kwargs):
    #    context = super(ArticleDetailView, self).get_context_data(**kwargs)
    #    context['classifies'] = Classify.objects.all()
    #    return context
    def get_queryset(self):
        #article = Article.objects.get(pk=self.args[0])
        #article.hits += 1
        #article.save()
        #article.hits = F('hits') + 1
        #article.save()
        Article.objects.filter(pk=self.args[0]).update(hits=F('hits')+1)
        return Article.objects.filter(pk=self.args[0])

class ArticleClassificationView(IndexView):
    model = Classify
    context_object_name = 'article_list'
    template_name = 'zblog/article_classification.html'    
    #paginate_by = 10
    #def get_context_data(self, **kwargs):
    #    context = super(ArticleClassificationView, self).get_context_data(**kwargs)
    #    context['classifies'] = Classify.objects.all()
    #    return context
    def get_queryset(self):
        classification = Classify.objects.get(pk=self.args[0])
        return classification.article_set.all()


class PhotoView(IndexView):
    template_name = 'zblog/photos.html'
    model = Photo
    #context_object_name = 'photo_list'
    #def get_context_data(self, **kwargs):
    #    context = super(PhotoView, self).get_context_data(**kwargs)
    #    context['photo_classifies'] = PhotoClassify.objects.all()
    #    context['classifies'] = Classify.objects.extra(select={\
    #        'article_count':'select COUNT(zblog_article.title) from zblog_article \
    #            where zblog_classify.id = zblog_article.classify_id'
    #    })
    #    context['hot_articles'] = Article.objects.order_by('-hits')[:10]
    #    return context

class MusicView(IndexView):
    template_name = 'zblog/music.html'
    model = Article
    #def get_context_data(self, **kwargs):
    #    context = super(MusicView, self).get_context_data(**kwargs)
    #    context['classifies'] = Classify.objects.extra(select={\
    #        'article_count':'select COUNT(zblog_article.title) from zblog_article \
    #            where zblog_classify.id = zblog_article.classify_id'
    #    })
    #    context['hot_articles'] = Article.objects.order_by('-hits')[:10]
    #    return context

class AboutView(IndexView):
    template_name = 'zblog/aboutme.html'
    #model = Article
    #def get_context_data(self, **kwargs):
    #    context = super(AboutView, self).get_context_data(**kwargs)
    #    context['classifies'] = Classify.objects.extra(select={\
    #        'article_count':'select COUNT(zblog_article.title) from zblog_article \
    #            where zblog_classify.id = zblog_article.classify_id'
    #    })
    #    context['hot_articles'] = Article.objects.order_by('-hits')[:10]
    #    return context

