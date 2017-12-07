# coding:utf8

from django.shortcuts import get_object_or_404, get_list_or_404
from django.http import Http404
from django.core.urlresolvers import reverse
from django.core.cache import caches
from django.db.models import F, Count
from django.views.generic import ListView, DetailView
from django.views.generic.base import ContextMixin
import markdown
import logging
from .models import (
    Article,
    Category,
    Photo,
    Album,
    Music
)


# 缓存
try:
    cache = caches['memcache']
except ImportError as e:
    cache = caches['default']

# logger
logger = logging.getLogger(__name__)


class BaseContext(ContextMixin):

    def get_context_data(self, **kwargs):
        try:
            context = super(BaseContext, self).get_context_data(**kwargs)
            if Article.objects.exists():
                categories = Category.objects.annotate(article_count=Count("article"))
            else:
                categories = None
                
            
            # classifies = Classify.objects.extra(select={
            #     "article_count": """select COUNT(zblog_article.title)
            #                 from zblog_article
            #                 where zblog_classify.id = zblog_article.classify_id
            #             """
            # })
            context['categories'] = categories if categories else None
            context['hot_articles'] = get_list_or_404(Article.objects.order_by('-hits')[:10])
            return context
        except Exception as e:
            logger.error("error msg:", e)
            return None


class IndexView(ListView, BaseContext):
    context_object_name = 'article_list'
    template_name = 'zblog/index.html'
    #paginate_by = 10

    def get_queryset(self):
        article_list = Article.objects.all()
        if not article_list:
            return None
        for article in article_list:
            tags = list(article.tags.values_list("name", flat=True))
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
    slug_field = 'title'

    def get(self, request, *args, **kwargs):
        # 统计文章的访问访问次数
        if 'HTTP_X_FORWARDED_FOR' in request.META:
            ip = request.META['HTTP_X_FORWARDED_FOR']
        else:
            ip = request.META['REMOTE_ADDR']

        article_id = self.kwargs.get(self.pk_url_kwarg, None)
        en_title = self.kwargs.get('slug')

        # 获取15*60s时间内访问过这篇文章的所有ip
        visited_ips = cache.get(en_title, [])

        # 如果ip不存在就把文章的浏览次数+1
        if ip not in visited_ips:
            try:
                # article = self.queryset.get(article_id=en_title)
                article = get_object_or_404(Article, pk=article_id)
            except Article.DoesNotExist:
                logger.error(u'[ArticleDetailView]访问不存在的文章:[%s]' % article)
                raise Http404
            else:
                article.hits += 1
                article.save()
                # article.update(hits=F('hits') + 1)
                visited_ips.append(ip)

            # 更新缓存
            cache.set(en_title, visited_ips, 15 * 60)

        return super(ArticleDetailView, self).get(request, *args, **kwargs)

    def get_object(self, queryset=None):
        article_id = int(self.kwargs.get(self.pk_url_kwarg, None))
        try:
            # article = Article.objects.filter(pk=article_id)
            # article.update(hits=F('hits')+1)
            article = get_object_or_404(Article, pk=article_id)
        except IndexError:
            return None
        return article


class ArticleCategoryView(ListView, BaseContext):
    context_object_name = 'article_list'
    template_name = 'zblog/article_classification.html'
    pk_url_kwarg = 'classification_id'

    def get_queryset(self, **kwargs):
        classification_id = int(self.kwargs.get(self.pk_url_kwarg, None))
        classification = get_object_or_404(Category, pk=classification_id)
        article_list = classification.article_set.all()
        return article_list


class AlbumView(IndexView):
    template_name = 'zblog/album.html'
    model = Album

    def get_context_data(self, **kwargs):
        context = super(AlbumView, self).get_context_data(**kwargs)
        if not Album.objects.exists():
            return None
        albums = Album.objects.extra(select={
            'photo_count': """select COUNT(zblog_photo.id) from zblog_photo 
            where zblog_album.id = zblog_photo.album_id
            """
        })
        
        context["album_list"] = albums
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
        categories = Category.objects.annotate(article_count=Count("article"))
        # context['classifies'] = Category.objects.extra(select={
        #     'article_count':'select COUNT(zblog_article.title) from zblog_article \
        #         where zblog_classify.id = zblog_article.classify_id'
        # })
        context["categories"] = categories
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


