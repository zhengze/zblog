from django.conf.urls import url

from apps.zblog.views import IndexView, ArticleView, ArticleDetailView, ArticleClassificationView, AlbumView, PhotoView, \
    OriginalPhotoView, MusicView, AboutView

urlpatterns = [
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^article$', ArticleView.as_view(), name='article'),
    url(r'^article/detail/(\d+)/$', ArticleDetailView.as_view(), name='article_detail'),
    url(r'^article/classification/(\d+)/$', ArticleClassificationView.as_view(), name='article_classification'),
    url(r'^album$', AlbumView.as_view(), name='album'),
    url(r'^photo/(\d+)/$', PhotoView.as_view(), name='photo'),
    url(r'^original_photo/(\d+)/(\d+)/$', OriginalPhotoView.as_view(), name='original_photo'),
    url(r'^music$', MusicView.as_view(), name='music'),
    url(r'^about$', AboutView.as_view(), name='about'),
]
