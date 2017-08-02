# coding:utf8

from django.shortcuts import get_object_or_404, get_list_or_404
from django.core.urlresolvers import reverse
from django.db.models import F, Count
from django.views.generic import ListView, DetailView
from django.views.generic.base import ContextMixin
import markdown
from .models import (
    Article,
    Classify,
    Photo,
    Album,
    Music
)

class BaseContext(ContextMixin):

    def get_context_data(self, **kwargs):
        context = super(BaseContext, self).get_context_data(**kwargs)
        context['classifies'] = Classify.objects.extra(select={
            "article_count": """select COUNT(zblog_article.title) 
                        from zblog_article 
                        where zblog_classify.id = zblog_article.classify_id
                    """
        })
        context['hot_articles'] = get_list_or_404(Article.objects.order_by('-hits')[:10])
        return context


class IndexView(ListView, BaseContext):
    context_object_name = 'article_list'
    template_name = 'zblog/index.html'
    paginate_by = 10

    def get_queryset(self):
        article_list = Article.objects.all()
        for article in article_list:
            tags = [tag.name for tag in article.tags.all()]
            article.tags_text = ",".join(tags)
            article.content = markdown.markdown(article.content,)
        return article_list


class ArticleView(IndexView):
    template_name = 'zblog/article.html'


class ArticleDetailView(DetailView, BaseContext):
    template_name = 'zblog/article_detail.html'
    model = Article
    pk_url_kwarg = 'article_id'
    context_object_name = 'article'

    def get_object(self, queryset=None):
        article_id = int(self.kwargs.get(self.pk_url_kwarg, None))
        try:
            article = Article.objects.filter(pk=article_id)
            article.update(hits=F('hits')+1)
        except IndexError:
            return None
        return get_object_or_404(Article, pk=article_id)


class ArticleClassificationView(ListView, BaseContext):
    context_object_name = 'article_list'
    template_name = 'zblog/article_classification.html'
    pk_url_kwarg = 'classification_id'

    def get_queryset(self, **kwargs):
        classification_id = int(self.kwargs.get(self.pk_url_kwarg, None))
        classification = get_object_or_404(Classify, pk=classification_id)
        article_list = classification.article_set.all()
        return article_list


class AlbumView(IndexView):
    template_name = 'zblog/album.html'
    model = Album

    def get_context_data(self, **kwargs):
        context = super(AlbumView, self).get_context_data(**kwargs)
        context['album_list'] = Album.objects.extra(select={ \
            'photo_count':'select COUNT(zblog_photo.id) from zblog_photo \
            where zblog_album.id = zblog_photo.album_id'
        })
        return context


class PhotoView(IndexView):
    template_name = 'zblog/photos.html'
    model = Photo
    context_object_name = 'photo_list'

    def get_queryset(self, **kwargs):
        album_id = int(self.kwargs.get("album_id"))
        self.album = get_object_or_404(Album, pk=album_id)
        return self.album.photo_set.all()

    def get_context_data(self, **kwargs):
        context = super(PhotoView, self).get_context_data(**kwargs)
        context['album_obj'] = self.album
        context['classifies'] = Classify.objects.extra(select={\
            'article_count':'select COUNT(zblog_article.title) from zblog_article \
                where zblog_classify.id = zblog_article.classify_id'
        })
        context['hot_articles'] = Article.objects.order_by('-hits')[:10]
        return context


class OriginalPhotoView(PhotoView):
    template_name = 'zblog/original_photo.html'

    def get_context_data(self, **kwargs):
        context = super(OriginalPhotoView, self).get_context_data(**kwargs)
        photo_id = int(self.kwargs.get("photo_id"))
        context['album_obj'] = self.album
        query_photo = get_object_or_404(Photo, pk=photo_id)
        context['query_photo'] = query_photo
        return context


class MusicView(IndexView):
    template_name = 'zblog/music.html'
    model = Music

    def get_context_data(self, **kwargs):
        context = super(MusicView, self).get_context_data(**kwargs)
        context['music_obj'] = get_list_or_404(Music.objects.all()[:10])
        return context


class AboutView(IndexView):
    template_name = 'zblog/aboutme.html'


