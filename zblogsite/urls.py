from django.conf.urls import include, url
from django.contrib import admin
from django.views.static import serve

from zblogsite.settings.base import MEDIA_ROOT

admin.autodiscover()

urlpatterns = [
    # Examples:
    url(r'^', include('apps.zblog.urls')),
    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    # Uncomment the next line to enable the admin:
    url(r'^admin/', admin.site.urls),
]

urlpatterns += [
    #url(r'^static/(?P<path>.*)$', 'django.views.static.serve',{'document_root': settings.base.STATIC_ROOT },name='static'),
    url(r'^media/(?P<path>.*)$', serve,{'document_root': MEDIA_ROOT },name='media'),
    #url(r'js/(?P<path>[\w\.\-]+\.js)$', 'django.views.static.serve',{'document_root':os.path.join(os.path.dirname(__file__),"./static/js")},name='js'),
    #url(r'css/(?P<path>[\w\.\-]+\.css)$', 'django.views.static.serve',{'document_root':os.path.join(os.path.dirname(__file__),"./static/css")},name='css'),
    #url(r'images/(?P<path>[\w+.\-]+\.*)$', 'django.views.static.serve',{'document_root':os.path.join(os.path.dirname(__file__),"./static/images/")},name='images'),
    #url(r'fonts/(?P<path>[\w+.\-]+\.*)$', 'django.views.static.serve',{'document_root':os.path.join(os.path.dirname(__file__),"./static/fonts/")},name='fonts'),
]
#urlpatterns+static(settings.base.STATIC_URL,document_root=settings.base.STATIC_ROOT)
#urlpatterns+static(settings.base.MEDIA_URL,document_root=settings.base.MEDIA_ROOT)
