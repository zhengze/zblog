from django.conf.urls import patterns, include, url
from . import views

urlpatterns = patterns('',
    url(r'^$', views.IndexView.as_view(), name='index'),    
    url(r'^article$', views.ArticleView.as_view(), name='article'),    
    url(r'^article/detail/(\d+)/$', views.ArticleDetailView.as_view(), name='article_detail'),    
    url(r'^picture$', views.PictureView.as_view(), name='picture'),    
    url(r'^music$', views.MusicView.as_view(), name='music'),    
    url(r'^about$', views.AboutView.as_view(), name='about'),    
)
