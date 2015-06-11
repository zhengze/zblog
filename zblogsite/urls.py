from django.conf.urls import patterns, include, url
import os
from zblogsite import settings

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^comments/', include('django.contrib.comments.urls')),
    url(r'^static/(?P<path>.*)$', 'django.views.static.serve',{'document_root': settings.base.STATIC_ROOT },name='static'),
    url(r'js/(?P<path>[\w\.\-]+\.js)$', 'django.views.static.serve',{'document_root':os.path.join(os.path.dirname(__file__),"./static/js")},name='js'),
    url(r'css/(?P<path>[\w\.\-]+\.css)$', 'django.views.static.serve',{'document_root':os.path.join(os.path.dirname(__file__),"./static/css")},name='css'),
    url(r'images/(?P<path>[\w+.\-]+\.*)$', 'django.views.static.serve',{'document_root':os.path.join(os.path.dirname(__file__),"./static/images/")},name='images'),
    url(r'fonts/(?P<path>[\w+.\-]+\.*)$', 'django.views.static.serve',{'document_root':os.path.join(os.path.dirname(__file__),"./static/fonts/")},name='fonts'),
)

urlpatterns += patterns('',
    # Examples:
    url(r'^$', include('zblog.urls')),
    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
