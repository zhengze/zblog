from django.conf.urls import patterns, include, url
from . import views

urlpatterns = patterns('',
    url(r'^$', views.IndexView.as_view(), name='index'),    
    url(r'^article$', views.ArticleView.as_view(), name='article'),    
    url('^hello/$', views.hello),     
)
