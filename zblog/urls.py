from django.conf.urls import patterns, include, url
from . import views

urlpatterns = patterns('',
    url(r'^$', views.IndexView.as_view(), name='index'),    
    url(r'^article$', views.ArticleView.as_view(), name='article'),    
    url(r'^article/detail/(\d+)/$', views.ArticleDetailView.as_view(), name='article_detail'),  
    url(r'^article/classification/(\d+)/$', views.ArticleClassificationView.as_view(), name='article_classification'),    
    url(r'^album$', views.AlbumView.as_view(), name='album'),    
    url(r'^photo/(\d+)/$', views.PhotoView.as_view(), name='photo'),    
    url(r'^original_photo/(\d+)/(\d+)/$', views.OriginalPhotoView.as_view(), name='original_photo'),    
    url(r'^music$', views.MusicView.as_view(), name='music'),    
    url(r'^about$', views.AboutView.as_view(), name='about'),    
)
